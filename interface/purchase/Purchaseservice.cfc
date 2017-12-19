component accessors="true" output="false" {

	property name="purchaseService" inject="reeleezee.app.purchase.PurchaseService";

	public models.reeleezee.interface.purchase.Purchaseservice function init() {
		return this;
	};

	public models.reeleezee.domain.purchase.PurchaseOverview function getOpenInvoices() {

		return purchaseservice.getOpenInvoices();

	}

}