
IF NOT EXISTS(	SELECT * FROM sys.columns 
			WHERE Name = N'FirstName' AND Object_ID = Object_ID(N'[prod].[WishListItemNotifications]'))    
BEGIN
	PRINT 'Добавляем столбец FirstName таблицы [prod].[WishListItemNotifications]'
	ALTER TABLE [prod].[WishListItemNotifications]
	ADD [FirstName] [nvarchar](50) NOT NULL DEFAULT N''
	ALTER TABLE [prod].[WishListItemNotifications]
	ALTER COLUMN [FirstName] [nvarchar](50) NOT NULL
END
GO

IF NOT EXISTS(	SELECT * FROM sys.columns 
			WHERE Name = N'MiddleName' AND Object_ID = Object_ID(N'[prod].[WishListItemNotifications]'))    
BEGIN
	PRINT 'Добавляем столбец MiddleName таблицы [prod].[WishListItemNotifications]'
	ALTER TABLE [prod].[WishListItemNotifications]
	ADD [MiddleName] [nvarchar](50) NOT NULL DEFAULT N''
	ALTER TABLE [prod].[WishListItemNotifications]
	ALTER COLUMN [MiddleName] [nvarchar](50) NOT NULL
END
GO

IF NOT EXISTS(	SELECT * FROM sys.columns 
			WHERE Name = N'ProductBonusCost' AND Object_ID = Object_ID(N'[prod].[WishListItemNotifications]'))    
BEGIN
	PRINT 'Добавляем столбец ProductBonusCost таблицы [prod].[WishListItemNotifications]'
	ALTER TABLE [prod].[WishListItemNotifications]
	ADD [ProductBonusCost] [money] NOT NULL DEFAULT 0
	ALTER TABLE [prod].[WishListItemNotifications]
	ALTER COLUMN [ProductBonusCost] [money] NOT NULL
END
GO

IF NOT EXISTS(	SELECT * FROM sys.columns 
			WHERE Name = N'ProductTotalCost' AND Object_ID = Object_ID(N'[prod].[WishListItemNotifications]'))    
BEGIN
	PRINT 'Добавляем столбец ProductTotalCost таблицы [prod].[WishListItemNotifications]'
	ALTER TABLE [prod].[WishListItemNotifications]
	ADD [ProductTotalCost] [money] NOT NULL DEFAULT 0
	ALTER TABLE [prod].[WishListItemNotifications]
	ALTER COLUMN [ProductTotalCost] [money] NOT NULL
END
GO