component extends="models.reeleezee.infrastructure.api.ApiRepository" accessors="true" output="false" {




	public models.reeleezee.infrastructure.language.LanguageRepository function init() {
		super.init();
		return this;
	}


	public models.reeleezee.domain.language.Language function construct(required struct data){
		var language = new models.reeleezee.domain.language.Language();

		if(structKeyExists(arguments.data,'id')){
			language.setId(arguments.data.id);
		}
		if(structKeyExists(arguments.data,'ActiveForReports')){
			language.setActiveForReports(arguments.data.ActiveForReports);
		}
		if(structKeyExists(arguments.data,'ActiveForUserInterface')){
			language.setActiveForUserInterface(arguments.data.ActiveForUserInterface);
		}
		// if(structKeyExists(arguments.data,'ChildList')){
		// 	language.setChildList(arguments.data.ChildList);
		// }
		// if(structKeyExists(arguments.data,'Default')){
		// 	language.setDefault(arguments.data.Default);
		// }
		if(structKeyExists(arguments.data,'name')){
			language.setName(arguments.data.name);
		}
		// if(structKeyExists(arguments.data,'Parent')){
		// 	language.setParent(arguments.data.Parent);
		// }

		return language;
	}





}