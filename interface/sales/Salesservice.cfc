component accessors="true" output="false" {


	property name="salesservice" inject="models.reeleezee.app.sales.salesservice";

	public models.reeleezee.interface.sales.salesservice function init() {
		return this;
	};

	public models.reeleezee.domain.sales.ConceptOverview function getConceptInvoices() {

		return salesservice.getConceptInvoices();

	}

	public models.reeleezee.domain.sales.ConceptOverview function getOpenInvoices() {

		return salesservice.getOpenInvoices();

	}

}