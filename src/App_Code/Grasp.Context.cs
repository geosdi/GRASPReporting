﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;

public partial class GRASPEntities : DbContext
{
    public GRASPEntities()
        : base("name=GRASPEntities")
    {
    }

    protected override void OnModelCreating(DbModelBuilder modelBuilder)
    {
        throw new UnintentionalCodeFirstException();
    }

    public virtual DbSet<BindingContainer> BindingContainer { get; set; }
    public virtual DbSet<ConstraintContainer> ConstraintContainer { get; set; }
    public virtual DbSet<Contact> Contact { get; set; }
    public virtual DbSet<DataTransfer> DataTransfer { get; set; }
    public virtual DbSet<Email> Email { get; set; }
    public virtual DbSet<EmailAccount> EmailAccount { get; set; }
    public virtual DbSet<Form> Form { get; set; }
    public virtual DbSet<FormField> FormField { get; set; }
    public virtual DbSet<FormField_ConstraintContainer> FormField_ConstraintContainer { get; set; }
    public virtual DbSet<FormField_FormField> FormField_FormField { get; set; }
    public virtual DbSet<FormField_FormFieldAndBinding> FormField_FormFieldAndBinding { get; set; }
    public virtual DbSet<FormFieldAndBinding> FormFieldAndBinding { get; set; }
    public virtual DbSet<FormResponse> FormResponse { get; set; }
    public virtual DbSet<FormResponseCoords> FormResponseCoords { get; set; }
    public virtual DbSet<frontline_group> frontline_group { get; set; }
    public virtual DbSet<FrontlineMultimediaMessagePart> FrontlineMultimediaMessagePart { get; set; }
    public virtual DbSet<GroupMembership> GroupMembership { get; set; }
    public virtual DbSet<Keyword> Keyword { get; set; }
    public virtual DbSet<keywordaction> keywordaction { get; set; }
    public virtual DbSet<message> message { get; set; }
    public virtual DbSet<reminder> reminder { get; set; }
    public virtual DbSet<ReportField> ReportFields { get; set; }
    public virtual DbSet<Report> Reports { get; set; }
    public virtual DbSet<ResponseValue> ResponseValue { get; set; }
    public virtual DbSet<Roles> Roles { get; set; }
    public virtual DbSet<SmsInternetServiceSettings> SmsInternetServiceSettings { get; set; }
    public virtual DbSet<SmsInternetServiceSettings_SmsInternetServiceSettingValue> SmsInternetServiceSettings_SmsInternetServiceSettingValue { get; set; }
    public virtual DbSet<SmsInternetServiceSettingValue> SmsInternetServiceSettingValue { get; set; }
    public virtual DbSet<SmsModemSettings> SmsModemSettings { get; set; }
    public virtual DbSet<StatisticsTable> StatisticsTable { get; set; }
    public virtual DbSet<Survey> Survey { get; set; }
    public virtual DbSet<Survey_SurveyElement> Survey_SurveyElement { get; set; }
    public virtual DbSet<SurveyElement> SurveyElement { get; set; }
    public virtual DbSet<FormResponseCoords_ResponseValue> FormResponseCoords_ResponseValue { get; set; }
    public virtual DbSet<BindingRules> BindingRules { get; set; }
    public virtual DbSet<Detail_Form_Response> Detail_Form_Response { get; set; }
    public virtual DbSet<ResponseDetails> ResponseDetails { get; set; }
    public virtual DbSet<ResponseMapping> ResponseMapping { get; set; }
    public virtual DbSet<SurveyListAPI> SurveyListAPI { get; set; }
    public virtual DbSet<IndexHASH> IndexHASHes { get; set; }
    public virtual DbSet<IndexField> IndexFields { get; set; }
    public virtual DbSet<Index> Indexes { get; set; }
    public virtual DbSet<FormFieldExtDependencies> FormFieldExtDependencies { get; set; }
    public virtual DbSet<ResponseValueExt> ResponseValueExt { get; set; }
    public virtual DbSet<FormResponseReviews> FormResponseReviews { get; set; }
    public virtual DbSet<FormFieldResponses> FormFieldResponses { get; set; }
    public virtual DbSet<User_Credential> User_Credential { get; set; }
    public virtual DbSet<UserFilters> UserFilters { get; set; }
    public virtual DbSet<ResponseValueReviews> ResponseValueReviews { get; set; }
    public virtual DbSet<ResponseRepeatable> ResponseRepeatable { get; set; }
    public virtual DbSet<FormResponseStatus> FormResponseStatus { get; set; }
    public virtual DbSet<UserToFormResponses> UserToFormResponses { get; set; }
    public virtual DbSet<FormFieldExt> FormFieldExt { get; set; }
    public virtual DbSet<FormFieldExport> FormFieldExport { get; set; }
    public virtual DbSet<RolesToResponseStatus> RolesToResponseStatus { get; set; }
    public virtual DbSet<FormFieldResponsesReviews> FormFieldResponsesReviews { get; set; }
    public virtual DbSet<ResponseRepeatableReviews> ResponseRepeatableReviews { get; set; }
}
