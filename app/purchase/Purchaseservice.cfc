component accessors="true" output="false" {

	property name="PurchaseRepository" inject="models.reeleezee.infrastructure.purchase.PurchaseRepository";

	public models.reeleezee.app.purchase.Purchaseservice function init() {
		return this;
	};

	public models.reeleezee.domain.purchase.PurchaseOverview function getOpenInvoices() {

		var concepts = purchaseRepository.getOpenInvoices();
		var conceptValue = 0;
		var totalOverdue = 0;
		var totalAmountOverdue = 0;
		var totalDue30 = 0;
		var totalAmountDue30 = 0;
		var totalOpenDays = 0;
		var totalOverDueOpenDays = 0;

		for (var i=1;i<=arrayLen(concepts);i++) {
			totalOpenDays = totalOpenDays + concepts[i].getOverdueDays();
			conceptValue = conceptValue + concepts[i].getBaseRemainingAmount();
			if (concepts[i].getOverdueDays() >= -16) {
				totalDue30++;
				totalAmountDue30 = totalAmountDue30 + concepts[i].getBaseRemainingAmount();
			}
			if (concepts[i].getOverdueDays() < 0) {
				totalOverdue++;
				totalAmountOverdue = totalAmountOverdue + concepts[i].getBaseRemainingAmount();
				totalOverDueOpenDays = totalOverDueOpenDays + concepts[i].getOverdueDays();
			}
		}

		return new models.reeleezee.domain.purchase.PurchaseOverview(
			total = arrayLen(concepts),
			totalAmount = conceptValue,
			totalOverdue = totalOverdue,
			totalAmountOverdue = totalAmountOverdue,
			totalOpenDays = totalOpenDays,
			totalOverDueOpenDays = totalOverDueOpenDays,
			conceptInvoices = concepts
		);

	}

}