CREATE TABLE [dbo].[tblContact]
(
	[ContactId]  BIGINT       IDENTITY (1, 1) NOT NULL,
	[Name] varchar(100),
	[CustomerCode] varchar(70),
	[Email] varchar(100),
	[Phone] varchar(100),
	[Fax] varchar(70),
    [CreateDate] DATETIME     NOT NULL CONSTRAINT [DF_Contact_CreateDate] DEFAULT (getdate()),
    [CreatedBy]  VARCHAR (60) NOT NULL CONSTRAINT [DF_Contact_CreatedBy] DEFAULT (suser_sname()) ,
    [UpdateDate] DATETIME     NULL,
    [UpdatedBy]  VARCHAR (60) NULL,
    CONSTRAINT [PK_Contact_Contact] PRIMARY KEY CLUSTERED ([ContactId] ASC),
	CONSTRAINT [FK_Contact_Customer] FOREIGN KEY ([CustomerCode]) REFERENCES [dbo].[tblCustomerReference] ([CustomerCode])
)