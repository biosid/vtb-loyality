IF EXISTS (SELECT * FROM sys.objects WHERE type_desc = 'SQL_STORED_PROCEDURE' AND name = 'ProcessingKladr')
BEGIN
	DROP PROCEDURE [Geopoints].[ProcessingKladr]
END;

GO

CREATE PROCEDURE [Geopoints].[ProcessingKladr]
@EtlPackageId uniqueidentifier,
@EtlSessionId uniqueidentifier
AS
BEGIN
	-- Перенос новых данных КЛАДР в таблицу [BufferCityLocation], [BufferStreetLocation]
	INSERT INTO [dbo].[EtlMessages] ([EtlPackageId], [EtlSessionId], [LogDateTime], [LogUtcDateTime], [MessageType], [Text])
    VALUES (@EtlPackageId, @EtlSessionId, GETDATE(), GETUTCDATE(),8, 'BEGIN TRANSFER. [Geopoints].[KLADR]->[BufferCityLocation]');
	INSERT INTO [Geopoints].[BufferCityLocation]
			   ([LocationType],  [Name], [KladrCode], 
			   [Toponym], [RegionCode],
			   [DistrictCode], [CityCode], [TownCode],
			   [CreatedDateTime], [CreatedUtcDateTime])
	SELECT 
	[LEVEL] as LocationType,
	[NAME] as Name,
	[CODE] as KladrCode,
	[SOCR] as [Toponym],
	(CASE WHEN [LEVEL] > 1 THEN [Region] ELSE NULL END) as [RegionCode],
	(CASE WHEN [LEVEL] > 2 AND SUBSTRING([CODE], 3, 3) <> '000' THEN [District] ELSE NULL END) as [DistrictCode],
	(CASE WHEN [LEVEL] > 3 AND SUBSTRING([CODE], 6, 3) <> '000' THEN [City] ELSE NULL END) as [CityCode],
	NULL as [TownCode],
	GETDATE(), GETUTCDATE()
	FROM
		(SELECT [NAME], [SOCR], [CODE],
		(case 
			when SUBSTRING([CODE], 3, 9) = '000000000' then 1
			when SUBSTRING([CODE], 6, 6) = '000000' then 2
			when SUBSTRING([CODE], 9, 3) = '000' then 3
			else 4 END
		) as [LEVEL],
		SUBSTRING([CODE], 1, 2) + '00000000000' as Region,
		SUBSTRING([CODE], 1, 5) + '00000000' as District,
		SUBSTRING([CODE], 1, 8) + '00000' as City
		FROM Geopoints.KLADR) as tk
	INSERT INTO [dbo].[EtlMessages] ([EtlPackageId], [EtlSessionId], [LogDateTime], [LogUtcDateTime], [MessageType], [Text])
    VALUES (@EtlPackageId, @EtlSessionId, GETDATE(), GETUTCDATE(),8, 'END TRANSFER. [Geopoints].[KLADR]->[Geopoints].[BufferCityLocation]');
	
	INSERT INTO [dbo].[EtlMessages] ([EtlPackageId], [EtlSessionId], [LogDateTime], [LogUtcDateTime], [MessageType], [Text])
    VALUES (@EtlPackageId, @EtlSessionId, GETDATE(), GETUTCDATE(),8, 'BEGIN TRANSFER. [Geopoints].[STREET]->[Geopoints].[BufferStreetLocation]');
	INSERT INTO [Geopoints].[BufferStreetLocation]
			   ([LocationType],  [Name], [KladrCode], 
			   [Toponym], [ParentCode],
			   [CreatedDateTime], [CreatedUtcDateTime])
	SELECT
	5 as LocationType,
	[NAME] as Name,
	[CODE] as KladrCode,
	[SOCR] as [Toponym],
	SUBSTRING([CODE], 1, 11) + '00' as ParentCode,
	GETDATE(), GETUTCDATE()
	FROM Geopoints.STREET
	INSERT INTO [dbo].[EtlMessages] ([EtlPackageId], [EtlSessionId], [LogDateTime], [LogUtcDateTime], [MessageType], [Text])
    VALUES (@EtlPackageId, @EtlSessionId, GETDATE(), GETUTCDATE(),8, 'END TRANSFER. [Geopoints].[STREET]->[Geopoints].[BufferStreetLocation]');

	-- Перенос текущей версии в таблицу Geopoints.BufferDestinationLocation
	INSERT INTO [dbo].[EtlMessages] ([EtlPackageId], [EtlSessionId], [LogDateTime], [LogUtcDateTime], [MessageType], [Text])
    VALUES (@EtlPackageId, @EtlSessionId, GETDATE(), GETUTCDATE(),8, 'BEGIN TRANSFER. [Geopoints].[V_Location]->[Geopoints].[BufferDestinationLocation]');
	INSERT INTO [Geopoints].[BufferDestinationLocation]
			   ([Id], [ParentId], [LocationType], [Name]
			   ,[Toponym], [KladrCode]
			   ,[RegionName], [RegionId], [RegionToponym]
			   ,[DistrictName], [DistrictId], [DistrictToponym]
			   ,[CityName], [CityId], [CityToponym], [TownName], [TownId], [TownToponym]
			   ,[EtlPackageId], [EtlSessionId]
			   ,[CreatedDateTime], [CreatedUtcDateTime], [ModifiedDateTime], [ModifiedUtcDateTime])
	SELECT [Id], [ParentId], [LocationType], [Name]
	   ,[Toponym], [KladrCode]
	   ,[RegionName], [RegionId], [RegionToponym]
	   ,[DistrictName], [DistrictId], [DistrictToponym]
	   ,[CityName], [CityId], [CityToponym], [TownName], [TownId], [TownToponym],
	   [EtlPackageId], [EtlSessionId], [CreatedDateTime], [CreatedUtcDateTime], 
	   [ModifiedDateTime], [ModifiedUtcDateTime]
	FROM Geopoints.V_Location
	INSERT INTO [dbo].[EtlMessages] ([EtlPackageId], [EtlSessionId], [LogDateTime], [LogUtcDateTime], [MessageType], [Text])
    VALUES (@EtlPackageId, @EtlSessionId, GETDATE(), GETUTCDATE(),8, 'END TRANSFER. [Geopoints].[V_Location]->[Geopoints].[BufferDestinationLocation]');

	-- Актуализация кодов в текущей версии КЛАДР Geopoints.BufferDestinationLocation
	INSERT INTO [dbo].[EtlMessages] ([EtlPackageId], [EtlSessionId], [LogDateTime], [LogUtcDateTime], [MessageType], [Text])
    VALUES (@EtlPackageId, @EtlSessionId, GETDATE(), GETUTCDATE(),8, 'BEGIN TRANSFER. [Geopoints].[ALTNAMES]->[Geopoints].[BufferDestinationLocation]');
	UPDATE bdl
	SET bdl.KladrCode = an.NEWCODE
	FROM [Geopoints].[BufferDestinationLocation] bdl
	JOIN Geopoints.ALTNAMES an ON bdl.KladrCode = an.OLDCODE
	INSERT INTO [dbo].[EtlMessages] ([EtlPackageId], [EtlSessionId], [LogDateTime], [LogUtcDateTime], [MessageType], [Text])
    VALUES (@EtlPackageId, @EtlSessionId, GETDATE(), GETUTCDATE(),8, 'END TRANSFER. [Geopoints].[ALTNAMES]->[Geopoints].[BufferDestinationLocation]');

	-- Актуализация Id, CreatedDateTime, CreatedUtcDateTime

	INSERT INTO [dbo].[EtlMessages] ([EtlPackageId], [EtlSessionId], [LogDateTime], [LogUtcDateTime], [MessageType], [Text])
    VALUES (@EtlPackageId, @EtlSessionId, GETDATE(), GETUTCDATE(),8, 'BEGIN TRANSFER. [Geopoints].[BufferDestinationLocation]->[Geopoints].[BufferCityLocation]');
	UPDATE sl
	SET
		sl.Id = dl.Id,
		sl.CreatedDateTime = dl.CreatedDateTime,
		sl.CreatedUtcDateTime = sl.CreatedUtcDateTime
	FROM [Geopoints].[BufferCityLocation] sl
	JOIN [Geopoints].[BufferDestinationLocation] dl ON sl.KladrCode = dl.KladrCode
	WHERE dl.EtlPackageId = @EtlPackageId
	INSERT INTO [dbo].[EtlMessages] ([EtlPackageId], [EtlSessionId], [LogDateTime], [LogUtcDateTime], [MessageType], [Text])
    VALUES (@EtlPackageId, @EtlSessionId, GETDATE(), GETUTCDATE(),8, 'END TRANSFER. [Geopoints].[BufferDestinationLocation]->[Geopoints].[BufferCityLocation]');

	INSERT INTO [dbo].[EtlMessages] ([EtlPackageId], [EtlSessionId], [LogDateTime], [LogUtcDateTime], [MessageType], [Text])
    VALUES (@EtlPackageId, @EtlSessionId, GETDATE(), GETUTCDATE(),8, 'BEGIN TRANSFER. [Geopoints].[BufferDestinationLocation]->[Geopoints].[BufferStreetLocation]');
	UPDATE sl
	SET
		sl.Id = dl.Id,
		sl.CreatedDateTime = dl.CreatedDateTime,
		sl.CreatedUtcDateTime = sl.CreatedUtcDateTime
	FROM [Geopoints].[BufferStreetLocation] sl
	JOIN [Geopoints].[BufferDestinationLocation] dl ON sl.KladrCode = dl.KladrCode
	WHERE dl.EtlPackageId = @EtlPackageId
	INSERT INTO [dbo].[EtlMessages] ([EtlPackageId], [EtlSessionId], [LogDateTime], [LogUtcDateTime], [MessageType], [Text])
    VALUES (@EtlPackageId, @EtlSessionId, GETDATE(), GETUTCDATE(),8, 'END TRANSFER. [Geopoints].[BufferDestinationLocation]->[Geopoints].[BufferStreetLocation]');

	INSERT INTO [dbo].[EtlMessages] ([EtlPackageId], [EtlSessionId], [LogDateTime], [LogUtcDateTime], [MessageType], [Text])
    VALUES (@EtlPackageId, @EtlSessionId, GETDATE(), GETUTCDATE(),8, 'BEGIN [Geopoints].[BufferCityLocation]. SET NEW ID');
	UPDATE Geopoints.BufferCityLocation
	SET Id = NewId()
	WHERE Id IS NULL
	INSERT INTO [dbo].[EtlMessages] ([EtlPackageId], [EtlSessionId], [LogDateTime], [LogUtcDateTime], [MessageType], [Text])
    VALUES (@EtlPackageId, @EtlSessionId, GETDATE(), GETUTCDATE(),8, 'END [Geopoints].[BufferCityLocation]. SET NEW ID');

	INSERT INTO [dbo].[EtlMessages] ([EtlPackageId], [EtlSessionId], [LogDateTime], [LogUtcDateTime], [MessageType], [Text])
    VALUES (@EtlPackageId, @EtlSessionId, GETDATE(), GETUTCDATE(),8, 'BEGIN [Geopoints].[BufferStreetLocation]. SET NEW ID');
	UPDATE Geopoints.BufferStreetLocation
	SET Id = NewId()
	WHERE Id IS NULL
	INSERT INTO [dbo].[EtlMessages] ([EtlPackageId], [EtlSessionId], [LogDateTime], [LogUtcDateTime], [MessageType], [Text])
    VALUES (@EtlPackageId, @EtlSessionId, GETDATE(), GETUTCDATE(),8, 'BEGIN [Geopoints].[BufferStreetLocation]. SET NEW ID');

	-- UPDATE Region, District, City in Geopoints.BufferCityLocation

	INSERT INTO [dbo].[EtlMessages] ([EtlPackageId], [EtlSessionId], [LogDateTime], [LogUtcDateTime], [MessageType], [Text])
    VALUES (@EtlPackageId, @EtlSessionId, GETDATE(), GETUTCDATE(),8, 'BEGIN [Geopoints].[BufferCityLocation]. UPDATE REGION');
	UPDATE bl
	SET 
		bl.RegionName = blr.Name,
		bl.RegionId = blr.Id,
		bl.RegionToponym = blr.Toponym,
		bl.ParentId = blr.Id
	FROM Geopoints.BufferCityLocation bl
	JOIN Geopoints.BufferCityLocation blr ON bl.RegionCode = blr.KladrCode;
	INSERT INTO [dbo].[EtlMessages] ([EtlPackageId], [EtlSessionId], [LogDateTime], [LogUtcDateTime], [MessageType], [Text])
    VALUES (@EtlPackageId, @EtlSessionId, GETDATE(), GETUTCDATE(),8, 'END [Geopoints].[BufferCityLocation]. UPDATE REGION');

	INSERT INTO [dbo].[EtlMessages] ([EtlPackageId], [EtlSessionId], [LogDateTime], [LogUtcDateTime], [MessageType], [Text])
    VALUES (@EtlPackageId, @EtlSessionId, GETDATE(), GETUTCDATE(),8, 'BEGIN [Geopoints].[BufferCityLocation]. UPDATE DISTRICT');
	UPDATE bl
	SET 
		bl.DistrictName = blr.Name,
		bl.DistrictId = blr.Id,
		bl.DistrictToponym = blr.Toponym,
		bl.ParentId = blr.Id
	FROM Geopoints.BufferCityLocation bl
	JOIN Geopoints.BufferCityLocation blr ON bl.DistrictCode = blr.KladrCode;
	INSERT INTO [dbo].[EtlMessages] ([EtlPackageId], [EtlSessionId], [LogDateTime], [LogUtcDateTime], [MessageType], [Text])
    VALUES (@EtlPackageId, @EtlSessionId, GETDATE(), GETUTCDATE(),8, 'END [Geopoints].[BufferCityLocation]. UPDATE DISTRICT');

	INSERT INTO [dbo].[EtlMessages] ([EtlPackageId], [EtlSessionId], [LogDateTime], [LogUtcDateTime], [MessageType], [Text])
    VALUES (@EtlPackageId, @EtlSessionId, GETDATE(), GETUTCDATE(),8, 'BEGIN [Geopoints].[BufferCityLocation]. UPDATE CITY');
	UPDATE bl
	SET 
		bl.CityName = blr.Name,
		bl.CityId = blr.Id,
		bl.CityToponym = blr.Toponym,
		bl.ParentId = blr.Id
	FROM Geopoints.BufferCityLocation bl
	JOIN Geopoints.BufferCityLocation blr ON bl.CityCode = blr.KladrCode;
	INSERT INTO [dbo].[EtlMessages] ([EtlPackageId], [EtlSessionId], [LogDateTime], [LogUtcDateTime], [MessageType], [Text])
    VALUES (@EtlPackageId, @EtlSessionId, GETDATE(), GETUTCDATE(),8, 'END [Geopoints].[BufferCityLocation]. UPDATE CITY');

	-- UPDATE Region, District, City, Town in Geopoints.BufferCityLocation

	INSERT INTO [dbo].[EtlMessages] ([EtlPackageId], [EtlSessionId], [LogDateTime], [LogUtcDateTime], [MessageType], [Text])
    VALUES (@EtlPackageId, @EtlSessionId, GETDATE(), GETUTCDATE(),8, 'BEGIN [Geopoints].[BufferStreetLocation]. UPDATE REGION, DISTRICT, CITY, TOWN');
	UPDATE bl
	SET 
		bl.RegionName = (CASE blr.LocationType WHEN 1 THEN blr.Name ELSE blr.RegionName END),
		bl.RegionId = (CASE blr.LocationType WHEN 1 THEN blr.Id ELSE blr.RegionId END),
		bl.RegionToponym = (CASE blr.LocationType WHEN 1 THEN blr.Toponym ELSE blr.RegionToponym END),
		bl.DistrictName = (CASE blr.LocationType WHEN 2 THEN blr.Name ELSE blr.DistrictName END),
		bl.DistrictId = (CASE blr.LocationType WHEN 2 THEN blr.Id ELSE blr.DistrictId END),
		bl.DistrictToponym = (CASE blr.LocationType WHEN 2 THEN blr.Toponym ELSE blr.DistrictToponym END),
		bl.CityName = (CASE blr.LocationType WHEN 3 THEN blr.Name ELSE blr.CityName END),
		bl.CityId = (CASE blr.LocationType WHEN 3 THEN blr.Id ELSE blr.CityId END),
		bl.CityToponym = (CASE blr.LocationType WHEN 3 THEN blr.Toponym ELSE blr.CityToponym END),
		bl.TownName = (CASE blr.LocationType WHEN 4 THEN blr.Name ELSE blr.TownName END),
		bl.TownId = (CASE blr.LocationType WHEN 4 THEN blr.Id ELSE blr.TownId END),
		bl.TownToponym = (CASE blr.LocationType WHEN 4 THEN blr.Toponym ELSE blr.TownToponym END),
		bl.ParentId = blr.Id
	FROM Geopoints.BufferStreetLocation bl
	JOIN Geopoints.BufferCityLocation blr ON blr.KladrCode = bl.ParentCode;
	INSERT INTO [dbo].[EtlMessages] ([EtlPackageId], [EtlSessionId], [LogDateTime], [LogUtcDateTime], [MessageType], [Text])
    VALUES (@EtlPackageId, @EtlSessionId, GETDATE(), GETUTCDATE(),8, 'END [Geopoints].[BufferStreetLocation]. UPDATE REGION, DISTRICT, CITY, TOWN');

