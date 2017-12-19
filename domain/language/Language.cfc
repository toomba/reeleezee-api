component accessors="true" output="false" {

	property name="id" 							type="string";
	property name="ActiveForReports" 			type="boolean";
	property name="ActiveForUserInterface" 		type="boolean";
	property name="ChildList" 					type="models.reeleezee.domain.language.Language[]";
	property name="Default" 					type="models.reeleezee.domain.language.Language";
	//property name="DescriptionTranslations" 	type="Object[]";
	property name="name" 						type="string";
	property name="Parent" 						type="models.reeleezee.domain.language.Language";





	public models.reeleezee.domain.language.Language function init(
		string id,
		boolean ActiveForReports,
		boolean ActiveForUserInterface,
		models.reeleezee.domain.language.Language[] ChildList,
		models.reeleezee.domain.language.Language Default,
		string name,
		models.reeleezee.domain.language.Language Parent
	) {

		variables.id = arguments.id;
		variables.ActiveForReports = arguments.ActiveForReports;
		variables.ActiveForUserInterface = arguments.ActiveForUserInterface;
		variables.ChildList = arguments.ChildList;
		variables.Default = arguments.Default;
		variables.name = arguments.name;
		variables.Parent = arguments.Parent;

		return this;
	};

}