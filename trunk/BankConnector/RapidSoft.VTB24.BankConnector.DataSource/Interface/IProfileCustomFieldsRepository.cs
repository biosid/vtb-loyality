﻿namespace RapidSoft.VTB24.BankConnector.DataSource.Interface
{
    using RapidSoft.VTB24.BankConnector.DataModels;

    public interface IProfileCustomFieldsRepository : IGenericRepository<ProfileCustomField>
    {
        ProfileCustomField[] GetAllFieldsInOrder();
    }
}