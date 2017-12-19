component accessors="true" output="false" {

	property string id;
	property numeric BaseInvoiceAmount;
	property numeric BasePaidAmount;
	property numeric TotalNetAmount;
	property numeric TotalPaidAmount;
	property numeric TotalPayableAmount;
	property numeric TotalTaxAmount;
	property numeric BaseRemainingAmount;
	property date Date;
	property date BookDate;
	property numeric InvoiceNumber;
	property numeric DueDate;
	property numeric OverdueDays;

	public models.reeleezee.domain.sales.Sales function init(
		required string id,
		required numeric BaseInvoiceAmount,
		required numeric BasePaidAmount,
		required numeric TotalNetAmount,
		required numeric TotalPaidAmount,
		required numeric TotalPayableAmount,
		required numeric TotalTaxAmount,
		numeric BaseRemainingAmount,
		required date Date,
		required date BookDate,
		numeric InvoiceNumber,
		numeric DueDate,
		numeric OverdueDays
	) {
		variables.id = id;
		variables.BaseInvoiceAmount = BaseInvoiceAmount;
		variables.BasePaidAmount = BasePaidAmount;
		variables.TotalNetAmount = TotalNetAmount;
		variables.TotalPaidAmount = TotalPaidAmount;
		variables.TotalPayableAmount = TotalPayableAmount;
		variables.TotalTaxAmount = TotalTaxAmount;
		variables.Date = Date;
		variables.BookDate = BookDate;
		if (structKeyExists(arguments, 'BaseRemainingAmount')) {
			variables.BaseRemainingAmount = BaseRemainingAmount;
		}
		if (structKeyExists(arguments, 'InvoiceNumber')) {
			variables.InvoiceNumber = InvoiceNumber;
		}
		if (structKeyExists(arguments, 'DueDate')) {
			variables.DueDate = DueDate;
		}
		if (structKeyExists(arguments, 'OverdueDays')) {
			variables.OverdueDays = OverdueDays;
		}
		return this;
	};

}