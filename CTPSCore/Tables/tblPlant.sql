CREATE TABLE [dbo].[tblPlant]
(
	[PlantId]    BIGINT       IDENTITY (1, 1) NOT NULL,
	[Ship_From]  VARCHAR(70)  NOT NULL,
	[Name]  VARCHAR(255)  NOT NULL,
	[Address]  VARCHAR(255)   NULL,
	[City]  VARCHAR(70)   NULL,
	[State]  VARCHAR(70)   NULL,
	[Postal_Code]  VARCHAR(70)   NULL,
	[Pallet_Capacity]  VARCHAR(70)   NULL,
	[Square_Footage]  VARCHAR(70)   NULL,
	[Clear_Height]  VARCHAR(70)   NULL,
	[Hours]  VARCHAR(70)   NULL,
	[Type]  VARCHAR(70)   NULL,
	[Contract_Type]  VARCHAR(70)   NULL,
	[Use]  VARCHAR(70)   NULL,
	[CreateDate] DATETIME     NOT NULL CONSTRAINT [DF_Plant_CreateDate] DEFAULT (getdate()),
	[CreatedBy]	 VARCHAR (60) NOT NULL CONSTRAINT [DF_Plant_CreatedBy] DEFAULT (suser_sname()),
	[UpdateDate] DATETIME     NULL,
	[UpdatedBy]  VARCHAR (60) NULL,
   CONSTRAINT [PK_Plant_Plant] PRIMARY KEY CLUSTERED ([Ship_From] ASC),
  
)
