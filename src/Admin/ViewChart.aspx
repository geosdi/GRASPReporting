﻿<%@ Page Title="" Language="C#" MasterPageFile="~/_master/Admin.master" AutoEventWireup="true" CodeFile="ViewChart.aspx.cs" Inherits="Admin_Statistics_ViewChart" %>

<%@ Register Src="../_uc/pieChart.ascx" TagName="pieChart" TagPrefix="uc1" %>

<%@ Register Src="../_uc/barChart.ascx" TagName="barChart" TagPrefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../_css/kendo.dataviz.min.css" rel="stylesheet" />

    <script src="../_js/kendo.dataviz.min.js"></script>

    <script src="../_js/console.js"></script>

    <script>
        $(document).ready(function () {
            setTimeout(function () {
                createCharts();
            }, 400);
        });
    </script>
    <style type="text/css">
        #filter { margin-bottom: 4px; border-bottom: 1px solid #ccc;font-size:12px;padding:0 0 4px 0; }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody1" runat="Server">
    <div class="row">
        <div class="col-lg-12">
            <h1><%= ReportName%> </h1>
            <ol class="breadcrumb">
                <li><i class="fa fa-home"></i><a href="Home_Page.aspx">Home </a></li>
                <li><i class="fa fa-bar-chart-o"></i><a href="ViewReports.aspx">Reports </a></li>
                <li class="current"><i class="fa fa-tasks"></i>View Reports</li>
            </ol>
        </div>
    </div>
    <div id="filter">
        Review Status: 
        <telerik:RadComboBox ID="DdlResponseStatus" runat="server" EnableLoadOnDemand="True" Skin="Metro" AutoPostBack="true" AppendDataBoundItems="true" BorderColor="#66AFE9" BackColor="White" DataSourceID="EdsResponseStatus" DataTextField="ResponseStatusName" DataValueField="ResponseStatusID">
            <Items>
                <telerik:RadComboBoxItem Text="Any" Value="0" />
            </Items>
        </telerik:RadComboBox>
    </div>
    <!--  INIZIO USERCONTROL --->
    <div id="row">
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>

    </div>
    <asp:Literal ID="Literal1" runat="server" EnableViewState="false"></asp:Literal>
    <hr />

    <asp:Literal ID="Literal2" runat="server"></asp:Literal>

        <asp:EntityDataSource ID="EdsResponseStatus" runat="server" ConnectionString="name=GRASPEntities" DefaultContainerName="GRASPEntities" EnableFlattening="False" EntitySetName="FormResponseStatus" Select="it.[ResponseStatusName], it.[ResponseStatusID]">
    </asp:EntityDataSource>
</asp:Content>

