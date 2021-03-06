﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace RapidSoft.VTB24.BankConnector.DataModels
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class BankConnectorDBContext : DbContext
    {
        public BankConnectorDBContext()
            : base("name=BankConnectorDBContext")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<ClientCardRegStatus> ClientCardRegStatuses { get; set; }
        public DbSet<OrderPaymentResponse> OrderPaymentResponses { get; set; }
        public DbSet<PromoAction> PromoActions { get; set; }
        public DbSet<PromoActionResponse> PromoActionResponses { get; set; }
        public DbSet<StepsBuffer> StepsBuffers { get; set; }
        public DbSet<ClientPersonalMessage> ClientPersonalMessages { get; set; }
        public DbSet<ClientPersonalMessageResponse> ClientPersonalMessageResponses { get; set; }
        public DbSet<Accrual> Accruals { get; set; }
        public DbSet<ClientAudienceRelation> ClientAudienceRelations { get; set; }
        public DbSet<ClientForBankRegistration> ClientForBankRegistrations { get; set; }
        public DbSet<ClientForBankRegistrationResponse> ClientForBankRegistrationResponses { get; set; }
        public DbSet<ClientForRegistration> ClientForRegistrations { get; set; }
        public DbSet<ClientForDeletion> ClientForDeletions { get; set; }
        public DbSet<ClientForDeletionResponse> ClientForDeletionResponses { get; set; }
        public DbSet<ClientForRegistrationResponse> ClientForRegistrationResponses { get; set; }
        public DbSet<ClientUpdate> ClientUpdates { get; set; }
        public DbSet<ClientForActivation> ClientForActivations { get; set; }
        public DbSet<OrderForPayment> OrderForPayments { get; set; }
        public DbSet<OrderPaymentResponse2> OrderPaymentResponse2 { get; set; }
        public DbSet<ProfileCustomField> ProfileCustomFields { get; set; }
        public DbSet<ProfileCustomFieldsValue> ProfileCustomFieldsValues { get; set; }
        public DbSet<ClientLoginBankUpdate> ClientLoginBankUpdates { get; set; }
        public DbSet<ClientLoginBankUpdatesResponse> ClientLoginBankUpdatesResponses { get; set; }
        public DbSet<LoyaltyClientUpdate> LoyaltyClientUpdates { get; set; }
        public DbSet<ClientForBankPwdReset> ClientForBankPwdResets { get; set; }
        public DbSet<ClientForBankPwdResetResponse> ClientForBankPwdResetResponses { get; set; }
        public DbSet<OrderItemsForPayment> OrderItemsForPayments { get; set; }
        public DbSet<UnitellerPayment> UnitellerPayments { get; set; }
        public DbSet<OrderAttempt> OrderAttempts { get; set; }
        public DbSet<BankOffer> BankOffers { get; set; }
        public DbSet<RegisterBankOffer> RegisterBankOffers { get; set; }
        public DbSet<RegisterBankOffersResponse> RegisterBankOffersResponses { get; set; }
        public DbSet<BankSms> BankSms { get; set; }
    }
}
