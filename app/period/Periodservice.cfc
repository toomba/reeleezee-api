component accessors="true" output="false" {

	property name="PeriodRepository" inject="models.reeleezee.infrastructure.period.PeriodRepository";

	public models.reeleezee.app.period.Periodservice function init() {
		return this;
	};

	public models.reeleezee.domain.period.Period[] function getPeriodsForCurrentYear() {

		return periodRepository.getPeriodsForCurrentYear();

	}

}