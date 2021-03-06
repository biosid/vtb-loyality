IF EXISTS(	SELECT * FROM sys.columns 
				WHERE Name = N'ExternalStatusId' AND Object_ID = Object_ID(N'[promo].[Rules]'))    
BEGIN
	PRINT 'Удаляем столбец ExternalStatusId в таблицу [promo].[Rules]'
    ALTER TABLE [promo].[Rules]
    DROP COLUMN [ExternalStatusId]
END
GO

IF EXISTS(	SELECT * FROM sys.columns 
				WHERE Name = N'ExternalStatusId' AND Object_ID = Object_ID(N'[promo].[RuleHistories]'))    
BEGIN
	PRINT 'Удаляем столбец ExternalStatusId в таблицу [promo].[RuleHistories]'
    ALTER TABLE [promo].[RuleHistories]
    DROP COLUMN [ExternalStatusId]
END
GO


IF NOT EXISTS(	SELECT * FROM sys.columns 
				WHERE Name = N'Approved' AND Object_ID = Object_ID(N'[promo].[Rules]'))    
BEGIN
	PRINT 'Добавляем столбец Approved в таблицу [promo].[Rules]'
    ALTER TABLE [promo].[Rules]
    ADD [Approved] [int] NOT NULL default(0)	
END
ELSE 
BEGIN
	PRINT 'Убиваем столбец Approved и создаем'
	DECLARE @default sysname, @sql nvarchar(max)
	-- get name of default constraint
	SELECT @default = name 
	FROM sys.default_constraints 
	WHERE parent_object_id = Object_ID('[promo].[Rules]')
	AND type = 'D'
	AND parent_column_id = (
		SELECT column_id 
		FROM sys.columns 
		WHERE Object_ID = Object_ID('[promo].[Rules]')
		AND name = 'Approved'
	)
	PRINT @default
	-- create alter table command as string and run it
	SET @sql = N'ALTER TABLE [promo].[Rules] DROP CONSTRAINT ' + @default
	EXEC sp_executesql @sql

	ALTER TABLE [promo].[Rules]
	DROP COLUMN [Approved]

	ALTER TABLE [promo].[Rules]
    ADD [Approved] [int] NOT NULL default(0)
END
GO

IF NOT EXISTS(	SELECT * FROM sys.columns 
				WHERE Name = N'ApproveDescription' AND Object_ID = Object_ID(N'[promo].[Rules]'))    
BEGIN
	PRINT 'Добавляем столбец ApproveDescription в таблицу [promo].[Rules]'
    ALTER TABLE [promo].[Rules]
    ADD [ApproveDescription] [nvarchar](255) NULL
END
GO

IF NOT EXISTS(	SELECT * FROM sys.columns 
				WHERE Name = N'Approved' AND Object_ID = Object_ID(N'[promo].[RuleHistories]'))    
BEGIN
	PRINT 'Добавляем столбец Approved в таблицу [promo].[RuleHistories]'
    ALTER TABLE [promo].[RuleHistories]
    ADD [Approved] [int] NOT NULL default(0)	
END
ELSE 
BEGIN
	PRINT 'Убиваем столбец Approved и создаем'
	DECLARE @default sysname, @sql nvarchar(max)
	-- get name of default constraint
	SELECT @default = name 
	FROM sys.default_constraints 
	WHERE parent_object_id = Object_ID('[promo].[RuleHistories]')
	AND type = 'D'
	AND parent_column_id = (
		SELECT column_id 
		FROM sys.columns 
		WHERE Object_ID = Object_ID('[promo].[RuleHistories]')
		AND name = 'Approved'
	)
	-- create alter table command as string and run it
	SET @sql = N'ALTER TABLE [promo].[RuleHistories] DROP CONSTRAINT ' + @default
	EXEC sp_executesql @sql
	
	ALTER TABLE [promo].[RuleHistories]
	DROP COLUMN [Approved]

	ALTER TABLE [promo].[RuleHistories]
    ADD [Approved] [int] NOT NULL default(0)
END
GO

IF NOT EXISTS(	SELECT * FROM sys.columns 
				WHERE Name = N'ApproveDescription' AND Object_ID = Object_ID(N'[promo].[RuleHistories]'))    
BEGIN
	PRINT 'Добавляем столбец ApproveDescription в таблицу [promo].[RuleHistories]'
    ALTER TABLE [promo].[RuleHistories]
    ADD [ApproveDescription] [nvarchar](255) NULL
END
