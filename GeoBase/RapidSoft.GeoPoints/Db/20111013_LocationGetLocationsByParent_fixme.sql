ALTER PROCEDURE [Geopoints].[LocationGetLocationsByParent]
(
	@parentID uniqueidentifier,    
	@locationType int,
	@nameSearchPattern NVARCHAR(1024),
    @locale VARCHAR(2),    
    @skip INT = NULL,
    @top INT = NULL
)
AS
BEGIN
	DECLARE @default_top INT SET @default_top = 1000;

	SET @skip = ISNULL(@skip, 0);
	SET @top = ISNULL(@top, @default_top);

	SET @nameSearchPattern = @nameSearchPattern + '%'

	DECLARE @rootLocationId uniqueIdentifier;
	DECLARE @rootType INT;

	SELECT @rootLocationId = Id, @rootType = LocationType FROM  Geopoints.V_Location 
	WHERE Id = @parentID;

	IF(@rootType = 0)
		BEGIN
			WITH LocationTreeWithData AS 
			(
				SELECT * FROM Geopoints.V_Location
				WHERE (@locationType IS NULL OR geopoints.[V_Location].LocationType = @locationType)
				AND (@nameSearchPattern IS NULL OR geopoints.[V_Location].Name LIKE @nameSearchPattern)					
			)
			SELECT TOP (@top) * FROM LocationTreeWithData t WHERE t.Id not in (SELECT TOP (@skip) t1.id FROM LocationTreeWithData AS t1 ORDER BY Name) ORDER BY Name
		END
	ELSE IF(@rootType = 1)
		BEGIN
			WITH LocationTreeWithData AS 
			(
				SELECT * FROM Geopoints.V_Location
				WHERE (@locationType IS NULL OR geopoints.[V_Location].LocationType = @locationType)
				AND (@nameSearchPattern IS NULL OR geopoints.[V_Location].Name LIKE @nameSearchPattern)					
				AND RegionID = @rootLocationId
			)
			SELECT TOP (@top) * FROM LocationTreeWithData t WHERE t.Id not in (SELECT TOP (@skip) t1.id FROM LocationTreeWithData AS t1 ORDER BY Name) ORDER BY Name
		END		
	ELSE IF(@rootType = 3)
		BEGIN
			WITH LocationTreeWithData AS 
			(
				SELECT * FROM Geopoints.V_Location
				WHERE (@locationType IS NULL OR geopoints.[V_Location].LocationType = @locationType)
				AND (@nameSearchPattern IS NULL OR geopoints.[V_Location].Name LIKE @nameSearchPattern)					
				AND CityID = @rootLocationId
			)
			SELECT TOP (@top) * FROM LocationTreeWithData t WHERE t.Id not in (SELECT TOP (@skip) t1.id FROM LocationTreeWithData AS t1 ORDER BY Name) ORDER BY Name
		END
	ELSE IF(@rootType = 4)
		BEGIN
			WITH LocationTreeWithData AS 
			(
				SELECT * FROM Geopoints.V_Location
				WHERE (@locationType IS NULL OR geopoints.[V_Location].LocationType = @locationType)
				AND (@nameSearchPattern IS NULL OR geopoints.[V_Location].Name LIKE @nameSearchPattern)					
				AND TownID = @rootLocationId					
			)
			SELECT TOP (@top) * FROM LocationTreeWithData t WHERE t.Id not in (SELECT TOP (@skip) t1.id FROM LocationTreeWithData AS t1 ORDER BY Name) ORDER BY Name
		END	
END
