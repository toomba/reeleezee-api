component accessors="true" output="false" {

	property name="CustomerService" inject="models.reeleezee.app.customer.CustomerService";

	public models.reeleezee.interface.customer.CustomerService function init() {
		return this;
	};

	public any function getByIdentifierNumber(required string customerId){
		return CustomerService.getByIdentifierNumber(customerId);
	}



}