component accessors="true" output="false" {

	// Get invoice settings
	property name="invoiceSettings" inject="coldbox:setting:invoice";
	property name="InvoiceRepository" inject="models.reeleezee.infrastructure.invoice.InvoiceRepository";
	property name="UnitOfMeasurementService" inject="models.reeleezee.app.unitofmeasurement.UnitOfMeasurementService.cfcUnitOfMeasurementService";

	// Replace with service as this is code wise not pretty....
	property name="CustomerRepository" inject="CustomerRepository";

	public models.reeleezee.app.invoice.InvoiceService function init() {
		return this;
	};


	// We need a redmine project we can convert to an invoic
	// Allow null. Mostly returns models.reeleezee.domain.invoice.Invoice
	public any function transformRedmineProject(required models.redmine.domain.project.Project project){
		// Convert data to an invoice.init()
		var id = "";
		var BookDate = NOW();
		var DocumentDate = BookDate;
		var DueDate = DateAdd("d",14,BookDate);
		var Header = Replace(invoiceSettings.Header,"%project%", project.getName());
		var Bottom = invoiceSettings.Bottom;
		var Footer = invoiceSettings.Footer;
		var IsVatIncludedInPrice = false;
		var Reference = project.getKlantId();


		// Redmine project has a IdentifierNumber from Reeleezee instead of a normal GUID.
		try{
			var customer = CustomerRepository.getByIdentifierNumber(Reference);
		}catch(any e){
			return;
		}

		// Incase it is a GUID you could use this call
		// var Customer = InvoiceRepository.getCustomer(Reference);


		var addresses = customer.getAddressList();
		var address = {};
		// Doesn't have a service, it's just a representation 1 of 3 values.
		var status = new models.reeleezee.domain.documentstatus.DocumentStatus();
		status.setTentative();

		if(!IsNull(addresses) AND ArrayLen(addresses) GT 0){
			address = addresses[1];
		}else{
			throw "Customer with redmine project name #project.getName()# doesn't have any addresses to bill to.";
		}

		var SalesInvoiceList = [];

		// Get the right unit of measurement for this
		var UOMMs = UnitOfMeasurementService.all();
		UOMMs = arrayFilter(UOMMs, function(item){
			return item.getCode() == "ST";
		});


		if(ArrayLen(UOMMs) GT 0){
			uomm = UOMMs[1];
		}else{
			throw "Cannot find Unit of Measurement for Invoices. Missing UOMM 'ST'";
		}

		// Get all SalesInvoiceLines for this

		// Assume the project has ALL the issues that we want to Invoice for the customer.


		for(var issue in project.getIssues()){

				var line = new models.reeleezee.domain.salesinvoiceline.SalesInvoiceLine(
							discount=0,Quantity=issue.getSpentTime(),description=issue.getID() & ' - ' & issue.getSubject(),Price=project.getFee(),UnitOfMeasureMent=uomm,issue=issue.getId(),Date=issue.getFirstTimewrite()
							);

				// Add it to the list
				arrayAppend(SalesInvoiceList, line);

		}


		var DocumentType = new models.reeleezee.domain.documenttype.DocumentType();
		DocumentType.setInvoice();
		var InvoiceOriginEnum = new models.reeleezee.domain.invoiceoriginenum.InvoiceOriginEnum();
		InvoiceOriginEnum.setDocument();


		var Invoice = construct(Address=address,status=status,language=customer.getLanguage(),DocumentType=DocumentType,Origin=InvoiceOriginEnum,Entity=customer,Date=DocumentDate,BookDate=BookDate,DueDate=DueDate,Header=Header,Bottom=Bottom,Footer=Footer,IsVatIncludedInPrice=IsVatIncludedInPrice,Reference=reference,DocumentLineList=SalesInvoiceList,projectId=project.getId(),projectName=project.getName());


		return Invoice;

	}


	public boolean function sendInvoice(models.reeleezee.domain.invoice.Invoice invoice){
		return InvoiceRepository.sendInvoice(invoice);
	}


	private models.reeleezee.domain.invoice.Invoice function construct(
		string id='',
		models.reeleezee.domain.address.Address Address,
		models.reeleezee.domain.documentstatus.DocumentStatus Status,
		models.reeleezee.domain.language.Language Language,
		models.reeleezee.domain.documenttype.DocumentType DocumentType,
		models.reeleezee.domain.invoiceoriginenum.InvoiceOriginEnum Origin,
		models.reeleezee.domain.customer.Customer Entity,
		date Date,
		date BookDate,
		date DueDate,
		string Header,
		string Bottom,
		string Footer,
		boolean IsVatIncludedInPrice,
		string Reference,
		models.reeleezee.domain.SalesInvoiceLine.SalesInvoiceLine[] DocumentLineList,
		numeric projectId,
		string projectName){

		return new models.reeleezee.domain.invoice.Invoice(
			id,
			Address,
			Status,
			Language,
			DocumentType,
			Origin,
			Entity,
			Date,
			BookDate,
			DueDate,
			Header,
			Bottom,
			Footer,
			IsVatIncludedInPrice,
			Reference,
			DocumentLineList,
			projectId,
			projectName
		);

	}

}