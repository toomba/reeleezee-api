component accessors="true" output="false" {

	property name="InvoiceService" inject="models.reeleezee.app.invoice.InvoiceService";

	public models.reeleezee.interface.invoice.InvoiceService function init() {
		return this;
	};

	// Allow null. Mostly returns models.reeleezee.domain.invoice.Invoice
	public any function transformRedmineProject(required models.redmine.domain.project.Project project) {
		return InvoiceService.transformRedmineProject(project);
	}

	// Result?

	public boolean function sendInvoice(required models.reeleezee.domain.invoice.Invoice invoice){
		return InvoiceService.sendInvoice(invoice);
	}



}