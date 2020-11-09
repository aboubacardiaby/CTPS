CREATE TABLE [dbo].[tblBeverageSale]
(
	[BeverageSaleId]    BIGINT       IDENTITY (1, 1) NOT NULL,
	[Bol_Number]   VARCHAR(50)  NOT NULL,
	[Item_Code] VARCHAR(70) NOT NULL,
	[MaterialId]    BIGINT NOT NULL,
	[Ship_To]    VARCHAR(70) NOT NULL,
	[Ship_To_Aplha_Name]   VARCHAR(50)  NOT NULL,
	[Sold_To]       VARCHAR(50)  NOT NULL,
	[Sold_To_Alpha_Name]   VARCHAR(50)  NOT NULL,
	[Ship_From]   VARCHAR(70)  NOT NULL,
	[Ship_Date]   DATETIME  NOT NULL,
	[Ship_Time]   VARCHAR(50)  NOT NULL,
	[Promised_Date]   DATETIME  NOT NULL,
	[Promised_Time]   VARCHAR(50)  NOT NULL,
	[Carrier]   VARCHAR(50)  NOT NULL,
	[Trailer_Number]   VARCHAR(50)  NOT NULL,
	[Seal_Number]   VARCHAR(50)  NOT NULL,
	[Customer_PO]   VARCHAR(50)  NOT NULL,
	[Customer_Release]   VARCHAR(50)  NOT NULL,
	[Customer_Reference]   VARCHAR(50)  NOT NULL,
	[Item_Number]   VARCHAR(50)  NOT NULL,	
	[Quantity]   VARCHAR(50)  NOT NULL,	
	[Eaches]   VARCHAR(50)  NOT NULL,
	[Customer_Item]   VARCHAR(50)  NOT NULL,
	[Item_Description]   VARCHAR(max)  NOT NULL,
	[Size]   VARCHAR(50)  NOT NULL,
	[Neck_Size]  VARCHAR(50)  NOT NULL,
	[CAN_END]  VARCHAR(50)  NOT NULL,
	[CreateDate] DATETIME     NOT NULL CONSTRAINT [DF_Beverage_CreateDate] DEFAULT (getdate()),
	[CreatedBy]	 VARCHAR (60) NOT NULL CONSTRAINT [DF_Beverage_CreatedBy] DEFAULT (suser_sname()),
	[UpdateDate] DATETIME     NULL,
	[UpdatedBy]  VARCHAR (60) NULL,
   CONSTRAINT [PK_Beverage_Beverage] PRIMARY KEY CLUSTERED ([BeverageSaleId] ASC),
   CONSTRAINT [FK_tblBeverageSale_tblReference] FOREIGN KEY ([Ship_To]) REFERENCES [dbo].[tblCustomerReference] ([CustomerCode]),
   CONSTRAINT [FK_tblBeverageSale_tblproductReference] FOREIGN KEY ([Item_Code]) REFERENCES [dbo].[tblProduct_Reference] ([Item_Code]),
   CONSTRAINT [FK_tblBeverageSale_tblMaterial] FOREIGN KEY (MaterialId) REFERENCES [dbo].[tblMaterial_Handling] ([MaterialId]),
   --CONSTRAINT [FK_tblPlantSale_tblBeverage] FOREIGN KEY ([Ship_from]) REFERENCES [dbo].[tblPlant] ([Ship_from]),
   --CONSTRAINT [FK_tblwarehouse_tblBeverage] FOREIGN KEY ([Ship_To]) REFERENCES [dbo].[tblWarehouse] ([Ship_To])
)
GO
CREATE Trigger [dbo].[TR_Beverage_UpdateDate_UpdatedBy] on [dbo].[tblBeverageSale]
AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE [tblBeverageSale] SET [UpdateDate] = GETDATE(), [UpdatedBy] = SUSER_SNAME()
	FROM [tblBeverageSale] AS a
	INNER JOIN Inserted AS i 
	ON a.[BeverageSaleId] = i.[BeverageSaleId]
END

