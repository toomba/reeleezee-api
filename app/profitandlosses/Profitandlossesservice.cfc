component accessors="true" output="false" {

	property name="profitandlossesRepository" inject="ProfitAndLossesRepository";

	public models.reeleezee.app.profitandlosses.Profitandlossesservice function init() {
		return this;
	};

	public models.reeleezee.domain.profitandlosses.ProfitAndLosses[] function getProfitAndLossesForYear(
		required numeric year
	) {
		return profitandlossesRepository.getProfitAndLossesForYear(year=year);
	}

}