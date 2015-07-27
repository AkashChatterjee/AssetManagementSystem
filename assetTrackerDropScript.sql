/* ---------------------------------------------------------------------- */
/* Script generated with: DeZign for Databases V8.1.2                     */
/* Target DBMS:           MS SQL Server 2012                              */
/* Project file:          AssetManagementER3.dez                          */
/* Project name:                                                          */
/* Author:                                                                */
/* Script type:           Database drop script                            */
/* Created on:            2015-07-27 21:12                                */
/* ---------------------------------------------------------------------- */


/* ---------------------------------------------------------------------- */
/* Drop foreign key constraints                                           */
/* ---------------------------------------------------------------------- */

GO


ALTER TABLE [AssetMaster] DROP CONSTRAINT [RepairHistory_AssetMaster]
GO


ALTER TABLE [Type] DROP CONSTRAINT [Manufacturer_Type]
GO


ALTER TABLE [Type] DROP CONSTRAINT [Category_Type]
GO


ALTER TABLE [Configuration] DROP CONSTRAINT [Type_Configuration]
GO


ALTER TABLE [OrderInfo] DROP CONSTRAINT [Vendor_OrderInfo]
GO


ALTER TABLE [OrderInfo] DROP CONSTRAINT [Type_OrderInfo]
GO


ALTER TABLE [AssignedInfo] DROP CONSTRAINT [AssetMaster_AssignedInfo]
GO


ALTER TABLE [AssignedInfo] DROP CONSTRAINT [EmployeeMaster_AssignedInfo]
GO


ALTER TABLE [AssignedInfo] DROP CONSTRAINT [LocationMaster_AssignedInfo]
GO


ALTER TABLE [EmployeeMaster] DROP CONSTRAINT [LocationMaster_EmployeeMaster]
GO


ALTER TABLE [LocationMaster] DROP CONSTRAINT [EmployeeMaster_LocationMaster]
GO


ALTER TABLE [RepairHistory] DROP CONSTRAINT [WarrantyInfo_RepairHistory]
GO


ALTER TABLE [RepairHistory] DROP CONSTRAINT [AMCInfo_RepairHistory]
GO


ALTER TABLE [WarrantyInfo] DROP CONSTRAINT [Vendor_WarrantyInfo]
GO


ALTER TABLE [AMCInfo] DROP CONSTRAINT [Vendor_AMCInfo]
GO


ALTER TABLE [AMCHistory] DROP CONSTRAINT [AMCInfo_AMCHistory]
GO


ALTER TABLE [VendorContact] DROP CONSTRAINT [Vendor_VendorContact]
GO


ALTER TABLE [PreferenceVendor] DROP CONSTRAINT [Category_PreferenceVendor]
GO


ALTER TABLE [PreferenceVendor] DROP CONSTRAINT [Vendor_PreferenceVendor]
GO


ALTER TABLE [categoryAttributes] DROP CONSTRAINT [Category_categoryAttributes]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "LocationMaster"                                            */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [LocationMaster] DROP CONSTRAINT [PK_LocationMaster]
GO


DROP TABLE [LocationMaster]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "EmployeeMaster"                                            */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [EmployeeMaster] DROP CONSTRAINT [PK_EmployeeMaster]
GO


DROP TABLE [EmployeeMaster]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "AssignedInfo"                                              */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [AssignedInfo] DROP CONSTRAINT [PK_AssignedInfo]
GO


DROP TABLE [AssignedInfo]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "AssetMaster"                                               */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [AssetMaster] DROP CONSTRAINT [PK_AssetMaster]
GO


DROP TABLE [AssetMaster]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "RepairHistory"                                             */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [RepairHistory] DROP CONSTRAINT [PK_RepairHistory]
GO


DROP TABLE [RepairHistory]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "OrderInfo"                                                 */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [OrderInfo] DROP CONSTRAINT [PK_OrderInfo]
GO


DROP TABLE [OrderInfo]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "Configuration"                                             */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [Configuration] DROP CONSTRAINT [PK_Configuration]
GO


DROP TABLE [Configuration]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "Type"                                                      */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [Type] DROP CONSTRAINT [PK_Type]
GO


DROP TABLE [Type]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "categoryAttributes"                                        */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [categoryAttributes] DROP CONSTRAINT [PK_categoryAttributes]
GO


DROP TABLE [categoryAttributes]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "PreferenceVendor"                                          */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [PreferenceVendor] DROP CONSTRAINT [PK_PreferenceVendor]
GO


DROP TABLE [PreferenceVendor]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "Manufacturer"                                              */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [Manufacturer] DROP CONSTRAINT [PK_Manufacturer]
GO


DROP TABLE [Manufacturer]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "VendorContact"                                             */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [VendorContact] DROP CONSTRAINT [PK_VendorContact]
GO


DROP TABLE [VendorContact]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "AMCHistory"                                                */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [AMCHistory] DROP CONSTRAINT [PK_AMCHistory]
GO


DROP TABLE [AMCHistory]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "AMCInfo"                                                   */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [AMCInfo] DROP CONSTRAINT [PK_AMCInfo]
GO


DROP TABLE [AMCInfo]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "WarrantyInfo"                                              */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [WarrantyInfo] DROP CONSTRAINT [PK_WarrantyInfo]
GO


DROP TABLE [WarrantyInfo]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "Vendor"                                                    */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [Vendor] DROP CONSTRAINT [PK_Vendor]
GO


DROP TABLE [Vendor]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "Category"                                                  */
/* ---------------------------------------------------------------------- */

GO


/* Drop constraints */

ALTER TABLE [Category] DROP CONSTRAINT 
GO


DROP TABLE [Category]
GO

