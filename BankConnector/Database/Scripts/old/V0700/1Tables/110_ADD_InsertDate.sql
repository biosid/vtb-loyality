DECLARE @script nvarchar(max);
DECLARE @scriptSource nvarchar(max);
SET @scriptSource =
N'IF NOT EXISTS(	SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = N''InsertedDate'' AND TABLE_NAME = N''#tableName#'')    
  ALTER TABLE #tableName# ADD InsertedDate datetime2 NOT NULL DEFAULT GETDATE();
  
'
SET @script = REPLACE(@scriptSource, '#tableName#', 'Accruals'); print(@script); EXECUTE sp_executesql @script;
SET @script = REPLACE(@scriptSource, '#tableName#', 'PromoAction'); print(@script); EXECUTE sp_executesql @script;
SET @script = REPLACE(@scriptSource, '#tableName#', 'PromoActionResponse'); print(@script); EXECUTE sp_executesql @script;
SET @script = REPLACE(@scriptSource, '#tableName#', 'ClientForActivation'); print(@script); EXECUTE sp_executesql @script;
SET @script = REPLACE(@scriptSource, '#tableName#', 'ClientCardRegStatus'); print(@script); EXECUTE sp_executesql @script;
SET @script = REPLACE(@scriptSource, '#tableName#', 'ClientForBankRegistration'); print(@script); EXECUTE sp_executesql @script;
SET @script = REPLACE(@scriptSource, '#tableName#', 'OrderForPayment'); print(@script); EXECUTE sp_executesql @script;
SET @script = REPLACE(@scriptSource, '#tableName#', 'OrderPaymentResponse'); print(@script); EXECUTE sp_executesql @script;
SET @script = REPLACE(@scriptSource, '#tableName#', 'ClientForRegistrationResponse'); print(@script); EXECUTE sp_executesql @script;
SET @script = REPLACE(@scriptSource, '#tableName#', 'ClientForBankRegistrationResponse'); print(@script); EXECUTE sp_executesql @script;
SET @script = REPLACE(@scriptSource, '#tableName#', 'ClientPersonalMessageResponse'); print(@script); EXECUTE sp_executesql @script;
SET @script = REPLACE(@scriptSource, '#tableName#', 'ClientPersonalMessage'); print(@script); EXECUTE sp_executesql @script;
SET @script = REPLACE(@scriptSource, '#tableName#', 'ClientForDeletion'); print(@script); EXECUTE sp_executesql @script;
SET @script = REPLACE(@scriptSource, '#tableName#', 'ClientAudienceRelations'); print(@script); EXECUTE sp_executesql @script;
SET @script = REPLACE(@scriptSource, '#tableName#', 'ClientForRegistration'); print(@script); EXECUTE sp_executesql @script;
SET @script = REPLACE(@scriptSource, '#tableName#', 'ClientForDeletionResponse'); print(@script); EXECUTE sp_executesql @script;