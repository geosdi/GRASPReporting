﻿/*
 *GRASP(Geo-referential Real-time Acquisition Statistics Platform) Reporting Tool <http://www.brainsen.com>
 * Developed by Brains Engineering s.r.l (marco.giorgi@brainsen.com)
 * This file is part of GRASP Reporting Tool.  
 *  GRASP Reporting Tool is free software: you can redistribute it and/or modify it
 *  under the terms of the GNU Lesser General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or (at
 *  your option) any later version.  
 *  GRASP Reporting Tool is distributed in the hope that it will be useful, but
 *  WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser  General Public License for more details.  
 *  You should have received a copy of the GNU Lesser General Public License
 *  along with GRASP Reporting Tool. 
 *  If not, see <http://www.gnu.org/licenses/>
 */

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Linq.Dynamic;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ionic.Zip;
/// <summary>
/// Shows the settings for the export of the forms
/// </summary>
public partial class Admin_Surveys_ExportSettings : System.Web.UI.Page
{
    public string formID = "";
    public string name = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if(Utility.VerifyAccess(Request))
        {
            if(Request["FormID"] != null && Request["FormID"] != "")
            {
                Page.Server.ScriptTimeout = 3100;
                formID = Request["FormID"];
                name = Request["FormName"];
                if(!IsPostBack)
                {
                    if(Request["fc"] != null && Request["fc"] != "")
                    {
                        hdnFilterCount.Value = Request["fc"].ToString();
                    }
                    if(Request["f"] != null && Request["f"] != "")
                    {
                        hdnFilter.Value = Request["f"].ToString();
                    }
                    if(Request["fs"] != null && Request["fs"] != "")
                    {
                        lblFilterSummary.Text = Server.HtmlDecode(Server.UrlDecode(Request["fs"].ToString()));
                        filterSummary.Visible = true;
                        hdnFilterByName.Value = lblFilterSummary.Text.Replace("<br/>", " AND ");
                    }
                }
            }
        }
        else
        {
            Response.Write("<h3>Access Denied</h3>");
            Response.End();
        }

    }
    protected void btnExport_Click(object sender, EventArgs e)
    {
        if(Request["FormID"] != null || Request["FormID"] != "")
        {
            int formID = Convert.ToInt32(Request["FormID"]);
            string separator = ddlCharacter.SelectedValue;
            int responseStatus = Convert.ToInt32(ddlReviewStatus.SelectedValue);
            int startFormResponseID = 0;
            string filterCount = "";
            string filter = "";

            Server.ScriptTimeout = 3100;

            if(txtStartFromResponseID.Text != "")
            {
                Int32.TryParse(txtStartFromResponseID.Text, out startFormResponseID);
            }

            if(hdnFilterCount.Value != "")
            {
                filterCount = hdnFilterCount.Value;
            }
            if(hdnFilter.Value != "")
            {
                filter = Server.UrlDecode(hdnFilter.Value);
            }



            //Create Filename and Path
            string folderPath = HttpContext.Current.Server.MapPath("~/Temp/");
            if(!Directory.Exists(folderPath))
            {
                Directory.CreateDirectory(folderPath);
            }
            string folderName = DateTime.Now.ToString("MMddHHmmss") + "_" + formID;
            folderPath = folderPath + folderName;
            string url = "../temp/" + folderName;
            Directory.CreateDirectory(folderPath);

            ExportRepeatables(formID, startFormResponseID, null, "", folderPath, separator, filter, filterCount, responseStatus);
            ExportSurveys(formID, folderPath, separator);
            ExportData(formID, startFormResponseID, null, "", folderPath, separator, filter, filterCount, responseStatus);
            ExportFieldMapping(formID, folderPath, separator);
            string fileName = createZip(folderPath, "Export_Form" + formID.ToString() + "_" + DateTime.Now.ToString("MMddHHmmss"));

            litDownloadExport.Text = "<a href=\"" + url + "/" + fileName + "\">The Export is ready! Download it here.</a>";
            pnlExportSettings.Visible = false;
        }

        try
        {

        }
        catch(Exception ex)
        {
            //Utility.writeErrorLog(ex.Message);
            //System.IO.DirectoryInfo tempDir = new DirectoryInfo(Server.MapPath("~/Temp/"));

            //foreach (FileInfo file in tempDir.GetFiles())
            //{
            //    file.Delete();
            //}
        }
    }




    public void ExportData(int formID, int startFormResponseID, DateTime? fromDate, string senderMsisdn,
        string filePath, string separator, string filter, string filterCount, int responseStatusID)
    {
        string responseStatusFilter = "";
        string sqlCmd = "";
        string columnList = "";

        StringBuilder sb = new StringBuilder();
        StringBuilder sbColHeader = new StringBuilder();
        //Build columnList using PIVOT

        GRASPEntities db = new GRASPEntities();
        //sqlCmd = "SELECT STUFF((SELECT distinct ',' + QUOTENAME( cast( (1000 + positionIndex) as varchar(10) ) + '_' + name " +
        //            " + CAST(ROW_NUMBER() OVER(PARTITION BY FormResponseID, formFieldId, value ORDER BY (1000 + positionIndex)) AS VARCHAR(5))) " +
        //            "from FormFieldResponses " +
        //            "WHERE type!='SEPARATOR' AND type!='TRUNCATED_TEXT' AND type!='WRAPPED_TEXT' AND type!='REPEATABLES_BASIC' AND type!='REPEATABLES' AND " +
        //            "      RVRepeatCount=0 AND parentForm_id=" + formID +
        //            " order by 1 " +
        //            "FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)') ,1,1,'')";

        Stopwatch stopWatch = new Stopwatch();
        stopWatch.Start();
        // db.Database.SqlQuery<string>(sqlCmd).FirstOrDefault();

        var fieldList = (from ff in db.FormFieldExport
                         where ff.form_id == formID && ff.type != "SEPARATOR" && ff.type != "TRUNCATED_TEXT" &&
                            ff.type != "WRAPPED_TEXT" && ff.type != "REPEATABLES_BASIC" && ff.type != "REPEATABLES" &&
                            ff.FormFieldParentID == null
                         select new { ff.name, ff.positionIndex }).Union(
                                       from fe in db.FormFieldExt
                                       where fe.FormID == formID
                                       select new { name = fe.FormFieldExtName, positionIndex = fe.PositionIndex.Value });

        foreach(var f in fieldList.OrderBy(o => o.positionIndex))
        {
            sb.Append("[" + (1000 + f.positionIndex).ToString() + "_" + f.name + "1],");
            sbColHeader.Append(f.name + separator);
        }
        columnList = sb.ToString();
        columnList = columnList.Substring(0, columnList.Length - 1);
        sb.Clear();

        TimeSpan ts = stopWatch.Elapsed;
        string elapsedTime = String.Format("{0:00}:{1:00}:{2:00}.{3:000}", ts.Hours, ts.Minutes, ts.Seconds, ts.Milliseconds);
        Debug.WriteLine("1: " + elapsedTime);

        db.Dispose();

        //Build ColumnHeader to use in the CSV file.
        string columnHeader = sbColHeader.ToString();

        //columnHeader = columnHeader.Substring(0, columnHeader.Length - 1);
        //string[] colList = columnList.Split(',');
        //for(int i = 0; i < colList.Length; i++)
        //{
        //    columnHeader += colList[i].Substring(6, colList[i].Length - 8) + separator;
        //}
        columnHeader = "FormResponseID" + separator + "FRCreateDate" + separator + "senderMsisdn" + separator +
            columnHeader.Substring(0, columnHeader.Length - 1);


        if(responseStatusID > 0)
        {
            responseStatusFilter = " AND ResponseStatusID = " + responseStatusID.ToString();
        }

        //Export Responses Data

        sqlCmd = "SELECT * FROM (SELECT FormResponseID,CONVERT(char, FRCreateDate,126) AS FRCreateDate,senderMsisdn," + columnList + " FROM " +
             "(SELECT FormResponseID,value,FRCreateDate,senderMsisdn, ( (cast( (1000 + positionIndex) as varchar(10) ) + '_' + name " +
             "+ CAST( ROW_NUMBER() OVER(PARTITION BY FormResponseID, formFieldId, value ORDER BY (1000 + positionIndex)) AS VARCHAR(5)))" +
             ") fn FROM FormFieldResponses " +
             "WHERE type != 'SEPARATOR' AND type != 'TRUNCATED_TEXT' AND type!='WRAPPED_TEXT' AND type!='REPEATABLES_BASIC' AND type!='REPEATABLES' AND " +
             "      RVRepeatCount=0 AND parentForm_id=" + formID + " AND FormResponseID>" + startFormResponseID + responseStatusFilter +
             ") x pivot ( max(value) for fn in (" + columnList + ") ) p) AS X";

        //var result = db.Database.SqlQuery<IEnumerable<string>>(sqlCmd).ToList();


        SqlConnection sqlConnection1 = new SqlConnection(System.Configuration.ConfigurationManager.
                                                        ConnectionStrings["GRASP_MemberShip"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader reader;

        
        cmd.CommandTimeout = 3000;
        cmd.CommandText = sqlCmd;
        cmd.CommandType = CommandType.Text;
        cmd.Connection = sqlConnection1;

        sqlConnection1.Open();

        reader = cmd.ExecuteReader();

        // Data is accessible through the DataReader object here.
        if(filter.Length != 0)
        {
            using(db = new GRASPEntities())
            {
                int fc = Convert.ToInt32(filterCount);
                var respUnion = (from r in db.ResponseValue
                                 from fr in db.FormResponse
                                 where fr.id == r.FormResponseID && fr.parentForm_id == 1
                                 select new { FormResponseID = r.FormResponseID.Value, Value = r.value, nvalue = r.nvalue.Value, formFieldID = r.formFieldId.Value }).Union(
                 from re in db.ResponseValueExt
                 from fr in db.FormResponse
                 where fr.id == re.FormResponseID && fr.parentForm_id == 1
                 select new { FormResponseID = re.FormResponseID, Value = "", nvalue = re.nvalue.Value, formFieldID = re.FormFieldID.Value });

                var filteredResponseIDs = (from r in respUnion.Where(filter)
                                           group r by r.FormResponseID into grp
                                           where grp.Count() == fc
                                           select grp.Key).ToList();

                while(reader.Read())
                {
                    int respID = reader.GetInt32(0);
                    if(filteredResponseIDs.Contains(respID))
                    {
                        sb.Append(ReadSingleRow((IDataRecord)reader, separator));
                    }
                }
            }
        }
        else
        {
            while(reader.Read())
            {
                sb.Append(ReadSingleRow((IDataRecord)reader, separator));
            }
        }

        string fileName = "\\" + DateTime.Now.ToString("yyyyMMdd-HHmm") + "_Form-" + formID.ToString() + ".csv";
        using(System.IO.StreamWriter file = new System.IO.StreamWriter(filePath + fileName, true, Encoding.UTF8))
        {
            file.WriteLine(columnHeader + ("\r\n" + sb.ToString()));
        }

        //Explicit obj close&destroy
        reader.Close();
        reader.Dispose();
        sqlConnection1.Close();
        sqlConnection1.Dispose();

    }

    private void ExportSurveys(int formID, string filePath, string separator)
    {
        //Export Survey
        string surveyFilePath = "";
        string fileContent = "";
        int sid = 0;

        GRASPEntities db = new GRASPEntities();

        var surveyList = (from sl in db.SurveyListAPI
                          from ff in db.FormField
                          where ff.survey_id != null && sl.id == ff.survey_id && ff.form_id == formID
                          orderby sl.id, sl.positionIndex
                          select new
                          {
                              id = (int)sl.id,
                              name = sl.name,
                              value = sl.value,
                              positionIndex = sl.positionIndex,
                              fieldName = ff.name
                          }).Distinct().OrderBy(s => s.id).ThenBy(s => s.positionIndex);

        foreach(var s in surveyList)
        {
            if(sid != (int)s.id)
            {
                //new list
                if(fileContent.Length > 0)
                {
                    WriteTextFile(fileContent, surveyFilePath);
                }
                fileContent = "";
            }
            sid = (int)s.id;

            surveyFilePath = filePath + "\\Survey" + sid.ToString() + "_" + s.fieldName + ".csv";
            fileContent += s.positionIndex.ToString() + separator + s.value + "\r\n";
        }
        if(fileContent.Length > 0)
        {
            WriteTextFile(fileContent, surveyFilePath);
        }
    }
    private void ExportFieldMapping(int formID, string filePath, string separator)
    {
        StringBuilder sb = new StringBuilder();
        GRASPEntities db = new GRASPEntities();
        int prevID = 0;

        var repeatables = (from r in db.ResponseRepeatable
                           where r.parentForm_id == formID && r.RVRepeatCount == 1
                           select new { r.ParentFormFieldID, r.name, r.label, r.positionIndex }).Distinct().OrderBy(o => o.positionIndex);
        foreach(var r in repeatables)
        {
            if(prevID != 0 && prevID != (int)r.ParentFormFieldID && sb.Length > 0)
            {
                WriteTextFile(sb.ToString(), filePath + "\\FieldsMapping-Repeatable" + prevID.ToString() + ".csv");
                sb.Clear();
            }
            sb.Append(r.name + separator + r.label + "\r\n");
            prevID = (int)r.ParentFormFieldID;
        }
        if(prevID != 0 && sb.Length > 0)
        {
            WriteTextFile(sb.ToString(), filePath + "\\FieldsMapping-Repeatable" + prevID.ToString() + ".csv");
        }
        sb.Clear();

        var fields = (from f in db.FormField
                      where f.type != "SEPARATOR" && f.type != "TRUNCATED_TEXT" && f.type != "WRAPPED_TEXT" &&
                      f.type != "REPEATABLES_BASIC" && f.type != "REPEATABLES" && f.form_id == formID &&
                      !(from ffff in db.FormField_FormField
                        select ffff.repetableFormFields_id).Contains(f.id)
                      select new { f.name, f.label, f.positionIndex }).Distinct().Union(
                                       from fe in db.FormFieldExt
                                       where fe.FormID == formID
                                       orderby fe.PositionIndex
                                       select new { name = fe.FormFieldExtName, label = fe.FormFieldExtLabel, positionIndex = fe.PositionIndex.Value }); ;

        foreach(var f in fields.OrderBy(o => o.positionIndex))
        {
            sb.Append(f.name + separator + f.label + "\r\n");
        }
        WriteTextFile(sb.ToString(), filePath + "\\FieldsMapping-Form" + formID.ToString() + ".csv");
        db.Dispose();

    }
    private void ExportRepeatables(int formID, int startFormResponseID, DateTime? fromDate,
        string senderMsisdn, string filePath, string separator, string filter, string filterCount, int responseStatusID)
    {
        //Export Roster
        int rc = 1;
        bool newRow = true;
        string fileContent = "";
        string repFilePathName = "";
        int pffid = 0;
        int rid = 0;
        string LRM = ((char)0x200E).ToString();  // This is a LRM
        List<ResponseRepeatable> repeatables = new List<ResponseRepeatable>();

        GRASPEntities db = new GRASPEntities();

        if(filter.Length != 0)
        {

            int fc = Convert.ToInt32(filterCount);
            var respUnion = (from r in db.ResponseValue
                             from fr in db.FormResponse
                             where fr.id == r.FormResponseID && fr.parentForm_id == 1
                                    && (responseStatusID == 0 || fr.ResponseStatusID == responseStatusID)
                             select new
                             {
                                 FormResponseID = r.FormResponseID.Value,
                                 Value = r.value,
                                 nvalue = r.nvalue.Value,
                                 formFieldID = r.formFieldId.Value
                             }).Union(
             from re in db.ResponseValueExt
             from fr in db.FormResponse
             where fr.id == re.FormResponseID && fr.parentForm_id == 1
             select new { FormResponseID = re.FormResponseID, Value = "", nvalue = re.nvalue.Value, formFieldID = re.FormFieldID.Value });

            var filteredResponseIDs = from r in respUnion.Where(filter)
                                      group r by r.FormResponseID into grp
                                      where grp.Count() == fc
                                      select new { formResponseID = grp.Key };

            repeatables = (from r in db.ResponseRepeatable
                           from fr in filteredResponseIDs
                           where fr.formResponseID == r.FormResponseID && r.parentForm_id == formID && r.RVRepeatCount > 0 && r.FormResponseID > startFormResponseID
                           orderby r.FormResponseID, r.RVRepeatCount, r.formFieldId
                           select r).ToList();
        }
        else
        {
            repeatables = (from r in db.ResponseRepeatable
                           from fr in db.FormResponse
                           where r.FormResponseID == fr.id && r.parentForm_id == formID && r.RVRepeatCount > 0
                                && r.FormResponseID > startFormResponseID
                                && (responseStatusID == 0 || fr.ResponseStatusID == responseStatusID)
                           orderby r.FormResponseID, r.RVRepeatCount, r.formFieldId
                           select r).ToList();
        }
        string columnHeader = "";
        var columnList = (from r in repeatables
                          where r.RVRepeatCount == 1
                          select new { r.name, r.ParentFormFieldID, r.formFieldId, r.label }).Distinct();

        foreach(var ch in columnList)
        {
            if(columnHeader.Length > 1 && pffid != ch.ParentFormFieldID)
            {
                repFilePathName = filePath + "\\Repeatable-" + pffid + ".csv";
                WriteTextFile("ResponseID|" + columnHeader.Substring(0, columnHeader.Length - 1) + "\r\n", repFilePathName);
                columnHeader = "";
            }
            columnHeader += ch.name + separator;

            pffid = (int)ch.ParentFormFieldID;
        }
        //Write the last element of the foreach cycle
        if(columnHeader.Length > 1 && pffid != 0)
        {
            repFilePathName = filePath + "\\Repeatable-" + pffid + ".csv";
            WriteTextFile("ResponseID" + separator + columnHeader.Substring(0, columnHeader.Length - 1) + "\r\n", repFilePathName);
            columnHeader = "";
        }
        pffid = 0; //reset var for next cycle

        foreach(ResponseRepeatable r in repeatables)
        {
            //WriteTextFile(r.FormResponseID.ToString() + "," + r.RVRepeatCount.ToString() + "," + r.ParentFormFieldID.ToString() + "," + r.formFieldId + "\r\n", filePath + "\\temp.txt");
            //if(r.ParentFormFieldID == null || (r.ParentFormFieldID != null && pffid != 0 && pffid != r.ParentFormFieldID))
            if(pffid != 0 && (pffid != r.ParentFormFieldID || rid != r.FormResponseID || rc != r.RVRepeatCount))
            {
                //Repeatable is finished
                if(fileContent.Length > 0)
                {
                    //fileContent = fileContent.Replace(LRM, "");
                    repFilePathName = filePath + "\\Repeatable-" + pffid + ".csv";
                    WriteTextFile(fileContent.Substring(0, fileContent.Length - 1) + "\r\n", repFilePathName);
                    fileContent = "";
                    newRow = true;
                }
            }
            if(rid != r.FormResponseID) //New Response.
            {
                //fileContent += "\r\n";
                newRow = true;
            }

            if(rc != r.RVRepeatCount && r.RVRepeatCount > 0)  //New repetition > goto new line and start a new row.
            {
                newRow = true;
            }
            else if(fileContent.Length > 0) //still in the same repetition, looping through the responses.
            {
                //fileContent += ",";
                newRow = false;
            }

            if(newRow)
            {
                fileContent += r.FormResponseID + separator + r.value.Replace("\n", " ") + separator;
            }
            else
            {
                fileContent += r.value.Replace("\n", " ") + separator;
            }

            pffid = (int)r.ParentFormFieldID;

            //update control variables
            rid = (int)r.FormResponseID;
            rc = (int)r.RVRepeatCount;
        }
        //Write the last element of the foreach cycle
        if(fileContent.Length > 1 && pffid != 0)
        {
            repFilePathName = filePath + "\\Repeatable-" + pffid + ".csv";
            WriteTextFile(fileContent.Substring(0, fileContent.Length - 1) + "\r\n", repFilePathName);
        }
    }

    private string ReadSingleRow(IDataRecord record, string separator)
    {
        StringBuilder sb = new StringBuilder();
        for(int i = 0; i < record.FieldCount; i++)
        {
            sb.Append(record[i].ToString().Replace("\n", " ") + separator);
        }

        return sb.ToString().Substring(0, sb.ToString().Length - 1) + "\r\n";
    }

    /// <summary>
    /// Creates the zip file with all the CSV files and then downloads it.
    /// </summary>
    protected string createZip(string folderName, string fileName)
    {
        //Response.ContentType = "application/zip";
        //Response.AddHeader("Content-Disposition", string.Format("attachment; filename = \"{0}\"", System.IO.Path.GetFileName(fileName + ".zip")));
        //Response.AppendHeader("content-disposition", "attachment; filename=" + formName + ".zip");
        using(ZipFile zip = new ZipFile())
        {

            zip.AddDirectory(folderName);
            //zip.Save(Response.OutputStream);
            zip.Save(folderName + "\\" + fileName + ".zip");
        }

        DirectoryInfo di = new DirectoryInfo(folderName);
        FileInfo[] files = di.GetFiles("*.*").Where(p => p.Extension != ".zip").ToArray();
        foreach(FileInfo file in files)
        {
            try
            {
                file.Attributes = FileAttributes.Normal;
                File.Delete(file.FullName);
            }
            catch { }
        }
        return fileName + ".zip";
    }

    private void WriteTextFile(string content, string path)
    {
        using(System.IO.StreamWriter file = new System.IO.StreamWriter(new FileStream(path,
               FileMode.Append,
               FileAccess.Write), Encoding.UTF8))
        {
            file.Write(content);
        }

        //FileStream writeStream = new FileStream(path, FileMode.Append, FileAccess.Write);
        //BinaryWriter writeBinay = new BinaryWriter(writeStream);
        //writeBinay.Write(content);

        //writeStream.Close();
        //writeStream.Dispose();
        //writeBinay.Close();
        //writeBinay.Dispose();
    }


}