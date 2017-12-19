component accessors="true" output="false" {

	property name="settings" inject="coldbox:setting:reeleezee";

	public models.reeleezee.infrastructure.sales.SalesRepository function init() {
		return this;
	}

	public models.reeleezee.domain.sales.Sales[] function getConceptInvoices() {

		var result = "";
		var arrInvoices = [];

		cfhttp(method="GET", charset="utf-8", url="#settings.url#/SalesInvoices/", result="result", username=settings.username, password=settings.password) {
			cfhttpparam(name="$filter" type="url" value="length(Reference) eq null")
		}

		var invoices = deserializeJSON(result.filecontent).value;

		for (var i=1; i<=arrayLen(invoices); i++) {

			arrayAppend(arrInvoices,
				new models.reeleezee.domain.sales.Sales(
					id = invoices[i].id,
					BaseInvoiceAmount = invoices[i].BaseInvoiceAmount,
					BasePaidAmount = invoices[i].BasePaidAmount,
					TotalNetAmount = invoices[i].TotalNetAmount,
					TotalPaidAmount = invoices[i].TotalPaidAmount,
					TotalPayableAmount = invoices[i].TotalPayableAmount,
					TotalTaxAmount = invoices[i].TotalTaxAmount,
					Date = invoices[i].Date,
					BookDate = invoices[i].BookDate
				)
			);

		}

		return arrInvoices;

	}

	public models.reeleezee.domain.sales.Sales[] function getOpenInvoices() {

		var result = "";
		var arrInvoices = [];

		cfhttp(method="GET", charset="utf-8", url="#settings.url#/SalesInvoices/", result="result", username=settings.username, password=settings.password) {
			cfhttpparam(name="$filter" type="url" value="BaseRemainingAmount gt 0")
		}

		var invoices = deserializeJSON(result.filecontent).value;

		for (var i=1; i<=arrayLen(invoices); i++) {

			arrayAppend(arrInvoices,
				new models.reeleezee.domain.sales.Sales(
					id = invoices[i].id,
					BaseInvoiceAmount = invoices[i].BaseInvoiceAmount,
					BasePaidAmount = invoices[i].BasePaidAmount,
					TotalNetAmount = invoices[i].TotalNetAmount,
					TotalPaidAmount = invoices[i].TotalPaidAmount,
					TotalPayableAmount = invoices[i].TotalPayableAmount,
					TotalTaxAmount = invoices[i].TotalTaxAmount,
					BaseRemainingAmount = invoices[i].BaseRemainingAmount,
					Date = invoices[i].Date,
					BookDate = invoices[i].BookDate,
					InvoiceNumber = invoices[i].InvoiceNumber,
					DueDate = invoices[i].DueDate,
					OverdueDays = invoices[i].OverdueDays
				)
			);

		}

		return arrInvoices;

	}

}