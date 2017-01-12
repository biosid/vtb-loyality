IF NOT EXISTS(	SELECT * FROM sys.columns 
			WHERE Name = N'IsDelete' AND Object_ID = Object_ID(N'[dbo].[ClientForBankRegistration]'))    
BEGIN
	ALTER TABLE [dbo].[ClientForBankRegistration]
	ADD [IsDelete] bit NOT NULL DEFAULT (0)
END
GO