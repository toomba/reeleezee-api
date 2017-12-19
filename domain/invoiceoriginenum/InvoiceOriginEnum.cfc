component accessors="true" output="false" {

	property name="value" type="number";

	public models.reeleezee.domain.invoiceoriginenum.InvoiceOriginEnum function init(
		numeric value
	) {

		variables.value = arguments.value;
		return this;
	};

	public void function setUnknown(){
		variables.value = 0;
	}

	public void function setReceipt(){
		variables.value = 1;
	}

	public void function setDocument(){
		variables.value = 2;
	}

	public numeric function serialize(){
		return value;
	}

}