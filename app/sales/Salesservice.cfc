component accessors="true" output="false" {

	property name="salesRepository" inject="salesRepository";

	public models.reeleezee.app.sales.Salesservice function init() {
		return this;
	};

	public models.reeleezee.domain.sales.ConceptOverview function getConceptInvoices() {

		var concepts = salesRepository.getConceptInvoices();
		var conceptValue = 0;

		for (var i=1;i<=arrayLen(concepts);i++) {
			conceptValue = conceptValue + concepts[i].getTotalNetAmount();
		}

		return new models.reeleezee.domain.sales.ConceptOverview(
			total = arrayLen(concepts),
			totalAmount = conceptValue,
			conceptInvoices = concepts
		);

	}

	public models.reeleezee.domain.sales.ConceptOverview function getOpenInvoices() {

		var concepts = salesRepository.getOpenInvoices();
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

		return new models.reeleezee.domain.sales.ConceptOverview(
			total = arrayLen(concepts),
			totalAmount = conceptValue,
			totalOverdue = totalOverdue,
			totalAmountOverdue = totalAmountOverdue,
			totalDue30 = totalDue30,
			totalAmountDue30 = totalAmountDue30,
			totalOpenDays = totalOpenDays,
			totalOverDueOpenDays = totalOverDueOpenDays,
			conceptInvoices = concepts
		);

	}

}