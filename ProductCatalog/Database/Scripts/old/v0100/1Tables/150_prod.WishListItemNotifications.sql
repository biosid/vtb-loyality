CREATE TABLE [prod].[WishListItemNotifications](
	[UserId] [nvarchar](64) NOT NULL,
	[ProductId] [nvarchar](256) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ProductsQuantity] int not NULL,
	[NotificationDate] [datetime] NULL,
 CONSTRAINT [PK_WishListItemNotifications] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO