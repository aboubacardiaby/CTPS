/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
INSERT [dbo].[tblProduct_Reference]([Item_Code],[Item_Desc]) VALUES('09','09  Sheet  Light Plastic')
INSERT [dbo].[tblProduct_Reference]([Item_Code],[Item_Desc]) VALUES('04','04  Top Frame  Plastic')
INSERT [dbo].[tblProduct_Reference]([Item_Code],[Item_Desc]) VALUES('13','13  Competitor Material')
INSERT [dbo].[tblProduct_Reference]([Item_Code],[Item_Desc]) VALUES('06','06  Sheet  Heavy Paper')
INSERT [dbo].[tblProduct_Reference]([Item_Code],[Item_Desc]) VALUES('02','02  Pallet  Wood Can')
INSERT [dbo].[tblProduct_Reference]([Item_Code],[Item_Desc]) VALUES('01','01  Pallet  Plastic Can')
INSERT [dbo].[tblProduct_Reference]([Item_Code],[Item_Desc]) VALUES('05','05  Top Frame  Wood')
INSERT [dbo].[tblProduct_Reference]([Item_Code],[Item_Desc]) VALUES('08','08  Sheet  Heavy Plastic')
INSERT [dbo].[tblProduct_Reference]([Item_Code],[Item_Desc]) VALUES('07','07  Sheet  Light Paper')
INSERT [dbo].[tblProduct_Reference]([Item_Code],[Item_Desc]) VALUES('16','16  Used Top')
INSERT [dbo].[tblProduct_Reference]([Item_Code],[Item_Desc]) VALUES('14','14  Pallet  Plastic End')
INSERT [dbo].[tblProduct_Reference]([Item_Code],[Item_Desc]) VALUES('11','11  Foam')
