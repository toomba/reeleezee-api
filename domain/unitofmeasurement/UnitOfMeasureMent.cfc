// Replaced by Invoice
component accessors="true" output="false" {

	property name="id" type="string";
	property name="Code" type="string";
	property name="Description" type="string";
	property name="PluralName" type="string";
	

	public models.reeleezee.domain.unitofmeasurement.UnitOfMeasureMent function init(
		string id='',
		string Code='',
		string Description='',
		string PluralName=''
	) {

		variables.id = arguments.id;
		variables.Code = arguments.Code;
		variables.Description = arguments.Description;
		variables.PluralName = arguments.PluralName;

		return this;
	};

}