// https://portal.reeleezee.nl/api/v1/Help/ResourceModel?modelName=DocumentType

component accessors="true" output="false" {

	property name="id" type="numeric";


	public models.reeleezee.domain.documenttype.DocumentType function init(
		numeric id
	) {

		variables.id = arguments.id

		return this;
	};

	// Name = INV
	public void function setInvoice(){
		variables.id = 10
	}

	// ?
	public void function setPIH(){
		variables.id = 10
	}


	public numeric function serialize(){
		return variables.id;
	}

}