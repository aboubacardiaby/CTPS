CREATE TABLE [dbo].[tblProduct_Reference]
(
	[ProductReferenceId]    BIGINT IDENTITY (1,1) NOT NULL,
	[Item_Code] VARCHAR(70) NOT NULL,
	[Item_Desc] VARCHAR(100) NOT NULL,
	[CreateDate]    DATETIME            NULL CONSTRAINT [DF_Product_Ref_CreateDate] DEFAULT (getdate()),
    [CreatedBy]	    VARCHAR (60)        NULL CONSTRAINT [DF_Product_Ref_CreatedBy] DEFAULT (suser_sname()),
    [UpdateDate]    DATETIME            NULL,
    [UpdatedBy]     VARCHAR (60)        NULL,
    CONSTRAINT [PK_Product_Ref_Product_Ref] PRIMARY KEY CLUSTERED ([Item_Code] ASC)
)
GO
CREATE Trigger [dbo].[TR_Product_Ref_UpdateDate_UpdatedBy] on [dbo].[tblProduct_Reference]
AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE [tblProduct_Reference] SET [UpdateDate] = GETDATE(), [UpdatedBy] = SUSER_SNAME()
	FROM [tblProduct_Reference] AS a
	INNER JOIN Inserted AS i 
	ON a.[ProductReferenceId] = i.[ProductReferenceId]
END


