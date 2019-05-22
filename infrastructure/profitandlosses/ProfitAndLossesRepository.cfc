component accessors="true" output="false" {

	property name="settings" 			inject="coldbox:setting:reeleezee";
	property name="periodRepository"	inject="models.reeleezee.infrastructure.period.PeriodRepository";

	public models.reeleezee.infrastructure.profitandlosses.ProfitAndLossesRepository function init() {
		return this;
	}

	public models.reeleezee.domain.profitandlosses.ProfitAndLosses[] function getProfitAndLossesForYear(
		required numeric year
	) {
		var periods = periodRepository.getPeriodsForYear(year=year);
		var ProfitAndLosses = [];

		for (var i=1; i<=arrayLen(periods); i++) {
			arrayAppend(ProfitAndLosses, getProfitAndLossesForPeriod(periods[i]));
		}
		return ProfitAndLosses;
	}

	private models.reeleezee.domain.profitandlosses.ProfitAndLosses function getProfitAndLossesForPeriod(
		required models.reeleezee.domain.period.Period period
	) {

		var result = "";

		cfhttp(method="GET", charset="utf-8", url="#settings.url#/Financials/ProfitAndLosses?startPeriod=#period.getID()#&endPeriod=#period.getID()#", result="result", username=settings.username, password=settings.password);

		var reports = deserializeJSON(result.filecontent).value;
		var sales = reports[arrayLen(reports)].ProfitSheetCredit;
		var costs = reports[arrayLen(reports)-1].ProfitSheetDebit;

		var profitAndLosses = new models.reeleezee.domain.profitandlosses.ProfitAndLosses(
			period = period,
			sales = sales,
			costs = costs
		)

		return profitAndLosses;
	}

}