END;

GO

IF EXISTS (SELECT * FROM sys.objects WHERE type_desc = 'SQL_STORED_PROCEDURE' AND name = 'SaveDataToLocality')
BEGIN
	DROP PROCEDURE [Geopoints].[SaveDataToLocality]
END;

GO

CREATE PROCEDURE [Geopoints].[SaveDataToLocality]
@EtlPackageId uniqueidentifier,
@EtlSessionId uniqueidentifier,
@Date nvarchar(20)
AS
BEGIN
	
	INSERT INTO [dbo].[EtlMessages] ([EtlPackageId], [EtlSessionId], [LogDateTime], [LogUtcDateTime], [MessageType], [Text])
    VALUES (@EtlPackageId, @EtlSessionId, GETDATE(), GETUTCDATE(),8, 'BEGIN CREATE TABLE [Geopoints].[Location' + @Date + ']');
	DECLARE @CREATELOCATION nvarchar(MAX);
	SET @CREATELOCATION = N'CREATE TABLE [Geopoints].[Location' + @Date + '](
	[Id] [uniqueidentifier] NOT NULL,
	[ParentId] [uniqueidentifier] NULL,
	[LocationType] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Toponym] [nvarchar](10) NULL,
	[KladrCode] [nvarchar](20) NULL,
	[RegionName] [nvarchar](255) NULL,
	[RegionId] [uniqueidentifier] NULL,
	[RegionToponym] [nvarchar](10) NULL,
	[DistrictName] [nvarchar](255) NULL,
	[DistrictId] [uniqueidentifier] NULL,
	[DistrictToponym] [nvarchar](10) NULL,
	[CityName] [nvarchar](255) NULL,
	[CityId] [uniqueidentifier] NULL,
	[CityToponym] [nvarchar](10) NULL,
	[TownName] [nvarchar](255) NULL,
	[TownId] [uniqueidentifier] NULL,
	[TownToponym] [nvarchar](10) NULL,
	[EtlPackageId] [uniqueidentifier] NULL,
	[EtlSessionId] [uniqueidentifier] NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[CreatedUtcDateTime] [datetime] NOT NULL,
	[ModifiedDateTime] [datetime] NOT NULL,
	[ModifiedUtcDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Location' + @Date +'] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]'
	EXEC sp_executesql @CREATELOCATION;
	INSERT INTO [dbo].[EtlMessages] ([EtlPackageId], [EtlSessionId], [LogDateTime], [LogUtcDateTime], [MessageType], [Text])
    VALUES (@EtlPackageId, @EtlSessionId, GETDATE(), GETUTCDATE(),8, 'END CREATE TABLE [Geopoints].[Location' + @Date + ']');
	
	DECLARE @ModifiedDateTime datetime;
	DECLARE @ModifiedUtcDateTime datetime;

	SET @ModifiedDateTime = GETDATE()
	SET @ModifiedUtcDateTime = GETUTCDATE()

	INSERT INTO [dbo].[EtlMessages] ([EtlPackageId], [EtlSessionId], [LogDateTime], [LogUtcDateTime], [MessageType], [Text])
    VALUES (@EtlPackageId, @EtlSessionId, GETDATE(), GETUTCDATE(),8, 'BEGIN TRANSFER. [Geopoints].[BufferDestinationLocation]->[Geopoints].[Location' + @Date + ']');
	DECLARE @BufferDestinationLocation2Location nvarchar(1500);
	DECLARE @BufferDestinationLocation2LocationParm NVARCHAR(500);
	SET @BufferDestinationLocation2Location = N'INSERT INTO [Geopoints].[Location' + @Date + ']
			   ([Id], [ParentId], [LocationType]
			   ,[Name], [Toponym], [KladrCode]
			   ,[RegionName], [RegionId], [RegionToponym]
			   ,[DistrictName], [DistrictId], [DistrictToponym]
			   ,[CityName], [CityId], [CityToponym]
			   ,[TownName], [TownId], [TownToponym]
			   ,[EtlPackageId],[EtlSessionId]
			   ,[CreatedDateTime], [CreatedUtcDateTime]
			   ,[ModifiedDateTime], [ModifiedUtcDateTime])
	SELECT [Id], [ParentId], [LocationType]
			   ,[Name], [Toponym], [KladrCode]
			   ,[RegionName], [RegionId], [RegionToponym]
			   ,[DistrictName], [DistrictId], [DistrictToponym]
			   ,[CityName], [CityId], [CityToponym]
			   ,[TownName], [TownId], [TownToponym]
			   ,[EtlPackageId],[EtlSessionId]
			   ,[CreatedDateTime], [CreatedUtcDateTime]
			   ,[ModifiedDateTime], [ModifiedUtcDateTime]
	FROM [Geopoints].[BufferDestinationLocation]
	WHERE [EtlPackageId] <> @EtlPackageId';
	SET @BufferDestinationLocation2LocationParm = N'@EtlPackageId uniqueidentifier';
	
	EXEC sp_executesql @BufferDestinationLocation2Location, @BufferDestinationLocation2LocationParm, @EtlPackageId = @EtlPackageId;
	INSERT INTO [dbo].[EtlMessages] ([EtlPackageId], [EtlSessionId], [LogDateTime], [LogUtcDateTime], [MessageType], [Text])
    VALUES (@EtlPackageId, @EtlSessionId, GETDATE(), GETUTCDATE(),8, 'END TRANSFER. [Geopoints].[BufferDestinationLocation]->[Geopoints].[Location' + @Date + ']');

	INSERT INTO [dbo].[EtlMessages] ([EtlPackageId], [EtlSessionId], [LogDateTime], [LogUtcDateTime], [MessageType], [Text])
    VALUES (@EtlPackageId, @EtlSessionId, GETDATE(), GETUTCDATE(),8, 'BEGIN TRANSFER. [Geopoints].[BufferCityLocation]->[Geopoints].[Location' + @Date + ']');
	DECLARE @BufferCityLocation2Location nvarchar(1500);
	DECLARE @BufferCityLocation2LocationParm NVARCHAR(500);
	SET @BufferCityLocation2Location = N'INSERT INTO [Geopoints].[Location' + @Date + ']
			   ([Id], [ParentId], [LocationType]
			   ,[Name], [Toponym], [KladrCode]
			   ,[RegionName], [RegionId], [RegionToponym]
			   ,[DistrictName], [DistrictId], [DistrictToponym]
			   ,[CityName], [CityId], [CityToponym]
			   ,[TownName], [TownId], [TownToponym]
			   ,[EtlPackageId],[EtlSessionId]
			   ,[CreatedDateTime], [CreatedUtcDateTime]
			   ,[ModifiedDateTime], [ModifiedUtcDateTime])
	SELECT [Id], [ParentId], [LocationType]
			   ,[Name], [Toponym], [KladrCode]
			   ,[RegionName], [RegionId], [RegionToponym]
			   ,[DistrictName], [DistrictId], [DistrictToponym]
			   ,[CityName], [CityId], [CityToponym]
			   ,[TownName], [TownId], [TownToponym]
			   ,@EtlPackageId as [EtlPackageId], @EtlSessionId as [EtlSessionId]
			   ,[CreatedDateTime], [CreatedUtcDateTime]
			   ,@ModifiedDateTime as [ModifiedDateTime], @ModifiedUtcDateTime as [ModifiedUtcDateTime]
	FROM [Geopoints].[BufferCityLocation]';
	SET @BufferCityLocation2LocationParm = N'@EtlPackageId uniqueidentifier, @EtlSessionId uniqueidentifier, @ModifiedDateTime datetime, @ModifiedUtcDateTime datetime';
	
	EXEC sp_executesql @BufferCityLocation2Location, @BufferCityLocation2LocationParm, @EtlPackageId = @EtlPackageId,
	@EtlSessionId = @EtlSessionId, @ModifiedDateTime = @ModifiedDateTime, @ModifiedUtcDateTime = @ModifiedUtcDateTime;
	INSERT INTO [dbo].[EtlMessages] ([EtlPackageId], [EtlSessionId], [LogDateTime], [LogUtcDateTime], [MessageType], [Text])
    VALUES (@EtlPackageId, @EtlSessionId, GETDATE(), GETUTCDATE(),8, 'END TRANSFER. [Geopoints].[BufferCityLocation]->[Geopoints].[Location' + @Date + ']');

	Print 'Перенос данных BufferStreetLocation -> Location'
	INSERT INTO [dbo].[EtlMessages] ([EtlPackageId], [EtlSessionId], [LogDateTime], [LogUtcDateTime], [MessageType], [Text])
    VALUES (@EtlPackageId, @EtlSessionId, GETDATE(), GETUTCDATE(),8, 'BEGIN TRANSFER. [Geopoints].[BufferStreetLocation]->[Geopoints].[Location' + @Date + ']');
	DECLARE @BufferStreetLocation2Location nvarchar(1500);
	DECLARE @BufferStreetLocation2LocationParm NVARCHAR(500);
	
	SET @BufferStreetLocation2Location = N'INSERT INTO [Geopoints].[Location' + @Date + ']
			   ([Id], [ParentId], [LocationType]
			   ,[Name], [Toponym], [KladrCode]
			   ,[RegionName], [RegionId], [RegionToponym]
			   ,[DistrictName], [DistrictId], [DistrictToponym]
			   ,[CityName], [CityId], [CityToponym]
			   ,[TownName], [TownId], [TownToponym]
			   ,[EtlPackageId],[EtlSessionId]
			   ,[CreatedDateTime], [CreatedUtcDateTime]
			   ,[ModifiedDateTime], [ModifiedUtcDateTime])
	SELECT [Id], [ParentId], [LocationType]
	   ,[Name], [Toponym], [KladrCode]
	   ,[RegionName], [RegionId], [RegionToponym]
	   ,[DistrictName], [DistrictId], [DistrictToponym]
	   ,[CityName], [CityId], [CityToponym]
	   ,[TownName], [TownId], [TownToponym]
	   ,@EtlPackageId as [EtlPackageId], @EtlSessionId as [EtlSessionId]
	   ,[CreatedDateTime], [CreatedUtcDateTime]
	   ,@ModifiedDateTime as [ModifiedDateTime], @ModifiedUtcDateTime as [ModifiedUtcDateTime]
	FROM [Geopoints].[BufferStreetLocation]';
	SET @BufferStreetLocation2LocationParm = N'@EtlPackageId uniqueidentifier, @EtlSessionId uniqueidentifier, @ModifiedDateTime datetime, @ModifiedUtcDateTime datetime';
	
	EXEC sp_executesql @BufferStreetLocation2Location, @BufferStreetLocation2LocationParm, @EtlPackageId = @EtlPackageId,
	@EtlSessionId = @EtlSessionId, @ModifiedDateTime = @ModifiedDateTime, @ModifiedUtcDateTime = @ModifiedUtcDateTime
	INSERT INTO [dbo].[EtlMessages] ([EtlPackageId], [EtlSessionId], [LogDateTime], [LogUtcDateTime], [MessageType], [Text])
    VALUES (@EtlPackageId, @EtlSessionId, GETDATE(), GETUTCDATE(),8, 'END TRANSFER. [Geopoints].[BufferStreetLocation]->[Geopoints].[Location' + @Date + ']');
END;

GO

IF EXISTS (SELECT * FROM sys.objects WHERE type_desc = 'SQL_STORED_PROCEDURE' AND name = 'RemapKladrView')
BEGIN
	DROP PROCEDURE [Geopoints].[RemapKladrView]
END;

GO

CREATE PROCEDURE [Geopoints].[RemapKladrView]
@Date nvarchar(20)
AS
BEGIN
	DECLARE @Cmd nvarchar(200);
	SET @Cmd = N'ALTER VIEW [Geopoints].[V_Location] AS SELECT * FROM [Geopoints].[Location' + @Date + N']';
	EXEC sp_executesql @Cmd;
END;
