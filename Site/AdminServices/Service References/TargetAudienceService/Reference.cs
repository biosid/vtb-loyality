﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.18444
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Vtb24.Arms.AdminServices.TargetAudienceService {
    using System.Runtime.Serialization;
    using System;
    
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="ResultBase", Namespace="http://schemas.datacontract.org/2004/07/RapidSoft.Loaylty.PromoAction.Api.OutputR" +
        "esults")]
    [System.SerializableAttribute()]
    [System.Runtime.Serialization.KnownTypeAttribute(typeof(Vtb24.Arms.AdminServices.TargetAudienceService.AssignClientAudienceResult))]
    [System.Runtime.Serialization.KnownTypeAttribute(typeof(Vtb24.Arms.AdminServices.TargetAudienceService.GetTargetAudiencesResult))]
    [System.Runtime.Serialization.KnownTypeAttribute(typeof(Vtb24.Arms.AdminServices.TargetAudienceService.GetClientTargetAudiencesResult))]
    public partial class ResultBase : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private int ResultCodeField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string ResultDescriptionField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private bool SuccessField;
        
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData {
            get {
                return this.extensionDataField;
            }
            set {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int ResultCode {
            get {
                return this.ResultCodeField;
            }
            set {
                if ((this.ResultCodeField.Equals(value) != true)) {
                    this.ResultCodeField = value;
                    this.RaisePropertyChanged("ResultCode");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string ResultDescription {
            get {
                return this.ResultDescriptionField;
            }
            set {
                if ((object.ReferenceEquals(this.ResultDescriptionField, value) != true)) {
                    this.ResultDescriptionField = value;
                    this.RaisePropertyChanged("ResultDescription");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public bool Success {
            get {
                return this.SuccessField;
            }
            set {
                if ((this.SuccessField.Equals(value) != true)) {
                    this.SuccessField = value;
                    this.RaisePropertyChanged("Success");
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="AssignClientAudienceResult", Namespace="http://schemas.datacontract.org/2004/07/RapidSoft.Loaylty.PromoAction.Api.OutputR" +
        "esults")]
    [System.SerializableAttribute()]
    public partial class AssignClientAudienceResult : Vtb24.Arms.AdminServices.TargetAudienceService.ResultBase {
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private Vtb24.Arms.AdminServices.TargetAudienceService.ClientTargetAudienceRelationResult[] ClientTargetAudienceRelationsField;
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public Vtb24.Arms.AdminServices.TargetAudienceService.ClientTargetAudienceRelationResult[] ClientTargetAudienceRelations {
            get {
                return this.ClientTargetAudienceRelationsField;
            }
            set {
                if ((object.ReferenceEquals(this.ClientTargetAudienceRelationsField, value) != true)) {
                    this.ClientTargetAudienceRelationsField = value;
                    this.RaisePropertyChanged("ClientTargetAudienceRelations");
                }
            }
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="GetTargetAudiencesResult", Namespace="http://schemas.datacontract.org/2004/07/RapidSoft.Loaylty.PromoAction.Api.OutputR" +
        "esults")]
    [System.SerializableAttribute()]
    public partial class GetTargetAudiencesResult : Vtb24.Arms.AdminServices.TargetAudienceService.ResultBase {
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private Vtb24.Arms.AdminServices.TargetAudienceService.TargetAudience[] TargetAudiencesField;
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public Vtb24.Arms.AdminServices.TargetAudienceService.TargetAudience[] TargetAudiences {
            get {
                return this.TargetAudiencesField;
            }
            set {
                if ((object.ReferenceEquals(this.TargetAudiencesField, value) != true)) {
                    this.TargetAudiencesField = value;
                    this.RaisePropertyChanged("TargetAudiences");
                }
            }
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="GetClientTargetAudiencesResult", Namespace="http://schemas.datacontract.org/2004/07/RapidSoft.Loaylty.PromoAction.Api.OutputR" +
        "esults")]
    [System.SerializableAttribute()]
    public partial class GetClientTargetAudiencesResult : Vtb24.Arms.AdminServices.TargetAudienceService.ResultBase {
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private Vtb24.Arms.AdminServices.TargetAudienceService.TargetAudience[] ClientTargetAudiencesField;
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public Vtb24.Arms.AdminServices.TargetAudienceService.TargetAudience[] ClientTargetAudiences {
            get {
                return this.ClientTargetAudiencesField;
            }
            set {
                if ((object.ReferenceEquals(this.ClientTargetAudiencesField, value) != true)) {
                    this.ClientTargetAudiencesField = value;
                    this.RaisePropertyChanged("ClientTargetAudiences");
                }
            }
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="TargetAudience", Namespace="http://schemas.datacontract.org/2004/07/RapidSoft.Loaylty.PromoAction.Api.DTO")]
    [System.SerializableAttribute()]
    public partial class TargetAudience : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string IdField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private bool IsSegmentField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string NameField;
        
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData {
            get {
                return this.extensionDataField;
            }
            set {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string Id {
            get {
                return this.IdField;
            }
            set {
                if ((object.ReferenceEquals(this.IdField, value) != true)) {
                    this.IdField = value;
                    this.RaisePropertyChanged("Id");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public bool IsSegment {
            get {
                return this.IsSegmentField;
            }
            set {
                if ((this.IsSegmentField.Equals(value) != true)) {
                    this.IsSegmentField = value;
                    this.RaisePropertyChanged("IsSegment");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string Name {
            get {
                return this.NameField;
            }
            set {
                if ((object.ReferenceEquals(this.NameField, value) != true)) {
                    this.NameField = value;
                    this.RaisePropertyChanged("Name");
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="ClientTargetAudienceRelationResult", Namespace="http://schemas.datacontract.org/2004/07/RapidSoft.Loaylty.PromoAction.Api.InputPa" +
        "rameters")]
    [System.SerializableAttribute()]
    public partial class ClientTargetAudienceRelationResult : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private int AssignResultCodeField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string ClientIdField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string PromoActionIdField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string ResultDescriptionField;
        
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData {
            get {
                return this.extensionDataField;
            }
            set {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int AssignResultCode {
            get {
                return this.AssignResultCodeField;
            }
            set {
                if ((this.AssignResultCodeField.Equals(value) != true)) {
                    this.AssignResultCodeField = value;
                    this.RaisePropertyChanged("AssignResultCode");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string ClientId {
            get {
                return this.ClientIdField;
            }
            set {
                if ((object.ReferenceEquals(this.ClientIdField, value) != true)) {
                    this.ClientIdField = value;
                    this.RaisePropertyChanged("ClientId");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string PromoActionId {
            get {
                return this.PromoActionIdField;
            }
            set {
                if ((object.ReferenceEquals(this.PromoActionIdField, value) != true)) {
                    this.PromoActionIdField = value;
                    this.RaisePropertyChanged("PromoActionId");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string ResultDescription {
            get {
                return this.ResultDescriptionField;
            }
            set {
                if ((object.ReferenceEquals(this.ResultDescriptionField, value) != true)) {
                    this.ResultDescriptionField = value;
                    this.RaisePropertyChanged("ResultDescription");
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="AssignClientTargetAudienceParameters", Namespace="http://schemas.datacontract.org/2004/07/RapidSoft.Loaylty.PromoAction.Api.InputPa" +
        "rameters")]
    [System.SerializableAttribute()]
    public partial class AssignClientTargetAudienceParameters : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private Vtb24.Arms.AdminServices.TargetAudienceService.ClientTargetAudienceRelation[] ClientAudienceRelationsField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string UserIdField;
        
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData {
            get {
                return this.extensionDataField;
            }
            set {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public Vtb24.Arms.AdminServices.TargetAudienceService.ClientTargetAudienceRelation[] ClientAudienceRelations {
            get {
                return this.ClientAudienceRelationsField;
            }
            set {
                if ((object.ReferenceEquals(this.ClientAudienceRelationsField, value) != true)) {
                    this.ClientAudienceRelationsField = value;
                    this.RaisePropertyChanged("ClientAudienceRelations");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string UserId {
            get {
                return this.UserIdField;
            }
            set {
                if ((object.ReferenceEquals(this.UserIdField, value) != true)) {
                    this.UserIdField = value;
                    this.RaisePropertyChanged("UserId");
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="ClientTargetAudienceRelation", Namespace="http://schemas.datacontract.org/2004/07/RapidSoft.Loaylty.PromoAction.Api.InputPa" +
        "rameters")]
    [System.SerializableAttribute()]
    public partial class ClientTargetAudienceRelation : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string ClientIdField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string PromoActionIdField;
        
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData {
            get {
                return this.extensionDataField;
            }
            set {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string ClientId {
            get {
                return this.ClientIdField;
            }
            set {
                if ((object.ReferenceEquals(this.ClientIdField, value) != true)) {
                    this.ClientIdField = value;
                    this.RaisePropertyChanged("ClientId");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string PromoActionId {
            get {
                return this.PromoActionIdField;
            }
            set {
                if ((object.ReferenceEquals(this.PromoActionIdField, value) != true)) {
                    this.PromoActionIdField = value;
                    this.RaisePropertyChanged("PromoActionId");
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="AssignClientSegmentParameters", Namespace="http://schemas.datacontract.org/2004/07/RapidSoft.Loaylty.PromoAction.Api.InputPa" +
        "rameters")]
    [System.SerializableAttribute()]
    public partial class AssignClientSegmentParameters : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private Vtb24.Arms.AdminServices.TargetAudienceService.Segment[] SegmentsField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string UserIdField;
        
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData {
            get {
                return this.extensionDataField;
            }
            set {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public Vtb24.Arms.AdminServices.TargetAudienceService.Segment[] Segments {
            get {
                return this.SegmentsField;
            }
            set {
                if ((object.ReferenceEquals(this.SegmentsField, value) != true)) {
                    this.SegmentsField = value;
                    this.RaisePropertyChanged("Segments");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string UserId {
            get {
                return this.UserIdField;
            }
            set {
                if ((object.ReferenceEquals(this.UserIdField, value) != true)) {
                    this.UserIdField = value;
                    this.RaisePropertyChanged("UserId");
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="Segment", Namespace="http://schemas.datacontract.org/2004/07/RapidSoft.Loaylty.PromoAction.Api.DTO")]
    [System.SerializableAttribute()]
    public partial class Segment : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string[] ClientIdsField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string IdField;
        
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData {
            get {
                return this.extensionDataField;
            }
            set {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string[] ClientIds {
            get {
                return this.ClientIdsField;
            }
            set {
                if ((object.ReferenceEquals(this.ClientIdsField, value) != true)) {
                    this.ClientIdsField = value;
                    this.RaisePropertyChanged("ClientIds");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string Id {
            get {
                return this.IdField;
            }
            set {
                if ((object.ReferenceEquals(this.IdField, value) != true)) {
                    this.IdField = value;
                    this.RaisePropertyChanged("Id");
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="Version", Namespace="http://schemas.datacontract.org/2004/07/System")]
    [System.SerializableAttribute()]
    public partial class Version : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        private int _BuildField;
        
        private int _MajorField;
        
        private int _MinorField;
        
        private int _RevisionField;
        
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData {
            get {
                return this.extensionDataField;
            }
            set {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public int _Build {
            get {
                return this._BuildField;
            }
            set {
                if ((this._BuildField.Equals(value) != true)) {
                    this._BuildField = value;
                    this.RaisePropertyChanged("_Build");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public int _Major {
            get {
                return this._MajorField;
            }
            set {
                if ((this._MajorField.Equals(value) != true)) {
                    this._MajorField = value;
                    this.RaisePropertyChanged("_Major");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public int _Minor {
            get {
                return this._MinorField;
            }
            set {
                if ((this._MinorField.Equals(value) != true)) {
                    this._MinorField = value;
                    this.RaisePropertyChanged("_Minor");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute(IsRequired=true)]
        public int _Revision {
            get {
                return this._RevisionField;
            }
            set {
                if ((this._RevisionField.Equals(value) != true)) {
                    this._RevisionField = value;
                    this.RaisePropertyChanged("_Revision");
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="TargetAudienceService.ITargetAudienceService")]
    public interface ITargetAudienceService {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ISupportService/Echo", ReplyAction="http://tempuri.org/ISupportService/EchoResponse")]
        string Echo(string message);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ISupportService/Echo", ReplyAction="http://tempuri.org/ISupportService/EchoResponse")]
        System.Threading.Tasks.Task<string> EchoAsync(string message);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ITargetAudienceService/GetClientTargetAudiences", ReplyAction="http://tempuri.org/ITargetAudienceService/GetClientTargetAudiencesResponse")]
        Vtb24.Arms.AdminServices.TargetAudienceService.GetClientTargetAudiencesResult GetClientTargetAudiences(string clientId);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ITargetAudienceService/GetClientTargetAudiences", ReplyAction="http://tempuri.org/ITargetAudienceService/GetClientTargetAudiencesResponse")]
        System.Threading.Tasks.Task<Vtb24.Arms.AdminServices.TargetAudienceService.GetClientTargetAudiencesResult> GetClientTargetAudiencesAsync(string clientId);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ITargetAudienceService/AssignClientTargetAudience", ReplyAction="http://tempuri.org/ITargetAudienceService/AssignClientTargetAudienceResponse")]
        Vtb24.Arms.AdminServices.TargetAudienceService.AssignClientAudienceResult AssignClientTargetAudience(Vtb24.Arms.AdminServices.TargetAudienceService.AssignClientTargetAudienceParameters parameters);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ITargetAudienceService/AssignClientTargetAudience", ReplyAction="http://tempuri.org/ITargetAudienceService/AssignClientTargetAudienceResponse")]
        System.Threading.Tasks.Task<Vtb24.Arms.AdminServices.TargetAudienceService.AssignClientAudienceResult> AssignClientTargetAudienceAsync(Vtb24.Arms.AdminServices.TargetAudienceService.AssignClientTargetAudienceParameters parameters);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ITargetAudienceService/AssignClientSegment", ReplyAction="http://tempuri.org/ITargetAudienceService/AssignClientSegmentResponse")]
        Vtb24.Arms.AdminServices.TargetAudienceService.ResultBase AssignClientSegment(Vtb24.Arms.AdminServices.TargetAudienceService.AssignClientSegmentParameters parameters);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ITargetAudienceService/AssignClientSegment", ReplyAction="http://tempuri.org/ITargetAudienceService/AssignClientSegmentResponse")]
        System.Threading.Tasks.Task<Vtb24.Arms.AdminServices.TargetAudienceService.ResultBase> AssignClientSegmentAsync(Vtb24.Arms.AdminServices.TargetAudienceService.AssignClientSegmentParameters parameters);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ITargetAudienceService/GetTargetAudiences", ReplyAction="http://tempuri.org/ITargetAudienceService/GetTargetAudiencesResponse")]
        Vtb24.Arms.AdminServices.TargetAudienceService.GetTargetAudiencesResult GetTargetAudiences(System.Nullable<bool> isSegment);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ITargetAudienceService/GetTargetAudiences", ReplyAction="http://tempuri.org/ITargetAudienceService/GetTargetAudiencesResponse")]
        System.Threading.Tasks.Task<Vtb24.Arms.AdminServices.TargetAudienceService.GetTargetAudiencesResult> GetTargetAudiencesAsync(System.Nullable<bool> isSegment);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface ITargetAudienceServiceChannel : Vtb24.Arms.AdminServices.TargetAudienceService.ITargetAudienceService, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class TargetAudienceServiceClient : System.ServiceModel.ClientBase<Vtb24.Arms.AdminServices.TargetAudienceService.ITargetAudienceService>, Vtb24.Arms.AdminServices.TargetAudienceService.ITargetAudienceService {
        
        public TargetAudienceServiceClient() {
        }
        
        public TargetAudienceServiceClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public TargetAudienceServiceClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public TargetAudienceServiceClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public TargetAudienceServiceClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public string Echo(string message) {
            return base.Channel.Echo(message);
        }
        
        public System.Threading.Tasks.Task<string> EchoAsync(string message) {
            return base.Channel.EchoAsync(message);
        }
        
        public Vtb24.Arms.AdminServices.TargetAudienceService.GetClientTargetAudiencesResult GetClientTargetAudiences(string clientId) {
            return base.Channel.GetClientTargetAudiences(clientId);
        }
        
        public System.Threading.Tasks.Task<Vtb24.Arms.AdminServices.TargetAudienceService.GetClientTargetAudiencesResult> GetClientTargetAudiencesAsync(string clientId) {
            return base.Channel.GetClientTargetAudiencesAsync(clientId);
        }
        
        public Vtb24.Arms.AdminServices.TargetAudienceService.AssignClientAudienceResult AssignClientTargetAudience(Vtb24.Arms.AdminServices.TargetAudienceService.AssignClientTargetAudienceParameters parameters) {
            return base.Channel.AssignClientTargetAudience(parameters);
        }
        
        public System.Threading.Tasks.Task<Vtb24.Arms.AdminServices.TargetAudienceService.AssignClientAudienceResult> AssignClientTargetAudienceAsync(Vtb24.Arms.AdminServices.TargetAudienceService.AssignClientTargetAudienceParameters parameters) {
            return base.Channel.AssignClientTargetAudienceAsync(parameters);
        }
        
        public Vtb24.Arms.AdminServices.TargetAudienceService.ResultBase AssignClientSegment(Vtb24.Arms.AdminServices.TargetAudienceService.AssignClientSegmentParameters parameters) {
            return base.Channel.AssignClientSegment(parameters);
        }
        
        public System.Threading.Tasks.Task<Vtb24.Arms.AdminServices.TargetAudienceService.ResultBase> AssignClientSegmentAsync(Vtb24.Arms.AdminServices.TargetAudienceService.AssignClientSegmentParameters parameters) {
            return base.Channel.AssignClientSegmentAsync(parameters);
        }
        
        public Vtb24.Arms.AdminServices.TargetAudienceService.GetTargetAudiencesResult GetTargetAudiences(System.Nullable<bool> isSegment) {
            return base.Channel.GetTargetAudiences(isSegment);
        }
        
        public System.Threading.Tasks.Task<Vtb24.Arms.AdminServices.TargetAudienceService.GetTargetAudiencesResult> GetTargetAudiencesAsync(System.Nullable<bool> isSegment) {
            return base.Channel.GetTargetAudiencesAsync(isSegment);
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="TargetAudienceService.IServiceInfo")]
    public interface IServiceInfo {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IServiceInfo/Ping", ReplyAction="http://tempuri.org/IServiceInfo/PingResponse")]
        void Ping();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IServiceInfo/Ping", ReplyAction="http://tempuri.org/IServiceInfo/PingResponse")]
        System.Threading.Tasks.Task PingAsync();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IServiceInfo/GetServiceVersion", ReplyAction="http://tempuri.org/IServiceInfo/GetServiceVersionResponse")]
        Vtb24.Arms.AdminServices.TargetAudienceService.Version GetServiceVersion();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IServiceInfo/GetServiceVersion", ReplyAction="http://tempuri.org/IServiceInfo/GetServiceVersionResponse")]
        System.Threading.Tasks.Task<Vtb24.Arms.AdminServices.TargetAudienceService.Version> GetServiceVersionAsync();
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IServiceInfoChannel : Vtb24.Arms.AdminServices.TargetAudienceService.IServiceInfo, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class ServiceInfoClient : System.ServiceModel.ClientBase<Vtb24.Arms.AdminServices.TargetAudienceService.IServiceInfo>, Vtb24.Arms.AdminServices.TargetAudienceService.IServiceInfo {
        
        public ServiceInfoClient() {
        }
        
        public ServiceInfoClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public ServiceInfoClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public ServiceInfoClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public ServiceInfoClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public void Ping() {
            base.Channel.Ping();
        }
        
        public System.Threading.Tasks.Task PingAsync() {
            return base.Channel.PingAsync();
        }
        
        public Vtb24.Arms.AdminServices.TargetAudienceService.Version GetServiceVersion() {
            return base.Channel.GetServiceVersion();
        }
        
        public System.Threading.Tasks.Task<Vtb24.Arms.AdminServices.TargetAudienceService.Version> GetServiceVersionAsync() {
            return base.Channel.GetServiceVersionAsync();
        }
    }
}