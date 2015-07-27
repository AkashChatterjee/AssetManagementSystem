/* ---------------------------------------------------------------------- */
/* Script generated with: DeZign for Databases V8.1.2                     */
/* Target DBMS:           MS SQL Server 2012                              */
/* Project file:          AssetManagementER3.dez                          */
/* Project name:                                                          */
/* Author:                                                                */
/* Script type:           Database creation script                        */
/* Created on:            2015-07-27 21:12                                */
/* ---------------------------------------------------------------------- */


/* ---------------------------------------------------------------------- */
/* Add tables                                                             */
/* ---------------------------------------------------------------------- */

GO


/* ---------------------------------------------------------------------- */
/* Add table "Category"                                                   */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [Category] (
    [categoryID] VARCHAR(40) NOT NULL,
    [Description] VARCHAR(100),
    PRIMARY KEY ([categoryID])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "Vendor"                                                     */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [Vendor] (
    [vendorName] VARCHAR(40) NOT NULL,
    [website] VARCHAR(40),
    [supportNumber] VARCHAR(10),
    [supportEmail] VARCHAR(40),
    [address] VARCHAR(100),
    [isActive] BINARY(1),
    [isBlacklisted] BINARY(1),
    [description] VARCHAR(100),
    CONSTRAINT [PK_Vendor] PRIMARY KEY ([vendorName])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "WarrantyInfo"                                               */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [WarrantyInfo] (
    [warrantyID] VARCHAR(40) NOT NULL,
    [startDate] DATE,
    [endDate] DATE,
    [vendorName] VARCHAR(40),
    CONSTRAINT [PK_WarrantyInfo] PRIMARY KEY ([warrantyID])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "AMCInfo"                                                    */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [AMCInfo] (
    [amcID] VARCHAR(40) NOT NULL,
    [startDate] DATE,
    [endDate] DATE,
    [vendorName] VARCHAR(40),
    CONSTRAINT [PK_AMCInfo] PRIMARY KEY ([amcID])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "AMCHistory"                                                 */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [AMCHistory] (
    [sno] INTEGER IDENTITY(1,1) NOT NULL,
    [startDate] DATE,
    [endDate] DATE,
    [isActive] BINARY(1),
    [amcID] VARCHAR(40),
    CONSTRAINT [PK_AMCHistory] PRIMARY KEY ([sno])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "VendorContact"                                              */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [VendorContact] (
    [sno] INTEGER IDENTITY(1,1) NOT NULL,
    [contactFName] VARCHAR(40),
    [contactLNAME] VARCHAR(40),
    [contactNumber] VARCHAR(40),
    [contactEmail] VARCHAR(40),
    [vendorName] VARCHAR(40),
    CONSTRAINT [PK_VendorContact] PRIMARY KEY ([sno])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "Manufacturer"                                               */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [Manufacturer] (
    [ManufacturerName] VARCHAR(40) NOT NULL,
    [website] VARCHAR(40),
    [supportNumber] VARCHAR(10),
    [supportEmail] VARCHAR(40),
    [address] VARCHAR(100),
    [isActive] BINARY(1),
    [isBlacklisted] BINARY(1),
    [description] VARCHAR(100),
    CONSTRAINT [PK_Manufacturer] PRIMARY KEY ([ManufacturerName])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "PreferenceVendor"                                           */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [PreferenceVendor] (
    [vendorName] VARCHAR(40) NOT NULL,
    [categoryID] VARCHAR(40) NOT NULL,
    CONSTRAINT [PK_PreferenceVendor] PRIMARY KEY ([vendorName], [categoryID])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "categoryAttributes"                                         */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [categoryAttributes] (
    [categoryID] VARCHAR(40) NOT NULL,
    [attributeID] VARCHAR(40) NOT NULL,
    [units] VARCHAR(40),
    CONSTRAINT [PK_categoryAttributes] PRIMARY KEY ([categoryID], [attributeID])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "Type"                                                       */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [Type] (
    [typeID] VARCHAR(40) NOT NULL,
    [typeLife] INTEGER,
    [description] VARCHAR(100),
    [ManufacturerName] VARCHAR(40) NOT NULL,
    [categoryID] VARCHAR(40) NOT NULL,
    CONSTRAINT [PK_Type] PRIMARY KEY ([typeID])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "Configuration"                                              */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [Configuration] (
    [typeID] VARCHAR(40) NOT NULL,
    [ConfigurationID] INTEGER NOT NULL,
    [configName] VARCHAR(40) NOT NULL,
    [configValue] VARCHAR(40) NOT NULL,
    CONSTRAINT [PK_Configuration] PRIMARY KEY ([typeID], [ConfigurationID], [configName])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "OrderInfo"                                                  */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [OrderInfo] (
    [orderID] VARCHAR(40) NOT NULL,
    [orderDate] DATE,
    [typeID] VARCHAR(40) NOT NULL,
    [quantity] INTEGER,
    [costPerItem] INTEGER,
    [warrantyID] VARCHAR(40),
    [amcID] VARCHAR(40),
    [vendorName] VARCHAR(40),
    [orderSummary] VARCHAR(40),
    CONSTRAINT [PK_OrderInfo] PRIMARY KEY ([orderID], [typeID])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "RepairHistory"                                              */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [RepairHistory] (
    [repairHistoryID] VARCHAR(40) NOT NULL,
    [problemDescription] VARCHAR(100),
    [toRepairOn] DATE,
    [fromRepairOn] DATE,
    [isUnderRepair] BINARY(1),
    [warrantyID] VARCHAR(40),
    [amcID] VARCHAR(40),
    CONSTRAINT [PK_RepairHistory] PRIMARY KEY ([repairHistoryID])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "AssetMaster"                                                */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [AssetMaster] (
    [assetID] VARCHAR(40) NOT NULL,
    [serialNumber] VARCHAR(40),
    [orderID] VARCHAR(40),
    [repairHistoryID] VARCHAR(40),
    [isAssigned] BINARY(1) NOT NULL,
    [Validity] INTEGER NOT NULL,
    [ConfigurationID] INTEGER NOT NULL,
    CONSTRAINT [PK_AssetMaster] PRIMARY KEY ([assetID])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "AssignedInfo"                                               */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [AssignedInfo] (
    [sno] INTEGER IDENTITY(1,1) NOT NULL,
    [assetID] VARCHAR(40) NOT NULL,
    [locationID] VARCHAR(40),
    [employeeID] VARCHAR(40),
    [issueDate] DATE,
    [returnedDate] DATE,
    CONSTRAINT [PK_AssignedInfo] PRIMARY KEY ([sno])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "EmployeeMaster"                                             */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [EmployeeMaster] (
    [employeeID] VARCHAR(40) NOT NULL,
    [fname] VARCHAR(40),
    [lname] VARCHAR(40),
    [DOB] DATE,
    [locationID] VARCHAR(40),
    [contactNumber] VARCHAR(10),
    [email] VARCHAR(40),
    [isEmployed] BINARY(1),
    CONSTRAINT [PK_EmployeeMaster] PRIMARY KEY ([employeeID])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "LocationMaster"                                             */
/* ---------------------------------------------------------------------- */

GO


CREATE TABLE [LocationMaster] (
    [locationID] VARCHAR(40) NOT NULL,
    [locationName] VARCHAR(40),
    [locationHeadID] VARCHAR(40) NOT NULL,
    [locationContact] VARCHAR(10),
    [localEmail] VARCHAR(40),
    [isOperational] BINARY(1),
    CONSTRAINT [PK_LocationMaster] PRIMARY KEY ([locationID])
)
GO


/* ---------------------------------------------------------------------- */
/* Add foreign key constraints                                            */
/* ---------------------------------------------------------------------- */

GO


ALTER TABLE [AssetMaster] ADD CONSTRAINT [RepairHistory_AssetMaster] 
    FOREIGN KEY ([repairHistoryID]) REFERENCES [RepairHistory] ([repairHistoryID])
GO


ALTER TABLE [Type] ADD CONSTRAINT [Manufacturer_Type] 
    FOREIGN KEY ([ManufacturerName]) REFERENCES [Manufacturer] ([ManufacturerName])
GO


ALTER TABLE [Type] ADD CONSTRAINT [Category_Type] 
    FOREIGN KEY ([categoryID]) REFERENCES [Category] ([categoryID])
GO


ALTER TABLE [Configuration] ADD CONSTRAINT [Type_Configuration] 
    FOREIGN KEY ([typeID]) REFERENCES [Type] ([typeID])
GO


ALTER TABLE [OrderInfo] ADD CONSTRAINT [Vendor_OrderInfo] 
    FOREIGN KEY ([vendorName]) REFERENCES [Vendor] ([vendorName])
GO


ALTER TABLE [OrderInfo] ADD CONSTRAINT [Type_OrderInfo] 
    FOREIGN KEY ([typeID]) REFERENCES [Type] ([typeID])
GO


ALTER TABLE [AssignedInfo] ADD CONSTRAINT [AssetMaster_AssignedInfo] 
    FOREIGN KEY ([assetID]) REFERENCES [AssetMaster] ([assetID])
GO


ALTER TABLE [AssignedInfo] ADD CONSTRAINT [EmployeeMaster_AssignedInfo] 
    FOREIGN KEY ([employeeID]) REFERENCES [EmployeeMaster] ([employeeID])
GO


ALTER TABLE [AssignedInfo] ADD CONSTRAINT [LocationMaster_AssignedInfo] 
    FOREIGN KEY ([locationID]) REFERENCES [LocationMaster] ([locationID])
GO


ALTER TABLE [EmployeeMaster] ADD CONSTRAINT [LocationMaster_EmployeeMaster] 
    FOREIGN KEY ([locationID]) REFERENCES [LocationMaster] ([locationID])
GO


ALTER TABLE [LocationMaster] ADD CONSTRAINT [EmployeeMaster_LocationMaster] 
    FOREIGN KEY ([locationHeadID]) REFERENCES [EmployeeMaster] ([employeeID])
GO


ALTER TABLE [RepairHistory] ADD CONSTRAINT [WarrantyInfo_RepairHistory] 
    FOREIGN KEY ([warrantyID]) REFERENCES [WarrantyInfo] ([warrantyID])
GO


ALTER TABLE [RepairHistory] ADD CONSTRAINT [AMCInfo_RepairHistory] 
    FOREIGN KEY ([amcID]) REFERENCES [AMCInfo] ([amcID])
GO


ALTER TABLE [WarrantyInfo] ADD CONSTRAINT [Vendor_WarrantyInfo] 
    FOREIGN KEY ([vendorName]) REFERENCES [Vendor] ([vendorName])
GO


ALTER TABLE [AMCInfo] ADD CONSTRAINT [Vendor_AMCInfo] 
    FOREIGN KEY ([vendorName]) REFERENCES [Vendor] ([vendorName])
GO


ALTER TABLE [AMCHistory] ADD CONSTRAINT [AMCInfo_AMCHistory] 
    FOREIGN KEY ([amcID]) REFERENCES [AMCInfo] ([amcID])
GO


ALTER TABLE [VendorContact] ADD CONSTRAINT [Vendor_VendorContact] 
    FOREIGN KEY ([vendorName]) REFERENCES [Vendor] ([vendorName])
GO


ALTER TABLE [PreferenceVendor] ADD CONSTRAINT [Category_PreferenceVendor] 
    FOREIGN KEY ([categoryID]) REFERENCES [Category] ([categoryID])
GO


ALTER TABLE [PreferenceVendor] ADD CONSTRAINT [Vendor_PreferenceVendor] 
    FOREIGN KEY ([vendorName]) REFERENCES [Vendor] ([vendorName])
GO


ALTER TABLE [categoryAttributes] ADD CONSTRAINT [Category_categoryAttributes] 
    FOREIGN KEY ([categoryID]) REFERENCES [Category] ([categoryID])
GO

