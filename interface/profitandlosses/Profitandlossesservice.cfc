component accessors="true" output="false" {

	property name="periodService"			inject="models.reeleezee.app.period.Periodservice";
	property name="profitandlossesservice"	inject="models.reeleezee.app.profitandlosses.Profitandlossesservice";

	public models.reeleezee.interface.profitandlosses.Profitandlossesservice function init() {
		return this;
	};

	public models.reeleezee.domain.profitandlosses.ProfitAndLosses[] function getProfitAndLossesForYear(
		required numeric year
	) {
		return profitandlossesservice.getProfitAndLossesForYear(year=year);
	}

}