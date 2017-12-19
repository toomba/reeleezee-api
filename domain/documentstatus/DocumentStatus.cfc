// Replaced by Invoice
component accessors="true" output="false" {

	property name="value" type="number";

	public models.reeleezee.domain.documentstatus.DocumentStatus function init(
		numeric value
	) {

		variables.value = arguments.value;
		return this;
	};

	public void function setTentative(){
		variables.value = 1;
	}

	public void function setOpen(){
		variables.value = 2;
	}

	public void function setClosed(){
		variables.value = 3;
	}

	public numeric function serialize(){
		return value;
	}

}