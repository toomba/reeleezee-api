// Replaced by Invoice
component accessors="true" output="false" {

	property name="id" type="string";
	//property name="entityKind" type="EnityKind";
	property name="AdditionalName" type="string";
	property name="AddressList" type="models.reeleezee.domain.address.Address[]";
	//property name="AdminRelation" type="Relation";
	//property name="BalanceAccount" type="Account";
	//property name="BankRelationList" type="BankRelation[]";
	property name="ChamberOfCommerceCity" type="string";
	property name="ChamberOfCommerceNumber" type="string";
	property name="City" type="string";
	//property name="CommunicationChannelList" type="CommunicationChannel[]";
	property name="Country" type="models.reeleezee.domain.country.Country";
	//property name="CrowdEntity" type="CrowdEnitiy";
	//property name="CustomerStatus" type="CustomerStatus";
	//property name="CustomerType" type="CustomerType";
	property name="DefaultAccruedQuantity" type="numeric";
	//property name="DefaultBankRelation" type="BankRelation";
	//property name="DefaultInvoiceShippingMethod" type="CommunicationChannel";
	property name="DefaultRate" type="numeric";
	property name="DiscountPercentage" type="numeric";
	property name="DueDays" type="numeric";
	property name="EMail" type="string";
	//property name="EntityType" type="EntityType";
	property name="FirstName" type="string";
	//property name="FiscalProcessParametersList" type="FiscalProcessParameters";
	//property name="Gender" type="GenderType";
	property name="IdentifierNumber" type="numeric";
	property name="Initials" type="string";
	property name="IsArchived" type="boolean";
	property name="IsLinkedToVendor" type="boolean";
	property name="Language" type="Language";
	property name="LastName" type="string";
	property name="LastNamePrefix" type="string";
	property name="Name" type="string";
	//property name="PaymentAccount" type="PaymentAccount";
	//property name="PaymentMethod" type="PaymentMethod";
	//property name="ProjectList" type="Project[]";
	//property name="ReferringToRelationList" type="Relation[]";
	//property name="Region" type="Region";
	//property name="RowTemplateList" type="RowTemplate[]";
	property name="SearchName" type="string";
	//property name="SearchName" type="VATSource[]";
	property name="Title" type="string";

	public models.reeleezee.domain.Customer.customer function init(
		string id,
		string AdditionalName,
		string ChamberOfCommerceCity,
		string ChamberOfCommerceNumber,
		string City,
		models.reeleezee.domain.country.Country Country,
		numeric DefaultAccruedQuantity,
		numeric DefaultRate,
		numeric DiscountPercentage,
		numeric DueDays,
		string EMail,
		string FirstName,
		numeric IdentifierNumber,
		string Initials,
		boolean IsArchived,
		boolean IsLinkedToVendor,
		models.reeleezee.domain.language.Language Language,
		string LastName,
		string LastNamePrefix,
		string Name,
		string SearchName,
		string Title
	) {

		variables.id = arguments.id
		variables.AdditionalName = arguments.AdditionalName
		variables.ChamberOfCommerceCity = arguments.ChamberOfCommerceCity
		variables.ChamberOfCommerceNumber = arguments.ChamberOfCommerceNumber
		variables.City = arguments.City
		variables.Country = arguments.Country
		variables.DefaultAccruedQuantity = arguments.DefaultAccruedQuantity
		variables.DefaultRate = arguments.DefaultRate
		variables.DiscountPercentage = arguments.DiscountPercentage
		variables.DueDays = arguments.DueDays
		variables.EMail = arguments.EMail
		variables.FirstName = arguments.FirstName
		variables.IdentifierNumber = arguments.IdentifierNumber
		variables.Initials = arguments.Initials
		variables.IsArchived = arguments.IsArchived
		variables.IsLinkedToVendor = arguments.IsLinkedToVendor
		variables.Language = arguments.Language
		variables.LastName = arguments.LastName
		variables.LastNamePrefix = arguments.LastNamePrefix
		variables.Name = arguments.Name
		variables.SearchName = arguments.SearchName
		variables.Title = arguments.Title


		return this;
	};

}