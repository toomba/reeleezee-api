
// Old API this is called a LineList item
// New API this is a SalesInvoiceLine
// Structure: https://portal.reeleezee.nl/api/v1/Help/ResourceModel?modelName=SalesInvoiceLine
component accessors="true" displayname="SalesInvoiceLine item" {
	property name="id" 						type="string";
	property name="discount" 				type="string";
	property name="Quantity"				type="numeric";
	property name="description"				type="string";
	property name="Price"					type="numeric";
	property name="Product"					type="string"; // Reference to right product (static 999 if I remember correctly)
	property name="UnitOfMeasureMent"		type="models.reeleezee.domain.unitofmeasurement.UnitOfMeasureMent"; // ST by default
	property name="Date"					type="date";

	// Not used by Reeleezee
	property name="issue"		type="numeric"; // ST by default

	public models.reeleezee.domain.salesinvoiceline.SalesInvoiceLine function init(
			string id='',
			numeric discount=0,
			numeric Quantity=0,
			string description='',
			numeric Price=0,
			string Product='',
			models.reeleezee.domain.unitofmeasurement.UnitOfMeasureMent UnitOfMeasureMent='',
			string issue,
			date Date
	) {

		variables.id = arguments.id;
		variables.discount = arguments.discount;
		variables.Quantity = arguments.Quantity;
		variables.description = arguments.description;
		variables.Price = arguments.Price;
		variables.Product = arguments.Product;
		variables.UnitOfMeasureMent = arguments.UnitOfMeasureMent;
		variables.Date = arguments.Date;

		if(structKeyExists(arguments, 'issue')){
			variables.issue = arguments.issue;
		}

		return this;
	};

	public struct function serialize(){
		var rc = {};
		var meta = getMetadata(this);

		for(var property in meta.properties){
			// Runs a dynamic accessor on a property (assuming it exists though)
			var dynamic = this['get#property.name#']();
			if(!isNull(dynamic)){
				// Simple value
				if( isSimpleValue(dynamic) ){
					// ONLY when LEN GT 0
					if(Len(dynamic) GT 0){
						rc[property.name] = dynamic;
					}else{

					}
				}else{
					// Other type of objects should just be returned.
					rc[property.name] = dynamic;
				}


			}
		}

		return rc;
	}


}