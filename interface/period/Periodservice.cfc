component accessors="true" output="false" {

	property name="PeriodService" inject="models.reeleezee.app.period.Periodservice";

	public models.reeleezee.interface.period.Periodservice function init() {
		return this;
	};

	public models.reeleezee.domain.period.Period[] function getPeriodsForCurrentYear() {
		return periodservice.getPeriodsForCurrentYear();
	}

}