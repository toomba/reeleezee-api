component accessors="true" output="false" {

	property name="id" 							type="string";
	//property name="AddressFormatList" type="AddressFormat[]";
	property name="Market" 						type="string";
	property name="Name" 						type="string";
	//property name="NameTranslations" type="Object[]";
	//property name="RegionList" type="RegionList[]";
	property name="SepaCompliant" 				type="boolean";
	property name="SupportIBAN" 				type="boolean";
	property name="UseInternationalStrictIBAN" 	type="boolean";


	public models.reeleezee.domain.country.Country function init(
		string id,
		string Market,
		string Name,
		boolean SepaCompliant,
		boolean SupportIBAN,
		boolean UseInternationalStrictIBAN
	) {

		variables.id = arguments.id;
		variables.Market = arguments.Market;
		variables.Name = arguments.Name;
		variables.SepaCompliant = arguments.SepaCompliant;
		variables.SupportIBAN = arguments.SupportIBAN;
		variables.UseInternationalStrictIBAN = arguments.UseInternationalStrictIBAN;

		return this;
	};

}