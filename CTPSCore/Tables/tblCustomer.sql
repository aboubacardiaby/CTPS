CREATE TABLE [dbo].[tblCustomerReference]
(
	[ReferenceId]   BIGINT       IDENTITY (1, 1) NOT NULL,	
	[CustomerCode]  VARCHAR(70) NOT NULL,
	[Name]   VARCHAR (100) NOT NULL,
	[Short_Name] varchar(100),
	[CreateDate] DATETIME     NOT NULL CONSTRAINT [DF_Reference_CreateDate] DEFAULT (getdate()),
    [CreatedBy]	 VARCHAR (60) NOT NULL CONSTRAINT [DF_Reference_CreatedBy] DEFAULT (suser_sname()),
    [UpdateDate] DATETIME     NULL,
    [UpdatedBy]  VARCHAR (60) NULL,
    CONSTRAINT [PK_Reference_Reference] PRIMARY KEY CLUSTERED ([CustomerCode] ASC)	
)
