component accessors="true" output="false" {

	property name="settings" inject="coldbox:setting:reeleezee";

	public models.reeleezee.infrastructure.period.PeriodRepository function init() {
		return this;
	}

	public models.reeleezee.domain.period.Period[] function getPeriodsForYear(
		required numeric year=year(now())
	) {

		var result = "";
		var arrPeriods = [];

		cfhttp(method="GET", charset="utf-8", url="#settings.url#/Periods", result="result", username=settings.username, password=settings.password);

		var periods = deserializeJSON(result.filecontent).value;

		for (var i=1; i<=arrayLen(periods); i++) {
			if (periods[i].year == arguments.year) {

				arrayAppend(
					arrPeriods,
					 new models.reeleezee.domain.period.Period(
					 	id = periods[i].id,
					 	begindate = periods[i].begindate,
					 	EndDate = periods[i].EndDate,
					 	year = periods[i].year,
					 	month = periods[i].Sequence
					 )
				);

				if (periods[i].year == year(now()) && periods[i].Sequence == month(now())) {
					break;
				}
			}
		}

		return arrPeriods;

	}

	public models.reeleezee.domain.period.Period[] function getPeriodsForCurrentYear() {

		return getPeriodsForYear(year=year(now()));

	}

}