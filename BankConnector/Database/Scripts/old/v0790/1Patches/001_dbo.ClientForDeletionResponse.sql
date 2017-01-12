IF NOT EXISTS(	SELECT * FROM sys.columns 
			WHERE Name = N'Status' AND Object_ID = Object_ID(N'[dbo].[ClientForDeletionResponse]'))    
BEGIN
	ALTER TABLE [dbo].[ClientForDeletionResponse]
	ADD [Status] int NOT NULL DEFAULT (0)
END
GO