DELETE FROM [etl].[EtlVariables] WHERE [EtlPackageId] = N'1560ecaf-7420-4c34-8eea-d6caee64acbc';
DELETE FROM [etl].[EtlMessages] WHERE [EtlPackageId] = N'1560ecaf-7420-4c34-8eea-d6caee64acbc';
DELETE FROM [etl].[EtlSessions] WHERE [EtlPackageId] = N'1560ecaf-7420-4c34-8eea-d6caee64acbc';
DELETE FROM [etl].[EtlPackages] WHERE [Id]=N'1560ecaf-7420-4c34-8eea-d6caee64acbc';
GO

/* EtlPackages */
INSERT [etl].[EtlPackages] ([Id], [Name], [Text], [RunIntervalSeconds], [Enabled]) VALUES (N'1560ecaf-7420-4c34-8eea-d6caee64acbc', N'ReceiveRegistrationClients'
,N'<?xml version="1.0" encoding="utf-16"?>
<EtlPackage xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <Id>1560ecaf-7420-4c34-8eea-d6caee64acbc</Id>
  <Name>ReceiveRegistrationClients</Name>
  <RunIntervalSeconds>0</RunIntervalSeconds>
  <Enabled>true</Enabled>
  <Variables>
    <Variable>
      <Name>Temp</Name>
      <Modifier>Input</Modifier>
      <DefaultValue>C:\Temp</DefaultValue>
      <Binding>None</Binding>
      <IsSecure>false</IsSecure>
    </Variable>
    <Variable>
      <Name>DB</Name>
      <Modifier>Input</Modifier>
      <DefaultValue>data source=.;initial catalog=RapidSoft.VTB24.BankConnector;integrated security=True;</DefaultValue>
      <Binding>None</Binding>
      <IsSecure>false</IsSecure>
    </Variable>
    <Variable>
      <Name>SessionId</Name>
      <Modifier>Bound</Modifier>
      <Binding>EtlSessionId</Binding>
      <IsSecure>false</IsSecure>
    </Variable>
	<Variable>
      <Name>LoyaltyImapHost</Name>
      <Modifier>Input</Modifier>
      <DefaultValue>notset</DefaultValue>
	  <Binding>None</Binding>
      <IsSecure>false</IsSecure>
    </Variable>
	<Variable>
      <Name>LoyaltyImapPort</Name>
      <Modifier>Input</Modifier>
      <DefaultValue>notset</DefaultValue>
	  <Binding>None</Binding>
      <IsSecure>false</IsSecure>
    </Variable>
	<Variable>
      <Name>LoyaltyImapUseSSL</Name>
      <Modifier>Input</Modifier>
      <DefaultValue>notset</DefaultValue>
	  <Binding>None</Binding>
      <IsSecure>false</IsSecure>
    </Variable>
	<Variable>
      <Name>LoyaltyImapUserName</Name>
      <Modifier>Input</Modifier>
      <DefaultValue>notset</DefaultValue>
	  <Binding>None</Binding>
      <IsSecure>false</IsSecure>
    </Variable>
	<Variable>
      <Name>LoyaltyImapPassword</Name>
      <Modifier>Input</Modifier>
      <DefaultValue>notset</DefaultValue>
	  <Binding>None</Binding>
      <IsSecure>false</IsSecure>
    </Variable>
  </Variables>
  <Steps>
    <EmailReceiveImap>
      <Name>�������� �������� �����</Name>
      <TimeoutMilliseconds xsi:nil="true" />
      <EmailServer>
        <Host>$(LoyaltyImapHost)</Host>
        <Port>$(LoyaltyImapPort)</Port>
        <UseSSL>$(LoyaltyImapUseSSL)</UseSSL>
        <UserName>$(LoyaltyImapUserName)</UserName>
        <Password>$(LoyaltyImapPassword)</Password>
      </EmailServer>
      <EmailDbStorage>
        <ConnectionString>$(DB)</ConnectionString>
        <SchemaName>etl</SchemaName>
      </EmailDbStorage>
      <Message>
        <Filters>
          <ReceiveFilter>
            <SubjectStartsWith>Register_Response_</SubjectStartsWith>
          </ReceiveFilter>
        </Filters>
        <AttachmentRegExp>^VTB_[1-2][0-9]{3}[0-1][0-9][0-3][0-9]_[0-9]+.regPL.response$</AttachmentRegExp>
      </Message>
      <Destination>
        <Name>Temp Folder</Name>
        <FilePath>$(Temp)\VTB_$(SessionId)</FilePath>
        <CodePage>1251</CodePage>
      </Destination>
    </EmailReceiveImap>
    <Decrypt>
      <Name>Decrypt</Name>
      <TimeoutMilliseconds xsi:nil="true" />
      <WorkingDirectory>$(Temp)\VTB_$(SessionId)</WorkingDirectory>
    </Decrypt>
    <ImportCsvFileBatch>
      <Name>ImportCsvFileBatch</Name>
      <TimeoutMilliseconds xsi:nil="true" />
      <Source>
        <Name>����</Name>
        <FilePath>$(Temp)\VTB_$(SessionId)</FilePath>
        <CodePage>1251</CodePage>
        <HasHeaders>true</HasHeaders>
        <FieldDelimiter>;</FieldDelimiter>
      </Source>
      <Destination>
        <Name>���� ������</Name>
        <ConnectionString>$(DB)</ConnectionString>
        <ProviderName>System.Data.SqlClient</ProviderName>
        <TableName>dbo.ClientForRegistrationResponse</TableName>
      </Destination>
      <BatchSize>0</BatchSize>
      <Mappings>
        <Mapping>
          <SourceFieldName>ClientId</SourceFieldName>
          <DestinationFieldName>ClientId</DestinationFieldName>
        </Mapping>
        <Mapping>
          <DestinationFieldName>SessionId</DestinationFieldName>
          <DefaultValue>$(SessionId)</DefaultValue>
        </Mapping>
        <Mapping>
          <SourceFieldName>Status</SourceFieldName>
          <DestinationFieldName>Status</DestinationFieldName>
        </Mapping>
        <Mapping>
          <SourceFieldName>Segment</SourceFieldName>
          <DestinationFieldName>Segment</DestinationFieldName>
        </Mapping>
      </Mappings>
      <DataLossBehavior>Fail</DataLossBehavior>
    </ImportCsvFileBatch>
    <InvokeMethod>
      <Name>����� ������������</Name>
      <TimeoutMilliseconds xsi:nil="true" />
      <Source>
        <Name>assembly</Name>
        <AssemblyName>RapidSoft.VTB24.BankConnector</AssemblyName>
        <TypeName>RapidSoft.VTB24.BankConnector.EtlInvokeHelper</TypeName>
        <MethodName>RegisterClients</MethodName>
        <Parameters />
      </Source>
    </InvokeMethod>
    <EmailDeleteImap>
      <Name>DeleteMailImap</Name>
      <TimeoutMilliseconds xsi:nil="true" />
      <EmailServer>
        <Host>$(LoyaltyImapHost)</Host>
        <Port>$(LoyaltyImapPort)</Port>
        <UseSSL>$(LoyaltyImapUseSSL)</UseSSL>
        <UserName>$(LoyaltyImapUserName)</UserName>
        <Password>$(LoyaltyImapPassword)</Password>
      </EmailServer>
      <EmailDbStorage>
        <ConnectionString>$(DB)</ConnectionString>
        <SchemaName>etl</SchemaName>
      </EmailDbStorage>
    </EmailDeleteImap>
  </Steps>
</EtlPackage>', 0, 1)