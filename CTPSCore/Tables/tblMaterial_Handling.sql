CREATE TABLE [dbo].[tblMaterial_Handling]
(
	[MaterialId]    BIGINT       IDENTITY (1,1) NOT NULL,
	[Material_Desc] VARCHAR(100) NOT NULL,
	[CreateDate] DATETIME     NOT NULL CONSTRAINT [DF_Material_CreateDate] DEFAULT (getdate()),
	[CreatedBy]	 VARCHAR (60) NOT NULL CONSTRAINT [DF_Material_CreatedBy] DEFAULT (suser_sname()),
	[UpdateDate] DATETIME     NULL,
	[UpdatedBy]  VARCHAR (60) NULL,
   CONSTRAINT [PK_Material_Material] PRIMARY KEY CLUSTERED ([MaterialId] ASC),
  
)
GO
CREATE Trigger [dbo].[TR_Material_UpdateDate_UpdatedBy] on [dbo].[tblMaterial_Handling]
AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE [tblMaterial_Handling] SET [UpdateDate] = GETDATE(), [UpdatedBy] = SUSER_SNAME()
	FROM [tblMaterial_Handling] AS a
	INNER JOIN Inserted AS i 
	ON a.[MaterialId] = i.[MaterialId]
END
