
DECLARE @CommonMetadata [xml] = N'
<EntitiesMetadata xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <Entities>
    <EntityName>p</EntityName>
    <DisplayName>Вознаграждение</DisplayName>
    <Attributes>
      <Name>PartnerId</Name>
      <DisplayName>Партнёр</DisplayName>
      <Id>292509fd-89f1-4030-b138-dd6efedc4c08</Id>
      <Type>Number</Type>
    </Attributes>
    <Attributes>
      <Name>CategoryId</Name>
      <DisplayName>Категория</DisplayName>
      <Id>a6065fc9-b789-497f-a90e-4a26c63014f4</Id>
      <Type>Number</Type>
    </Attributes>
    <Attributes>
      <Name>ProductId</Name>
      <DisplayName>Товар</DisplayName>
      <Id>eab42a44-de35-4be5-8734-f67c2fbe17f3</Id>
      <Type>Text</Type>
    </Attributes>
  </Entities>
  <Entities>
    <EntityName>ClientProfile</EntityName>
    <DisplayName>Пользователь</DisplayName>
    <Attributes>
      <Name>KLADR</Name>
      <DisplayName>Город присутствия</DisplayName>
      <Id>1ac650b4-4744-4bda-a508-f84b387e7452</Id>
      <Type>Text</Type>
    </Attributes>
    <Attributes>
      <Name>Audiences</Name>
      <DisplayName>Целевая аудитория</DisplayName>
      <Id>4c7fe4a7-eccc-420e-8bd7-432b25fdecc3</Id>
      <Type>Text</Type>
    </Attributes>
  </Entities>
</EntitiesMetadata>'

/****** Object:  Table [promo].[RuleDomains]    Script Date: 05/21/2013 13:20:21 ******/
SET IDENTITY_INSERT [promo].[RuleDomains] ON
INSERT [promo].[RuleDomains] 
    ([Id], [Name], [Description], [Metadata], [LimitType], [LimitFactor], 
     [StopLimitType], [StopLimitFactor],
     [InsertedDate], [UpdatedDate], [UserId]) 
VALUES 
    (
        1, 
        N'Расчёт цены вознаграждения', 
        N'-', 
        @CommonMetadata, 
        1, 
        CAST(10.00000 AS Decimal(18, 5)), 
        1,
        CAST(10.00000 AS Decimal(18, 5)), 
        GETDATE(), 
        NULL, 
        N'FSY'
    )

INSERT [promo].[RuleDomains] 
    ([Id], [Name], [Description], [Metadata], [LimitType], [LimitFactor], 
     [StopLimitType], [StopLimitFactor],
     [InsertedDate], [UpdatedDate], [UserId]) 
VALUES 
    (
        2, 
        N'Расчёт цены доставки', 
        N'-', 
        @CommonMetadata, 
        1, 
        CAST(10.00000 AS Decimal(18, 5)), 
        1,
        CAST(10.00000 AS Decimal(18, 5)), 
        GETDATE(), 
        NULL, 
        N'FSY'
    )

SET IDENTITY_INSERT [promo].[RuleDomains] OFF
/****** Object:  Table [promo].[Rules]    Script Date: 05/21/2013 13:20:21 ******/
SET IDENTITY_INSERT [promo].[Rules] ON

print 'Правила домена Расчёт цены вознаграждения'
INSERT [promo].[Rules] 
    ([Id], 
     [Name], 
     [RuleDomainId], 
     [Type], 
     [DateTimeFrom], 
     [DateTimeTo], 
     [Status], 
     [IsExclusive], 
     [IsNotExcludedBy], 
     [Priority], 
     [Predicate], 
     [Factor], 
     [ConditionalFactors], 
     [InsertedDate], 
     [UpdatedDate], 
     [UserId]) 
VALUES (
    3, 
    N'Правило 1', 
    1, 
    0, 
    NULL, 
    NULL, 
    0, 
    0, 
    1, 
    0, 
    N'<filter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><equation operator="eq"><value type="attr"><attr object="p" name="PartnerId" type="numeric" /></value><value type="numeric">1</value></equation></filter>', 
    CAST(10.00000 AS Decimal(18, 5)), 
    NULL, 
    GETDATE(), 
    NULL, 
    N'FSY')

INSERT [promo].[Rules] 
    ([Id], [Name], [RuleDomainId], [Type], [DateTimeFrom], [DateTimeTo], [Status], [IsExclusive], [IsNotExcludedBy], [Priority], [Predicate], [Factor], [ConditionalFactors], [InsertedDate], [UpdatedDate], [UserId]) 
VALUES 
    (4, N'Правило 2', 1, 2, NULL, NULL, 0, 0, 0, 0, 
     N'<filter xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><equation operator="eq"><value type="attr"><attr object="p" name="PartnerId" type="numeric" /></value><value type="numeric">1</value></equation></filter>', 
     CAST(1.00000 AS Decimal(18, 5)), 
     N'<ArrayOfConditionalFactor xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><ConditionalFactor><Priority>3</Priority><Predicate><union type="or"><equation operator="eq"><value type="attr"><attr object="p" name="Vendor" type="string" /></value><value type="string">Новый Диск / Scholastic</value></equation><equation operator="eq"><value type="attr"><attr object="p" name="Vendor" type="string" /></value><value type="string">1С</value></equation><equation operator="eq"><value type="attr"><attr object="p" name="Vendor" type="string" /></value><value type="string">МедиаХауз</value></equation></union></Predicate><Factor>0.1</Factor></ConditionalFactor></ArrayOfConditionalFactor>', 
     GETDATE(), 
     NULL, 
     N'FSY')

print 'Правила домена Расчёт цены доставки'

SET IDENTITY_INSERT [promo].[Rules] OFF

---
print 'Домен Расчёт цены вознаграждения онлайн партнёра'

DECLARE @CommonMetadataForOnline [xml] = N'
<EntitiesMetadata xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <Entities>
    <EntityName>ClientProfile</EntityName>
    <DisplayName>Пользователь</DisplayName>
    <Attributes>
      <Name>KLADR</Name>
      <DisplayName>Город присутствия</DisplayName>
      <Id>1ac650b4-4744-4bda-a508-f84b387e7452</Id>
      <Type>Text</Type>
    </Attributes>
    <Attributes>
      <Name>Audiences</Name>
      <DisplayName>Целевая аудитория</DisplayName>
      <Id>4c7fe4a7-eccc-420e-8bd7-432b25fdecc3</Id>
      <Type>Text</Type>
    </Attributes>
  </Entities>
</EntitiesMetadata>'

SET IDENTITY_INSERT [promo].[RuleDomains] ON
INSERT [promo].[RuleDomains] 
    ([Id], [Name], [Description], [Metadata], [LimitType], [LimitFactor], 
     [StopLimitType], [StopLimitFactor],
     [InsertedDate], [UpdatedDate], [UserId]) 
VALUES 
    (
        3, 
        N'Расчёт цены вознаграждения онлайн партнёра', 
        N'-', 
        @CommonMetadataForOnline, 
        1, 
        CAST(10.00000 AS Decimal(18, 5)), 
        1,
        CAST(10.00000 AS Decimal(18, 5)), 
        GETDATE(), 
        NULL, 
        N'FSY'
    )

SET IDENTITY_INSERT [promo].[RuleDomains] OFF