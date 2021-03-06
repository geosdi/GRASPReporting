USE [GRASP]
GO
/****** Object:  Table [dbo].[Tempstatistiche]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tempstatistiche](
	[data] [date] NULL,
	[enumerator] [nvarchar](max) NULL,
	[designer_version] [nvarchar](max) NULL,
	[client_version] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SurveyElement]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyElement](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[position] [int] NULL,
	[survey] [nvarchar](255) NULL,
	[positionIndex] [int] NULL,
	[value] [nvarchar](255) NULL,
	[defaultValue] [tinyint] NOT NULL,
 CONSTRAINT [PK__SurveyEl__3213E83F09746778] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UQ__SurveyEl__3213E83E0C50D423] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatisticsTable]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StatisticsTable](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[chartType] [numeric](19, 0) NULL,
	[form_id] [numeric](19, 0) NULL,
	[query] [nvarchar](max) NULL,
	[title] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[message]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[message](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[binaryMessageContent] [varbinary](255) NULL,
	[date] [numeric](19, 0) NOT NULL,
	[dtype] [nvarchar](255) NULL,
	[recipientMsisdn] [nvarchar](255) NULL,
	[recipientSmsPort] [int] NOT NULL,
	[retriesRemaining] [int] NOT NULL,
	[senderMsisdn] [nvarchar](255) NULL,
	[smsPartsCount] [int] NOT NULL,
	[smscReference] [int] NULL,
	[status] [int] NULL,
	[textContent] [ntext] NULL,
	[type] [int] NULL,
	[subject] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FormResponseCoords]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[FormResponseCoords](
	[FRCoordID] [int] IDENTITY(1,1) NOT NULL,
	[FormResponseID] [int] NULL,
	[FRCoordText] [nvarchar](100) NULL,
	[FRCoordGeo] [geography] NULL,
	[frXCoordText] [varchar](255) NULL,
	[FRCoordGeometry] [geometry] NULL,
 CONSTRAINT [PK_FormResponseCoords] PRIMARY KEY CLUSTERED 
(
	[FRCoordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FrontlineMultimediaMessagePart]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FrontlineMultimediaMessagePart](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[binaryData] [tinyint] NULL,
	[content] [varchar](4096) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[frontline_group]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[frontline_group](
	[path] [nvarchar](255) NOT NULL,
	[id_flsmsId] [nvarchar](255) NULL,
	[parentPath] [nvarchar](255) NULL,
	[pushed] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[path] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[path] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Keyword]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Keyword](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](255) NULL,
	[keyword] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[keyword] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResponseValue]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResponseValue](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[id_flsmsId] [nvarchar](255) NULL,
	[pushed] [tinyint] NOT NULL,
	[value] [nvarchar](255) NULL,
	[RVRepeatCount] [int] NULL,
	[FormResponseID] [int] NULL,
	[RVCreateDate] [datetime] NULL,
	[formFieldId] [int] NULL,
	[positionIndex] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reports]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reports](
	[ReportID] [int] IDENTITY(1,1) NOT NULL,
	[ReportName] [nvarchar](512) NOT NULL,
	[ReportDescription] [nvarchar](max) NULL,
	[FormID] [numeric](19, 0) NOT NULL,
	[ReportCreateDate] [datetime] NULL,
 CONSTRAINT [PK_Reports] PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportFields]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportFields](
	[ReportFieldID] [int] IDENTITY(1,1) NOT NULL,
	[ReportID] [int] NOT NULL,
	[ReportFieldLabel] [nvarchar](max) NULL,
	[FormFieldID] [numeric](19, 0) NOT NULL,
	[ReportFieldCreateDate] [datetime] NULL,
	[ChartType] [nvarchar](50) NULL,
	[ReportFieldValueLabel] [nvarchar](max) NULL,
	[ValueFormFieldID] [numeric](19, 0) NULL,
	[ReportFieldAggregate] [nvarchar](50) NULL,
	[ReportFieldLegend] [int] NULL,
	[ReportFieldTableData] [int] NULL,
 CONSTRAINT [PK_ReportFields] PRIMARY KEY CLUSTERED 
(
	[ReportFieldID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SmsInternetServiceSettings]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SmsInternetServiceSettings](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[serviceClassName] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SmsModemSettings]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SmsModemSettings](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[deleteMessagesAfterReceiving] [tinyint] NOT NULL,
	[manufacturer] [nvarchar](255) NULL,
	[model] [nvarchar](255) NULL,
	[serial] [nvarchar](255) NULL,
	[simPin] [nvarchar](255) NULL,
	[smscNumber] [nvarchar](255) NULL,
	[supportingReceive] [tinyint] NULL,
	[useDeliveryReports] [tinyint] NOT NULL,
	[useForReceiving] [tinyint] NOT NULL,
	[useForSending] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SmsInternetServiceSettingValue]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SmsInternetServiceSettingValue](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[value] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BindingContainer]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BindingContainer](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[bType] [nvarchar](255) NULL,
	[maxRange] [int] NULL,
	[minRange] [int] NULL,
	[pushed] [tinyint] NULL,
	[value] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DataTransfer]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataTransfer](
	[id] [int] NOT NULL,
	[dbname] [nvarchar](255) NULL,
	[dbpassword] [nvarchar](255) NULL,
	[dbusername] [nvarchar](255) NULL,
	[manual] [tinyint] NULL,
	[scheduled] [tinyint] NULL,
	[scheduledtime] [datetime] NULL,
	[servername] [nvarchar](255) NULL,
	[serverport] [nvarchar](255) NULL,
	[sharable] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[contact_id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[active] [tinyint] NOT NULL,
	[emailAddress] [nvarchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[notes] [nvarchar](255) NULL,
	[otherPhoneNumber] [nvarchar](255) NULL,
	[phoneNumber] [nvarchar](255) NULL,
	[pushed] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[contact_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[contact_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[phoneNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConstraintContainer]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConstraintContainer](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[cType] [varchar](255) NULL,
	[maxRange] [int] NOT NULL,
	[minRange] [int] NOT NULL,
	[pushed] [tinyint] NULL,
	[value] [varchar](255) NULL,
	[cNumber] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Configuration]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Configuration](
	[exportExcelLink] [varchar](100) NULL,
	[googleKey] [nchar](50) NULL,
	[id] [numeric](19, 0) NULL,
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmailAccount]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailAccount](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[accountName] [nvarchar](255) NULL,
	[accountPassword] [nvarchar](255) NULL,
	[accountServer] [nvarchar](255) NULL,
	[accountServerPort] [int] NULL,
	[enabled] [tinyint] NULL,
	[isForReceiving] [tinyint] NULL,
	[lastCheck] [numeric](19, 0) NULL,
	[protocol] [nvarchar](255) NULL,
	[useSsl] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[accountName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Form]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Form](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[Code_Form] [nvarchar](255) NULL,
	[bindingsPolicy] [nvarchar](255) NULL,
	[designerVersion] [nvarchar](255) NULL,
	[finalised] [tinyint] NOT NULL,
	[id_flsmsId] [nvarchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[owner] [nvarchar](255) NULL,
	[pushed] [tinyint] NOT NULL,
	[permittedGroup_path] [nvarchar](255) NULL,
	[FormCreateDate] [datetime] NULL,
	[isHidden] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Email]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Email](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](255) NULL,
	[date] [numeric](19, 0) NULL,
	[recipients] [nvarchar](255) NULL,
	[status] [int] NULL,
	[subject] [nvarchar](255) NULL,
	[sender_id] [numeric](19, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SmsInternetServiceSettings_SmsInternetServiceSettingValue]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SmsInternetServiceSettings_SmsInternetServiceSettingValue](
	[SmsInternetServiceSettings_id] [numeric](19, 0) NOT NULL,
	[properties_id] [numeric](19, 0) NOT NULL,
	[mapkey] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SmsInternetServiceSettings_id] ASC,
	[mapkey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[properties_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResponseValue_ResponseValue]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResponseValue_ResponseValue](
	[ResponseValue_id] [numeric](19, 0) NOT NULL,
	[repetableResponseValues_id] [numeric](19, 0) NOT NULL,
UNIQUE NONCLUSTERED 
(
	[repetableResponseValues_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reminder]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reminder](
	[occurrence] [nvarchar](31) NOT NULL,
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](255) NULL,
	[enddate] [numeric](19, 0) NULL,
	[recipients] [nvarchar](255) NULL,
	[startdate] [numeric](19, 0) NULL,
	[status] [int] NULL,
	[subject] [nvarchar](255) NULL,
	[type] [int] NULL,
	[emailAccount_id] [numeric](19, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[message_FrontlineMultimediaMessagePart]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[message_FrontlineMultimediaMessagePart](
	[message_id] [numeric](19, 0) NOT NULL,
	[multimediaParts_id] [numeric](19, 0) NOT NULL,
UNIQUE NONCLUSTERED 
(
	[multimediaParts_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[InsertResponseCoords]    Script Date: 04/29/2014 13:54:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertResponseCoords] 
	@FormResponseID int, 
	@GeoCoords VARCHAR(100)
	
AS
BEGIN

	SET NOCOUNT ON;

INSERT INTO FormResponseCoords (FormResponseID,FRCoordText,FRCoordGeo,FRCoordGeometry)
	 VALUES (@FormResponseID,@GeoCoords, geography::STPointFromText('POINT(' + @GeoCoords + ')', 4326),
										 geometry::STPointFromText('POINT(' + @GeoCoords + ')', 0))	

END
GO
/****** Object:  Table [dbo].[GroupMembership]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupMembership](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[pushed] [tinyint] NULL,
	[contact_contact_id] [numeric](19, 0) NOT NULL,
	[group_path] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[contact_contact_id] ASC,
	[group_path] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormResponseCoords_ResponseValue]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormResponseCoords_ResponseValue](
	[FormResponseCoords_FRCoordID] [numeric](19, 0) NOT NULL,
	[formResponses_id] [numeric](19, 0) NOT NULL,
UNIQUE NONCLUSTERED 
(
	[formResponses_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Credential]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Credential](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[frontlinesms_id] [nvarchar](255) NULL,
	[name] [nvarchar](255) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[phone_number] [nvarchar](255) NOT NULL,
	[pushed] [tinyint] NULL,
	[supervisor] [nvarchar](255) NULL,
	[surname] [nvarchar](255) NOT NULL,
	[username] [nvarchar](255) NOT NULL,
	[roles_id] [int] NULL,
	[UserDeleteDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[keywordaction]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[keywordaction](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[commandInteger] [numeric](19, 0) NOT NULL,
	[commandString] [nvarchar](max) NULL,
	[counter] [numeric](19, 0) NOT NULL,
	[emailRecipients] [nvarchar](255) NULL,
	[emailSubject] [nvarchar](255) NULL,
	[endDate] [numeric](19, 0) NOT NULL,
	[externalCommand] [nvarchar](255) NULL,
	[externalCommandResponseActionType] [numeric](19, 0) NULL,
	[externalCommandResponseType] [numeric](19, 0) NULL,
	[externalCommandType] [numeric](19, 0) NULL,
	[startDate] [numeric](19, 0) NOT NULL,
	[type] [numeric](11, 0) NULL,
	[emailAccount_id] [numeric](19, 0) NULL,
	[group_path] [nvarchar](255) NULL,
	[keyword_id] [numeric](19, 0) NOT NULL,
 CONSTRAINT [PK__keyworda__3213E83F3A4CA8FD] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UQ__keyworda__3213E83E3D2915A8] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Survey]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Survey](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[owner_id] [numeric](19, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormResponse]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormResponse](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[clientVersion] [nvarchar](255) NULL,
	[id_flsmsId] [nvarchar](255) NULL,
	[pushed] [tinyint] NOT NULL,
	[senderMsisdn] [nvarchar](255) NULL,
	[parentForm_id] [numeric](19, 0) NULL,
	[Code_Form] [nvarchar](255) NULL,
	[fromDataEntry] [tinyint] NULL,
	[FRCreateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormResponse_ResponseValue]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormResponse_ResponseValue](
	[FormResponse_id] [numeric](19, 0) NOT NULL,
	[results_id] [numeric](19, 0) NOT NULL,
UNIQUE NONCLUSTERED 
(
	[results_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormField]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FormField](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[id_flsmsId] [nvarchar](255) NULL,
	[label] [nvarchar](max) NULL,
	[name] [nvarchar](255) NOT NULL,
	[positionIndex] [int] NOT NULL,
	[pushed] [tinyint] NULL,
	[required] [tinyint] NULL,
	[type] [nvarchar](255) NULL,
	[x_form] [ntext] NULL,
	[form_id] [numeric](19, 0) NULL,
	[survey_id] [numeric](19, 0) NULL,
	[bindingsPolicy] [varchar](255) NULL,
	[calculated] [tinyint] NULL,
	[constraintPolicy] [varchar](255) NULL,
	[formula] [varchar](255) NULL,
	[isReadOnly] [tinyint] NULL,
	[numberOfRep] [int] NULL,
	[FFCreateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Survey_SurveyElement]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Survey_SurveyElement](
	[Survey_id] [numeric](19, 0) NOT NULL,
	[values_id] [numeric](19, 0) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Survey_SurveyElement] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[values_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Vista_Value_Response]    Script Date: 04/29/2014 13:54:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vista_Value_Response]
AS
SELECT     dbo.FormResponse.id, dbo.FormResponse.senderMsisdn, dbo.ResponseValue.value
FROM         dbo.FormResponse INNER JOIN
                      dbo.FormResponse_ResponseValue ON dbo.FormResponse.id = dbo.FormResponse_ResponseValue.FormResponse_id INNER JOIN
                      dbo.Form ON dbo.FormResponse.parentForm_id = dbo.Form.id INNER JOIN
                      dbo.ResponseValue ON dbo.FormResponse_ResponseValue.results_id = dbo.ResponseValue.id
GO
/****** Object:  View [dbo].[V_FieldPositionIndex]    Script Date: 04/29/2014 13:54:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_FieldPositionIndex] as 
SELECT TOP 1000 [id]
      ,[positionIndex]
      ,[type]
      ,[form_id]
  FROM [GRASP].[dbo].[FormField]
where form_id is not null
order by form_id, id
GO
/****** Object:  View [dbo].[SurveyListAPI]    Script Date: 04/29/2014 13:54:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SurveyListAPI]
AS
SELECT     dbo.Survey.id, dbo.Survey.name, dbo.SurveyElement.value
FROM         dbo.Survey INNER JOIN
                      dbo.Survey_SurveyElement ON dbo.Survey.id = dbo.Survey_SurveyElement.Survey_id INNER JOIN
                      dbo.SurveyElement ON dbo.Survey_SurveyElement.values_id = dbo.SurveyElement.id
GO
/****** Object:  View [dbo].[Statistics_Form_Response]    Script Date: 04/29/2014 13:54:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Statistics_Form_Response]
AS
SELECT     dbo.Form.id, dbo.FormField.name, dbo.FormField.type
FROM         dbo.Form INNER JOIN
                      dbo.FormField ON dbo.Form.id = dbo.FormField.form_id
WHERE     (dbo.FormField.type NOT LIKE 'separator') AND (NOT (dbo.FormField.type LIKE 'TRUNCATED_TEXT')) AND (NOT (dbo.FormField.type LIKE 'WRAPPED_TEXT'))
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Form"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 230
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "FormField"
            Begin Extent = 
               Top = 6
               Left = 268
               Bottom = 125
               Right = 451
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Statistics_Form_Response'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Statistics_Form_Response'
GO
/****** Object:  View [dbo].[Detail_Form_Response]    Script Date: 04/29/2014 13:54:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Detail_Form_Response]
AS
SELECT     dbo.Form.id, dbo.FormField.name
FROM         dbo.Form INNER JOIN
                      dbo.FormField ON dbo.Form.id = dbo.FormField.form_id
WHERE     (dbo.FormField.type NOT LIKE 'separator') AND (NOT (dbo.FormField.type LIKE 'TRUNCATED_TEXT')) AND (NOT (dbo.FormField.type LIKE 'WRAPPED_TEXT'))
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Form"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 230
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "FormField"
            Begin Extent = 
               Top = 6
               Left = 268
               Bottom = 125
               Right = 451
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Detail_Form_Response'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Detail_Form_Response'
GO
/****** Object:  Table [dbo].[Form_FormField]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Form_FormField](
	[Form_id] [numeric](19, 0) NOT NULL,
	[fields_id] [numeric](19, 0) NOT NULL,
UNIQUE NONCLUSTERED 
(
	[fields_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormField_FormField]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormField_FormField](
	[FormField_id] [numeric](19, 0) NOT NULL,
	[repetableFormFields_id] [numeric](19, 0) NOT NULL,
UNIQUE NONCLUSTERED 
(
	[repetableFormFields_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormField_ConstraintContainer]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormField_ConstraintContainer](
	[FormField_id] [numeric](19, 0) NOT NULL,
	[constraints_id] [numeric](19, 0) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_FormField_ConstraintContainer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[constraints_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormFieldAndBinding]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormFieldAndBinding](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[pushed] [tinyint] NULL,
	[bContainer_id] [numeric](19, 0) NULL,
	[fField_id] [numeric](19, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormField_FormResponse]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormField_FormResponse](
	[FormField_id] [numeric](19, 0) NOT NULL,
	[formResponses_id] [numeric](19, 0) NOT NULL,
UNIQUE NONCLUSTERED 
(
	[formResponses_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[FormFieldExport]    Script Date: 04/29/2014 13:54:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[FormFieldExport]
AS
SELECT     dbo.FormField.id, dbo.FormField.label, dbo.FormField.name, dbo.FormField.positionIndex, dbo.FormField.required, dbo.FormField.type, dbo.FormField.x_form, dbo.FormField.form_id, 
                      dbo.FormField.survey_id, dbo.FormField.isReadOnly, dbo.FormField.numberOfRep, dbo.FormField.FFCreateDate, dbo.FormField_FormField.FormField_id AS FormFieldParentID, 
                      dbo.FormField.calculated, dbo.FormField.formula

FROM         dbo.FormField LEFT OUTER JOIN dbo.FormField_FormField ON dbo.FormField.id = dbo.FormField_FormField.repetableFormFields_id
GO
/****** Object:  Table [dbo].[FormField_FormFieldAndBinding]    Script Date: 04/29/2014 13:54:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormField_FormFieldAndBinding](
	[FormField_id] [numeric](19, 0) NOT NULL,
	[bindingCouples_id] [numeric](19, 0) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_FormField_FormFieldAndBinding] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[bindingCouples_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[BindingRules]    Script Date: 04/29/2014 13:54:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BindingRules]
AS
SELECT     dbo.FormField_FormFieldAndBinding.FormField_id, dbo.FormField.id, dbo.BindingContainer.bType, dbo.BindingContainer.value, dbo.FormField.label, dbo.FormField.name, 
                      dbo.FormField.positionIndex, dbo.FormField.type, dbo.FormField.x_form, dbo.FormField.form_id, dbo.FormField.bindingsPolicy, dbo.FormFieldAndBinding.id AS Expr1, dbo.FormField.calculated, 
                      dbo.FormField.formula, dbo.FormField.required 

FROM         dbo.FormField INNER JOIN
                      dbo.BindingContainer INNER JOIN
                      dbo.FormFieldAndBinding ON dbo.BindingContainer.id = dbo.FormFieldAndBinding.bContainer_id INNER JOIN
                      dbo.FormField_FormFieldAndBinding ON dbo.FormFieldAndBinding.id = dbo.FormField_FormFieldAndBinding.bindingCouples_id ON dbo.FormField.id = dbo.FormFieldAndBinding.fField_id
GO
/****** Object:  Default [DF_Form_FormCreateDate]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[Form] ADD  CONSTRAINT [DF_Form_FormCreateDate]  DEFAULT (getdate()) FOR [FormCreateDate]
GO
/****** Object:  Default [DF_FormField_FFCreateDate]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[FormField] ADD  CONSTRAINT [DF_FormField_FFCreateDate]  DEFAULT (getdate()) FOR [FFCreateDate]
GO
/****** Object:  Default [DF_FormResponse_FRDateTime]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[FormResponse] ADD  CONSTRAINT [DF_FormResponse_FRDateTime]  DEFAULT (getdate()) FOR [FRCreateDate]
GO
/****** Object:  Default [DF__keywordac__email__3F115E1A]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[keywordaction] ADD  CONSTRAINT [DF__keywordac__email__3F115E1A]  DEFAULT (NULL) FOR [emailRecipients]
GO
/****** Object:  Default [DF__keywordac__email__40058253]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[keywordaction] ADD  CONSTRAINT [DF__keywordac__email__40058253]  DEFAULT (NULL) FOR [emailSubject]
GO
/****** Object:  Default [DF__keywordac__exter__40F9A68C]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[keywordaction] ADD  CONSTRAINT [DF__keywordac__exter__40F9A68C]  DEFAULT (NULL) FOR [externalCommand]
GO
/****** Object:  Default [DF__keywordac__exter__41EDCAC5]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[keywordaction] ADD  CONSTRAINT [DF__keywordac__exter__41EDCAC5]  DEFAULT (NULL) FOR [externalCommandResponseActionType]
GO
/****** Object:  Default [DF__keywordac__exter__42E1EEFE]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[keywordaction] ADD  CONSTRAINT [DF__keywordac__exter__42E1EEFE]  DEFAULT (NULL) FOR [externalCommandResponseType]
GO
/****** Object:  Default [DF__keywordac__exter__43D61337]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[keywordaction] ADD  CONSTRAINT [DF__keywordac__exter__43D61337]  DEFAULT (NULL) FOR [externalCommandType]
GO
/****** Object:  Default [DF__keywordact__type__44CA3770]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[keywordaction] ADD  CONSTRAINT [DF__keywordact__type__44CA3770]  DEFAULT (NULL) FOR [type]
GO
/****** Object:  Default [DF__keywordac__email__45BE5BA9]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[keywordaction] ADD  CONSTRAINT [DF__keywordac__email__45BE5BA9]  DEFAULT (NULL) FOR [emailAccount_id]
GO
/****** Object:  Default [DF__keywordac__group__46B27FE2]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[keywordaction] ADD  CONSTRAINT [DF__keywordac__group__46B27FE2]  DEFAULT (NULL) FOR [group_path]
GO
/****** Object:  Default [DF_ResponseValue_RVCreateDate]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[ResponseValue] ADD  CONSTRAINT [DF_ResponseValue_RVCreateDate]  DEFAULT (getdate()) FOR [RVCreateDate]
GO
/****** Object:  Default [DF__SurveyEle__defau__6EF57B66]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[SurveyElement] ADD  DEFAULT ((0)) FOR [defaultValue]
GO
/****** Object:  ForeignKey [FK3FF5B7C77FBC69D]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[Email]  WITH CHECK ADD  CONSTRAINT [FK3FF5B7C77FBC69D] FOREIGN KEY([sender_id])
REFERENCES [dbo].[EmailAccount] ([id])
GO
ALTER TABLE [dbo].[Email] CHECK CONSTRAINT [FK3FF5B7C77FBC69D]
GO
/****** Object:  ForeignKey [FK2180E4D3148215]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[Form]  WITH CHECK ADD  CONSTRAINT [FK2180E4D3148215] FOREIGN KEY([permittedGroup_path])
REFERENCES [dbo].[frontline_group] ([path])
GO
ALTER TABLE [dbo].[Form] CHECK CONSTRAINT [FK2180E4D3148215]
GO
/****** Object:  ForeignKey [FK891CCCDB1F476EAE]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[Form_FormField]  WITH CHECK ADD  CONSTRAINT [FK891CCCDB1F476EAE] FOREIGN KEY([Form_id])
REFERENCES [dbo].[Form] ([id])
GO
ALTER TABLE [dbo].[Form_FormField] CHECK CONSTRAINT [FK891CCCDB1F476EAE]
GO
/****** Object:  ForeignKey [FK891CCCDBF2FF003]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[Form_FormField]  WITH CHECK ADD  CONSTRAINT [FK891CCCDBF2FF003] FOREIGN KEY([fields_id])
REFERENCES [dbo].[FormField] ([id])
GO
ALTER TABLE [dbo].[Form_FormField] CHECK CONSTRAINT [FK891CCCDBF2FF003]
GO
/****** Object:  ForeignKey [FKE1EB1E761F476EAE]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[FormField]  WITH CHECK ADD  CONSTRAINT [FKE1EB1E761F476EAE] FOREIGN KEY([form_id])
REFERENCES [dbo].[Form] ([id])
GO
ALTER TABLE [dbo].[FormField] CHECK CONSTRAINT [FKE1EB1E761F476EAE]
GO
/****** Object:  ForeignKey [FKE1EB1E76882251EE]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[FormField]  WITH CHECK ADD  CONSTRAINT [FKE1EB1E76882251EE] FOREIGN KEY([survey_id])
REFERENCES [dbo].[Survey] ([id])
GO
ALTER TABLE [dbo].[FormField] CHECK CONSTRAINT [FKE1EB1E76882251EE]
GO
/****** Object:  ForeignKey [FK594E3BBB162222E6]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[FormField_ConstraintContainer]  WITH CHECK ADD  CONSTRAINT [FK594E3BBB162222E6] FOREIGN KEY([FormField_id])
REFERENCES [dbo].[FormField] ([id])
GO
ALTER TABLE [dbo].[FormField_ConstraintContainer] CHECK CONSTRAINT [FK594E3BBB162222E6]
GO
/****** Object:  ForeignKey [FK594E3BBB95BCFCF4]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[FormField_ConstraintContainer]  WITH CHECK ADD  CONSTRAINT [FK594E3BBB95BCFCF4] FOREIGN KEY([constraints_id])
REFERENCES [dbo].[ConstraintContainer] ([id])
GO
ALTER TABLE [dbo].[FormField_ConstraintContainer] CHECK CONSTRAINT [FK594E3BBB95BCFCF4]
GO
/****** Object:  ForeignKey [FKAFB41BED162222E6]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[FormField_FormField]  WITH CHECK ADD  CONSTRAINT [FKAFB41BED162222E6] FOREIGN KEY([FormField_id])
REFERENCES [dbo].[FormField] ([id])
GO
ALTER TABLE [dbo].[FormField_FormField] CHECK CONSTRAINT [FKAFB41BED162222E6]
GO
/****** Object:  ForeignKey [FKAFB41BED1AD43419]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[FormField_FormField]  WITH CHECK ADD  CONSTRAINT [FKAFB41BED1AD43419] FOREIGN KEY([repetableFormFields_id])
REFERENCES [dbo].[FormField] ([id])
GO
ALTER TABLE [dbo].[FormField_FormField] CHECK CONSTRAINT [FKAFB41BED1AD43419]
GO
/****** Object:  ForeignKey [FK4210107B162222E6]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[FormField_FormFieldAndBinding]  WITH CHECK ADD  CONSTRAINT [FK4210107B162222E6] FOREIGN KEY([FormField_id])
REFERENCES [dbo].[FormField] ([id])
GO
ALTER TABLE [dbo].[FormField_FormFieldAndBinding] CHECK CONSTRAINT [FK4210107B162222E6]
GO
/****** Object:  ForeignKey [FK4210107B66ACF65C]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[FormField_FormFieldAndBinding]  WITH CHECK ADD  CONSTRAINT [FK4210107B66ACF65C] FOREIGN KEY([bindingCouples_id])
REFERENCES [dbo].[FormFieldAndBinding] ([id])
GO
ALTER TABLE [dbo].[FormField_FormFieldAndBinding] CHECK CONSTRAINT [FK4210107B66ACF65C]
GO
/****** Object:  ForeignKey [FKF395D06E162222E6]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[FormField_FormResponse]  WITH CHECK ADD  CONSTRAINT [FKF395D06E162222E6] FOREIGN KEY([FormField_id])
REFERENCES [dbo].[FormField] ([id])
GO
ALTER TABLE [dbo].[FormField_FormResponse] CHECK CONSTRAINT [FKF395D06E162222E6]
GO
/****** Object:  ForeignKey [FKF395D06EBD67FB85]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[FormField_FormResponse]  WITH CHECK ADD  CONSTRAINT [FKF395D06EBD67FB85] FOREIGN KEY([formResponses_id])
REFERENCES [dbo].[FormResponse] ([id])
GO
ALTER TABLE [dbo].[FormField_FormResponse] CHECK CONSTRAINT [FKF395D06EBD67FB85]
GO
/****** Object:  ForeignKey [FKD3503BC4981CDFEB]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[FormFieldAndBinding]  WITH CHECK ADD  CONSTRAINT [FKD3503BC4981CDFEB] FOREIGN KEY([bContainer_id])
REFERENCES [dbo].[BindingContainer] ([id])
GO
ALTER TABLE [dbo].[FormFieldAndBinding] CHECK CONSTRAINT [FKD3503BC4981CDFEB]
GO
/****** Object:  ForeignKey [FKD3503BC49F9D5488]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[FormFieldAndBinding]  WITH CHECK ADD  CONSTRAINT [FKD3503BC49F9D5488] FOREIGN KEY([fField_id])
REFERENCES [dbo].[FormField] ([id])
GO
ALTER TABLE [dbo].[FormFieldAndBinding] CHECK CONSTRAINT [FKD3503BC49F9D5488]
GO
/****** Object:  ForeignKey [FK8325D545D92B32C4]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[FormResponse]  WITH CHECK ADD  CONSTRAINT [FK8325D545D92B32C4] FOREIGN KEY([parentForm_id])
REFERENCES [dbo].[Form] ([id])
GO
ALTER TABLE [dbo].[FormResponse] CHECK CONSTRAINT [FK8325D545D92B32C4]
GO
/****** Object:  ForeignKey [FKCA47C8161674AB2E]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[FormResponse_ResponseValue]  WITH CHECK ADD  CONSTRAINT [FKCA47C8161674AB2E] FOREIGN KEY([FormResponse_id])
REFERENCES [dbo].[FormResponse] ([id])
GO
ALTER TABLE [dbo].[FormResponse_ResponseValue] CHECK CONSTRAINT [FKCA47C8161674AB2E]
GO
/****** Object:  ForeignKey [FKCA47C816F8F076C0]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[FormResponse_ResponseValue]  WITH CHECK ADD  CONSTRAINT [FKCA47C816F8F076C0] FOREIGN KEY([results_id])
REFERENCES [dbo].[ResponseValue] ([id])
GO
ALTER TABLE [dbo].[FormResponse_ResponseValue] CHECK CONSTRAINT [FKCA47C816F8F076C0]
GO
/****** Object:  ForeignKey [FKFA275C14699E17A8]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[FormResponseCoords_ResponseValue]  WITH CHECK ADD  CONSTRAINT [FKFA275C14699E17A8] FOREIGN KEY([formResponses_id])
REFERENCES [dbo].[ResponseValue] ([id])
GO
ALTER TABLE [dbo].[FormResponseCoords_ResponseValue] CHECK CONSTRAINT [FKFA275C14699E17A8]
GO
/****** Object:  ForeignKey [FKBA9C3F955A18C292]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[GroupMembership]  WITH CHECK ADD  CONSTRAINT [FKBA9C3F955A18C292] FOREIGN KEY([contact_contact_id])
REFERENCES [dbo].[Contact] ([contact_id])
GO
ALTER TABLE [dbo].[GroupMembership] CHECK CONSTRAINT [FKBA9C3F955A18C292]
GO
/****** Object:  ForeignKey [FKBA9C3F95DAF23DFD]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[GroupMembership]  WITH CHECK ADD  CONSTRAINT [FKBA9C3F95DAF23DFD] FOREIGN KEY([group_path])
REFERENCES [dbo].[frontline_group] ([path])
GO
ALTER TABLE [dbo].[GroupMembership] CHECK CONSTRAINT [FKBA9C3F95DAF23DFD]
GO
/****** Object:  ForeignKey [FK822AE55F3D2C2C41]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[keywordaction]  WITH CHECK ADD  CONSTRAINT [FK822AE55F3D2C2C41] FOREIGN KEY([emailAccount_id])
REFERENCES [dbo].[EmailAccount] ([id])
GO
ALTER TABLE [dbo].[keywordaction] CHECK CONSTRAINT [FK822AE55F3D2C2C41]
GO
/****** Object:  ForeignKey [FK822AE55FC5482473]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[keywordaction]  WITH CHECK ADD  CONSTRAINT [FK822AE55FC5482473] FOREIGN KEY([keyword_id])
REFERENCES [dbo].[Keyword] ([id])
GO
ALTER TABLE [dbo].[keywordaction] CHECK CONSTRAINT [FK822AE55FC5482473]
GO
/****** Object:  ForeignKey [FK822AE55FDAF23DFD]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[keywordaction]  WITH CHECK ADD  CONSTRAINT [FK822AE55FDAF23DFD] FOREIGN KEY([group_path])
REFERENCES [dbo].[frontline_group] ([path])
GO
ALTER TABLE [dbo].[keywordaction] CHECK CONSTRAINT [FK822AE55FDAF23DFD]
GO
/****** Object:  ForeignKey [FKAA958F0A2B00A379]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[message_FrontlineMultimediaMessagePart]  WITH CHECK ADD  CONSTRAINT [FKAA958F0A2B00A379] FOREIGN KEY([message_id])
REFERENCES [dbo].[message] ([id])
GO
ALTER TABLE [dbo].[message_FrontlineMultimediaMessagePart] CHECK CONSTRAINT [FKAA958F0A2B00A379]
GO
/****** Object:  ForeignKey [FKAA958F0AFC9C3E5E]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[message_FrontlineMultimediaMessagePart]  WITH CHECK ADD  CONSTRAINT [FKAA958F0AFC9C3E5E] FOREIGN KEY([multimediaParts_id])
REFERENCES [dbo].[FrontlineMultimediaMessagePart] ([id])
GO
ALTER TABLE [dbo].[message_FrontlineMultimediaMessagePart] CHECK CONSTRAINT [FKAA958F0AFC9C3E5E]
GO
/****** Object:  ForeignKey [FKE116C0723D2C2C41]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[reminder]  WITH CHECK ADD  CONSTRAINT [FKE116C0723D2C2C41] FOREIGN KEY([emailAccount_id])
REFERENCES [dbo].[EmailAccount] ([id])
GO
ALTER TABLE [dbo].[reminder] CHECK CONSTRAINT [FKE116C0723D2C2C41]
GO
/****** Object:  ForeignKey [FK475D51213B0E124D]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[ResponseValue_ResponseValue]  WITH CHECK ADD  CONSTRAINT [FK475D51213B0E124D] FOREIGN KEY([repetableResponseValues_id])
REFERENCES [dbo].[ResponseValue] ([id])
GO
ALTER TABLE [dbo].[ResponseValue_ResponseValue] CHECK CONSTRAINT [FK475D51213B0E124D]
GO
/****** Object:  ForeignKey [FK475D51219AE2EA6]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[ResponseValue_ResponseValue]  WITH CHECK ADD  CONSTRAINT [FK475D51219AE2EA6] FOREIGN KEY([ResponseValue_id])
REFERENCES [dbo].[ResponseValue] ([id])
GO
ALTER TABLE [dbo].[ResponseValue_ResponseValue] CHECK CONSTRAINT [FK475D51219AE2EA6]
GO
/****** Object:  ForeignKey [FKA24BD3BD32373A6A]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[SmsInternetServiceSettings_SmsInternetServiceSettingValue]  WITH CHECK ADD  CONSTRAINT [FKA24BD3BD32373A6A] FOREIGN KEY([properties_id])
REFERENCES [dbo].[SmsInternetServiceSettingValue] ([id])
GO
ALTER TABLE [dbo].[SmsInternetServiceSettings_SmsInternetServiceSettingValue] CHECK CONSTRAINT [FKA24BD3BD32373A6A]
GO
/****** Object:  ForeignKey [FKA24BD3BD6E7ADCE1]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[SmsInternetServiceSettings_SmsInternetServiceSettingValue]  WITH CHECK ADD  CONSTRAINT [FKA24BD3BD6E7ADCE1] FOREIGN KEY([SmsInternetServiceSettings_id])
REFERENCES [dbo].[SmsInternetServiceSettings] ([id])
GO
ALTER TABLE [dbo].[SmsInternetServiceSettings_SmsInternetServiceSettingValue] CHECK CONSTRAINT [FKA24BD3BD6E7ADCE1]
GO
/****** Object:  ForeignKey [FK9448937AAACA0E5F]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[Survey]  WITH CHECK ADD  CONSTRAINT [FK9448937AAACA0E5F] FOREIGN KEY([owner_id])
REFERENCES [dbo].[Form] ([id])
GO
ALTER TABLE [dbo].[Survey] CHECK CONSTRAINT [FK9448937AAACA0E5F]
GO
/****** Object:  ForeignKey [FK7110EE1D882251EE]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[Survey_SurveyElement]  WITH CHECK ADD  CONSTRAINT [FK7110EE1D882251EE] FOREIGN KEY([Survey_id])
REFERENCES [dbo].[Survey] ([id])
GO
ALTER TABLE [dbo].[Survey_SurveyElement] CHECK CONSTRAINT [FK7110EE1D882251EE]
GO
/****** Object:  ForeignKey [FK7110EE1DB3405EA6]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[Survey_SurveyElement]  WITH CHECK ADD  CONSTRAINT [FK7110EE1DB3405EA6] FOREIGN KEY([values_id])
REFERENCES [dbo].[SurveyElement] ([id])
GO
ALTER TABLE [dbo].[Survey_SurveyElement] CHECK CONSTRAINT [FK7110EE1DB3405EA6]
GO
/****** Object:  ForeignKey [FK623D294B7F468633]    Script Date: 04/29/2014 13:54:28 ******/
ALTER TABLE [dbo].[User_Credential]  WITH CHECK ADD  CONSTRAINT [FK623D294B7F468633] FOREIGN KEY([roles_id])
REFERENCES [dbo].[Roles] ([id])
GO
ALTER TABLE [dbo].[User_Credential] CHECK CONSTRAINT [FK623D294B7F468633]
GO
