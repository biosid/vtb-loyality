IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[prod].[BUFFER_DeliveryRates_Ozon]') AND type in (N'U'))
	DROP TABLE [prod].[BUFFER_DeliveryRates_Ozon]
GO

CREATE TABLE [prod].[BUFFER_DeliveryRates_Ozon](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EtlSessionId] [nvarchar](64) NOT NULL,
	[CityId] [nvarchar](64) NOT NULL,
	[Region] [nvarchar](150) NOT NULL,
	[City] [nvarchar](150) NOT NULL,
	[MinWeightGram] [int] NOT NULL,
	[MaxWeightGram] [int] NOT NULL,
	[PriceRur] [decimal](38, 20) NOT NULL,
	[ProductType] [nvarchar](150) NOT NULL,
	[Status] [int] NOT NULL DEFAULT ((0))
)
GO


