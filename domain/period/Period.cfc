component accessors="true" output="false" {

	property string id;
	property date begindate;
	property date enddate;
	property numeric year;
	property numeric month;

	public models.reeleezee.domain.period.Period function init(
		required string id,
		required date begindate,
		required date enddate,
		required numeric year,
		required numeric month
	) {
		variables.id = id;
		variables.begindate = begindate;
		variables.enddate = enddate;
		variables.year = year;
		variables.month = month;
		return this;
	};

}