IF NOT EXISTS(	SELECT * FROM sys.columns 
			WHERE Name = N'ClientId' AND Object_ID = Object_ID(N'[prod].[WishListItemNotifications]'))    
BEGIN
	PRINT 'Добавляем столбец ClientId таблицы [prod].[WishListItemNotifications]'
	ALTER TABLE [prod].[WishListItemNotifications]
	ADD [ClientId] [nvarchar](64) NULL
END
GO

IF EXISTS(	SELECT * FROM sys.columns 
			WHERE Name = N'UserId' AND Object_ID = Object_ID(N'[prod].[WishListItemNotifications]')) 
BEGIN
	UPDATE [prod].[WishListItemNotifications]
	SET [ClientId] = [UserId]
	WHERE [ClientId] IS NULL
	
	IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[prod].[WishListItemNotifications]') AND name = N'PK_WishListItemNotifications')
	BEGIN
		ALTER TABLE [prod].[WishListItemNotifications] DROP CONSTRAINT [PK_WishListItemNotifications]
	END
	
	ALTER TABLE [prod].[WishListItemNotifications]
	DROP COLUMN [UserId]
END 
GO

ALTER TABLE [prod].[WishListItemNotifications]
ALTER COLUMN [ClientId] [nvarchar](64) NOT NULL
GO

IF  NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[prod].[WishListItemNotifications]') AND name = N'PK_WishListItemNotifications')
BEGIN
	ALTER TABLE [prod].[WishListItemNotifications] ADD  CONSTRAINT [PK_WishListItemNotifications] PRIMARY KEY CLUSTERED 
	(
		[ClientId] ASC,
		[ProductId] ASC
	)
END
GO