// Replaced by Invoice
component accessors="true" output="false" {

	property string id;

	// Recipient Address

	property models.reeleezee.domain.address.Address Address;
	property models.reeleezee.domain.documentstatus.DocumentStatus Status;
	property models.reeleezee.domain.language.Language Language;
	property models.reeleezee.domain.documenttype.DocumentType DocumentType;
	property models.reeleezee.domain.invoiceoriginenum.InvoiceOriginEnum Origin;

	// Should be Type of Entity, but they look similar. Might be an extended object with tiny differences....
	property models.reeleezee.domain.customer.Customer Entity;

	property date BookDate;
	property date DueDate;
	property date Date;
	property numeric InvoiceOriginEnum;

	// Header
	property string Header;
	property string Bottom;
	property string Footer;

	property numeric projectId;

	property boolean IsVatIncludedInPrice;

	// Customer Reference
	property string Reference;
	property models.reeleezee.domain.salesinvoiceline.SalesInvoiceLine[] DocumentLineList;	

	// Not related to a Reeleezee invoice but useful for showing information
	property string projectName;



	public models.reeleezee.domain.invoice.Invoice function init(
		string id,
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
		models.reeleezee.domain.salesinvoiceline.SalesInvoiceLine[] DocumentLineList,
		numeric projectId,
		string projectName
	) {
		if(structKeyExists(arguments,'id')){
			variables.id = arguments.id
		}
		if(structKeyExists(arguments,'Address')){
			variables.Address = arguments.Address
		}
		if(structKeyExists(arguments,'Status')){
			variables.Status = arguments.Status
		}
		if(structKeyExists(arguments,'Language')){
			variables.Language = arguments.Language
		}
		if(structKeyExists(arguments,'DocumentType')){
			variables.DocumentType = arguments.DocumentType
		}
		if(structKeyExists(arguments,'Origin')){
			variables.Origin = arguments.Origin
		}
		if(structKeyExists(arguments,'Entity')){
			variables.Entity = arguments.Entity
		}
		if(structKeyExists(arguments,'BookDate')){
			variables.BookDate = arguments.BookDate
		}
		if(structKeyExists(arguments,'Date')){
			variables.Date = arguments.Date
		}
		if(structKeyExists(arguments,'DueDate')){
			variables.DueDate = arguments.DueDate
		}
		if(structKeyExists(arguments,'Header')){
			variables.Header = arguments.Header
		}
		if(structKeyExists(arguments,'Bottom')){
			variables.Bottom = arguments.Bottom
		}
		if(structKeyExists(arguments,'Footer')){
			variables.Footer = arguments.Footer
		}
		if(structKeyExists(arguments,'DocumentLineList')){
			variables.DocumentLineList = arguments.DocumentLineList
		}
		if(structKeyExists(arguments,'IsVatIncludedInPrice')){
			variables.IsVatIncludedInPrice = arguments.IsVatIncludedInPrice
		}
		if(structKeyExists(arguments,'Reference')){
			variables.Reference = arguments.Reference
		}

		if(structKeyExists(arguments,'DocumentLineList')){
			variables.DocumentLineList = arguments.DocumentLineList
		}

		if(structKeyExists(arguments,'projectId')){
			variables.projectId = arguments.projectId
		}

		if(structKeyExists(arguments,'projectName')){
			variables.projectName = arguments.projectName
		}

		return this;
	};

	public numeric function getTotalPrice(){
		var rc = 0;
		for(var item in variables.DocumentLineList){
			rc = rc + ( item.getQuantity() * item.getPrice() );
		}	

		return rc;
	}

	public numeric function getTotalQuantity(){
		var rc = 0;
		for(var item in variables.DocumentLineList){
			rc = rc + item.getQuantity();
		}	

		return rc;
	}

	// public struct function serialize(){
	// 	var rc = {};
	// 	var meta = getMetadata(this);

	// 	for(var property in meta.properties){
	// 		// Runs a dynamic accessor on a property (assuming it exists though)
	// 		var dynamic = this['get#property.name#']();
	// 		if(!isNull(dynamic)){
	// 			// Simple value
	// 			if( isSimpleValue(dynamic)){
	// 				// ONLY when LEN GT 0
	// 				if(Len(dynamic) GT 0){
	// 					rc[property.name] = dynamic;	
	// 				}
	// 			}else{
	// 				// Other type of objects should just be returned.
	// 				rc[property.name] = dynamic;
	// 			}

				
	// 		}
	// 	}

	// 	return rc;
	// }


}