component extends="models.reeleezee.infrastructure.api.ApiRepository" accessors="true" output="false" {




	public models.reeleezee.infrastructure.country.CountryRepository function init() {
		super.init();
		return this;
	}




	public models.reeleezee.domain.country.Country function construct(required struct data){
		var country = new models.reeleezee.domain.country.Country();

		if(structKeyExists(arguments.data,'id')){
			country.setId(arguments.data.id);
		}
		if(structKeyExists(arguments.data,'Market')){
			country.setMarket(arguments.data.Market);
		}
		if(structKeyExists(arguments.data,'Name')){
			country.setName(arguments.data.Name);
		}
		if(structKeyExists(arguments.data,'SepaCompliant')){
			country.setSepaCompliant(arguments.data.SepaCompliant);
		}
		if(structKeyExists(arguments.data,'SupportIBAN')){
			country.setSupportIBAN(arguments.data.SupportIBAN);
		}
		if(structKeyExists(arguments.data,'UseInternationalStrictIBAN')){
			country.setUseInternationalStrictIBAN(arguments.data.UseInternationalStrictIBAN);
		}


		return country;
	}





}