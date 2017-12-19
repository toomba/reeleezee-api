component accessors="true" output="false" {

	property name="settings" inject="coldbox:setting:reeleezee";

	public models.reeleezee.infrastructure.purchase.PurchaseRepository function init() {
		return this;
	}


	public models.reeleezee.domain.purchase.Purchase[] function getOpenInvoices() {

		var result = "";
		var arrInvoices = [];

		cfhttp(method="GET", charset="utf-8", url="#settings.url#/PurchaseInvoices/", result="result", username=settings.username, password=settings.password) {
			cfhttpparam(name="$filter" type="url" value="BaseRemainingAmount gt 0")
		}

		var invoices = deserializeJSON(result.filecontent).value;

		for (var i=1; i<=arrayLen(invoices); i++) {

			arrayAppend(arrInvoices,
				new models.reeleezee.domain.purchase.Purchase(
					id = invoices[i].id,
					BaseRemainingAmount = invoices[i].BaseRemainingAmount,
					OverdueDays = invoices[i].OverdueDays
				)
			);

		}

		return arrInvoices;

	}

}