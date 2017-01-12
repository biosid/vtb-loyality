﻿namespace RapidSoft.Loaylty.PartnersConnector.Interfaces.Entities
{
    using System.Runtime.Serialization;

    [DataContract]
    public class DeliveryAddress
    {
        /// <summary>
        /// Почтовый индекс адреса доставки.
        /// </summary>
        [DataMember]
        public string PostCode
        {
            get;
            set;
        }

        /// <summary>
        /// Текстовое представление адреса.
        /// </summary>
        [DataMember]
        public string AddressText { get; set; }

        /// <summary>
        /// Кладр код региона доставки.
        /// </summary>
        [DataMember]
        public string RegionKladrCode
        {
            get;
            set;
        }

        /// <summary>
        /// Наименование региона доставки в свободной форме.
        /// </summary>
        [DataMember]
        public string RegionTitle
        {
            get;
            set;
        }

        /// <summary>
        /// Кладр код района доставки.
        /// </summary>
        [DataMember]
        public string DistrictKladrCode
        {
            get;
            set;
        }

        /// <summary>
        /// Наименование района доставки в свободной форме.
        /// </summary>
        [DataMember]
        public string DistrictTitle
        {
            get;
            set;
        }

        /// <summary>
        /// Кладр код города доставки.
        /// </summary>
        [DataMember]
        public string CityKladrCode
        {
            get;
            set;
        }

        /// <summary>
        /// Наименование города доставки в свободной форме.
        /// </summary>
        [DataMember]
        public string CityTitle
        {
            get;
            set;
        }

        /// <summary>
        /// Кладр код населённого пункта доставки.
        /// </summary>
        [DataMember]
        public string TownKladrCode
        {
            get;
            set;
        }

        /// <summary>
        /// Наименование населённого пункта доставки в свободной форме.
        /// </summary>
        [DataMember]
        public string TownTitle
        {
            get;
            set;
        }

        /// <summary>
        /// Наименование улицы доставки в свободной форме.
        /// </summary>
        [DataMember]
        public string StreetTitle
        {
            get;
            set;
        }

        /// <summary>
        /// Дом
        /// </summary>
        [DataMember]
        public string House
        {
            get;
            set;
        }

        /// <summary>
        /// Квартира
        /// </summary>
        [DataMember]
        public string Flat
        {
            get;
            set;
        }
    }
}