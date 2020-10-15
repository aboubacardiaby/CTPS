CREATE TABLE [dbo].[tblProduct]
(
	[ProductId]      BIGINT       IDENTITY (1, 1) NOT NULL,
	[Item_Number]    varchar(70)  NOT  NULL,
	[Item_Group]     VARCHAR (75)   NOT  NULL,
	[Description]    VARCHAR (Max)  NOT NULL,
	[Customer_Group] VARCHAR (75)  NOT NULL,
	[Material_Type]  VARCHAR (75) NULL,
	[Colors]         VARCHAR (75)      NULL,
	[Weight]         VARCHAR (75)      NULL,
	[Dimension]      VARCHAR (75)      NULL,
	[Grouping]       VARCHAR (75)      NULL,
	[Comment]        VARCHAR (Max)      NULL,
	[CreateDate]     DATETIME            NULL CONSTRAINT [DF_Product_CreateDate] DEFAULT (getdate()),
    [CreatedBy]	     VARCHAR (60)        NULL CONSTRAINT [DF_Product_CreatedBy] DEFAULT (suser_sname()),
    [UpdateDate]     DATETIME            NULL,
    [UpdatedBy]      VARCHAR (60)        NULL,
    CONSTRAINT [PK_Product_Product] PRIMARY KEY CLUSTERED ([Item_Number] ASC),
	--CONSTRAINT [FK_tblProduct__tblFoodSale] FOREIGN KEY ([Item_Number]) REFERENCES [dbo].[tblFoodSale] ([Item_Number]),
   -- CONSTRAINT [FK_tblProduct_tblproductReference] FOREIGN KEY ([Item_Number]) REFERENCES [dbo].[tblProduct_Reference] ([Item_Code]),
)
GO
CREATE Trigger [dbo].[TR_Product_UpdateDate_UpdatedBy] on [dbo].[tblProduct]
AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE [tblProduct] SET [UpdateDate] = GETDATE(), [UpdatedBy] = SUSER_SNAME()
	FROM [tblProduct] AS a
	INNER JOIN Inserted AS i 
	ON a.[ProductId] = i.[ProductId]
END

