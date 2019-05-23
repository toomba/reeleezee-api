component accessors="true" output="false" {

	property name="customerRepository" 						inject="models.reeleezee.infrastructure.customer.CustomerRepository";

	public models.reeleezee.app.customer.CustomerService function init() {
		return this;
	};

	public any function getByIdentifierNumber(
		required string customerId
	) {
		return customerRepository.getByIdentifierNumber(customerId);
	}

}