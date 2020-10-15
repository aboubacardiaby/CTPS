CREATE TABLE [dbo].[tblFoodSale]
(
	[FoodSaleId]    BIGINT       IDENTITY (1, 1) NOT NULL,
	[Bill_of_Landing] VARCHAR(70) NULL,
	[Ship_Site] BIGINT NULL,
	[Type] VARCHAR(70) NULL,
	[Ship_Date]  DATETIME  NULL,
	[Time] VARCHAR(70) NULL,
	[Location] VARCHAR(70) NULL,
	[Point_of_Origin] VARCHAR(70) NULL,
	[Item_Number] VARCHAR(70) NOT NULL,
	[Description] VARCHAR(100) NULL,
	[Desc] VARCHAR(70) NULL,
	[Qty] BIGINT  NULL,
	[Item_Type] VARCHAR(70) NULL,
	[Ship_To] VARCHAR(70) NULL,
	[Sort_Name] VARCHAR(70) NULL,
	[Carrier] VARCHAR(70) NULL,
	[Truc_Car] VARCHAR(70) NULL,
	[Seals] VARCHAR(70) NULL,
	[Biller] VARCHAR(70) NULL,
	[Loader] VARCHAR(70) NULL,
	[Remarks] VARCHAR(Max) NULL,	
	[CreateDate] DATETIME     NOT NULL CONSTRAINT [DF_FoodSale_CreateDate] DEFAULT (getdate()),
	[CreatedBy]	 VARCHAR (60) NOT NULL CONSTRAINT [DF_FoodSale_CreatedBy] DEFAULT (suser_sname()),
	[UpdateDate] DATETIME     NULL,
	[UpdatedBy]  VARCHAR (60) NULL,
   CONSTRAINT [PK_FoodSale_FoodSale] PRIMARY KEY CLUSTERED ([FoodSaleId] ASC),
   CONSTRAINT [FK_tblProduct__tblFoodSale] FOREIGN KEY ([Item_Number]) REFERENCES [dbo].[tblProduct] ([Item_Number]),
   CONSTRAINT [FK_tblFoodSaleSale_tblReference] FOREIGN KEY ([Point_of_Origin]) REFERENCES [dbo].[tblCustomerReference] ([CustomerCode]),
     
)
GO
CREATE Trigger [dbo].[TR_FoodSale_UpdateDate_UpdatedBy] on [dbo].[tblFoodSale]
AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE [tblFoodSale] SET [UpdateDate] = GETDATE(), [UpdatedBy] = SUSER_SNAME()
	FROM [tblFoodSale] AS a
	INNER JOIN Inserted AS i 
	ON a.[FoodSaleId] = i.[FoodSaleId]
END
