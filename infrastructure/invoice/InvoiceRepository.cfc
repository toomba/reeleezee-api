component extends="models.reeleezee.infrastructure.api.ApiRepository" accessors="true" output="false" {

	public models.reeleezee.infrastructure.invoice.InvoiceRepository function init() {
		// Extending requires initing the super init.
		super.init();
		return this;
	}

	public boolean function sendInvoice(models.reeleezee.domain.invoice.Invoice invoice){
		var id = Len(invoice.getId()) GT 0 ? invoice.getId() : CreateGUID();
		invoice.setId(id);
		invoice.setReference('');
		return doRequest(path="/SalesInvoices/#id#/" ,method="PUT",queryParams={}, postParams={}, bodyParams = invoice, additionalHeaders={} )
	}


}