CREATE TABLE [dbo].[tblAddress]
(
	[AddressId]  BIGINT       IDENTITY (1, 1) NOT NULL,
	[CustomerCode] VARCHAR(70) NOT NULL,
	[AddressType] VARCHAR(70) NOT NULL,
    [Address1]   VARCHAR (70) NOT NULL,
	[Address2]   VARCHAR (70) NOT NULL,
    [City]       VARCHAR (35) NOT NULL,
    [Province]      CHAR (70)     NOT NULL,
    [PostalCode]    VARCHAR (70) NOT NULL,
	[CountryId] BIGINT NOT NULL,
    [CreateDate] DATETIME     NOT NULL CONSTRAINT [DF_Address_CreateDate] DEFAULT (getdate()),
    [CreatedBy]  VARCHAR (60) NOT NULL CONSTRAINT [DF_Address_CreatedBy] DEFAULT (suser_sname()) ,
    [UpdateDate] DATETIME     NULL,
    [UpdatedBy]  VARCHAR (60) NULL,
    CONSTRAINT [PK_Address_AddressId] PRIMARY KEY CLUSTERED ([AddressId] ASC),
	CONSTRAINT [FK_Country_Address] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[tblCountry] ([CountryId]),
	CONSTRAINT [FK_tblCustomerReference_Address] FOREIGN KEY ([CustomerCode]) REFERENCES [dbo].[tblCustomerReference] ([CustomerCode])
	
);

