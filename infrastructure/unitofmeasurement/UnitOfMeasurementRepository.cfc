component extends="models.reeleezee.infrastructure.api.ApiRepository" accessors="true" output="false" {

	public models.reeleezee.infrastructure.UnitOfMeasurement.UnitOfMeasurementRepository function init() {
		// Extending requires initing the super init.
		super.init();
		return this;
	}

	public array function all(){
		var data = doRequest(path="/UnitOfMeasurements/" ,method="GET" );
		var rc = [];
		if(structKeyExists(data,'value') AND isArray(data.value)){
			for(var item in data.value){
				arrayAppend(rc, construct(item));
			}
		}

		return rc;
	}


	public function construct(required struct data ){

		var id 			= structKeyExists(data,'id') ? data.id : '';
		var code 		= structKeyExists(data,'code') ? data.code : '';
		var description = structKeyExists(data,'description') ? data.description : '';
		var pluralname 	= structKeyExists(data,'pluralname') ? data.pluralname : '';

		var rc = new models.reeleezee.domain.unitofmeasurement.UnitOfMeasurement(id=id,code=code,description=description,PluralName=pluralname);

		return rc;
	}

}