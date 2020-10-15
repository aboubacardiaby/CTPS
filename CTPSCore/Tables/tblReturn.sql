CREATE TABLE [dbo].[tblReturn]
(
	[ReturnId]    BIGINT       IDENTITY (1, 1) NOT NULL,
	[Transfer] VARCHAR(50)  NOT NULL,
	[Shipper_PO] VARCHAR(50)  NOT NULL,
	[Pro_Num] VARCHAR(50)  NOT NULL,
	[Type] VARCHAR(50)  NOT NULL,
	[Date] DATETIME NOT NULL,
	[To_NT_Code] VARCHAR(50)  NOT NULL,
	[To_Name] VARCHAR(50)  NOT NULL,
	[From_NT_Code] VARCHAR(50)  NOT NULL,
	[From_Ball_ID] VARCHAR(70)  NOT NULL,
	[From_Name]  VARCHAR(50)  NOT NULL,
	[Item_NT] VARCHAR(50)  NOT NULL,
	[Item_Ball] VARCHAR(70)  NOT NULL,
	[Quantity] BIGINT  NOT NULL,
	[Scrap] BIGINT  NOT NULL,
	[Special_Cleaning] BIGINT NOT NULL,
	[Repair] BIGINT  NOT NULL,
	[CreateDate] DATETIME     NOT NULL CONSTRAINT [DF_Return_CreateDate] DEFAULT (getdate()),
    [CreatedBy]	 VARCHAR (60) NOT NULL CONSTRAINT [DF_Return_CreatedBy] DEFAULT (suser_sname()),
    [UpdateDate] DATETIME     NULL,
    [UpdatedBy]  VARCHAR (60) NULL,
    CONSTRAINT [PK_Return_Return] PRIMARY KEY CLUSTERED ([ReturnId] ASC),
	CONSTRAINT [FK_tblReturn_tblReference] FOREIGN KEY ([From_Ball_ID]) REFERENCES [dbo].[tblCustomerReference] ([CustomerCode]),
	CONSTRAINT [FK_tblReturn_tblProduct] FOREIGN KEY ([Item_Ball]) REFERENCES [dbo].[tblProduct_REFERENCE] ([Item_Code])
)
GO
CREATE Trigger [dbo].[TR_Return_UpdateDate_UpdatedBy] on [dbo].[tblCustomerReference]
AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE [tblCustomerReference] SET [UpdateDate] = GETDATE(), [UpdatedBy] = SUSER_SNAME()
	FROM [tblCustomerReference] AS a
	INNER JOIN Inserted AS i 
	ON a.[ReferenceId] = i.[ReferenceId]
END


