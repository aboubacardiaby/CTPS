CREATE TABLE [dbo].[TblCountry]
(
	[CountryId] BIGINT IDENTITY(1,1) NOT NULL,
	[Name] [VARCHAR](100) NOT NULL,
	[TwoLetterIsoCode][VARCHAR](50) NOT NULL,
    [ThreeLetterIsoCode][VARCHAR](50) NOT NULL,
    [NumericIsoCode] [VARCHAR](50) NOT NULL,	
	[CreateDate] DATETIME     NOT NULL CONSTRAINT [DF_Country_CreateDate] DEFAULT (getdate()),
    [CreatedBy]	 VARCHAR (60) NOT NULL CONSTRAINT [DF_Country_CreatedBy] DEFAULT (suser_sname()),
    [UpdateDate] DATETIME NULL, 
    [UpdatedBy] VARCHAR(60) NULL,
	CONSTRAINT [PK_Country_Id] PRIMARY KEY CLUSTERED ([CountryId] ASC)
)
