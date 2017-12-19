component extends="models.reeleezee.infrastructure.api.ApiRepository" accessors="true" output="false" {

	property name="CountryRepository" inject="CountryRepository";
	property name="LanguageRepository" inject="LanguageRepository";
	property name="AddressRepository" inject="AddressRepository";

	public models.reeleezee.infrastructure.customer.CustomerRepository function init() {
		// Extending requires initing the super init.
		super.init();
		return this;
	}

	public function getByIdentifierNumber(required string identifierNumber){
		var rc = {};
		// First get the customer
		var qry = {
			"$filter"="IdentifierNumber eq #identifierNumber#"
		}
		var data = doRequest(path="/Customers/",method="GET",queryParams=qry);

		if(structKeyExists(data,'value') AND ArrayLen(data.value) GT 0){
			var item = data.value[1];
			// Get the full customer
			rc = get(item.id);

		}else{
			throw "Couldn't find customer with identifier #identifierNumber#";	
		}


		return rc;
	}


	public function get(required string id){
		var rc = {};
		// 
		var qry = {
			"$expand"="*"
		}
		var data = doRequest(path="/Customers/#id#",method="GET",queryParams=qry);


		if(structKeyExists(data,'id') EQ TRUE AND Len(data.id) GT 0){
			// Convert data
			rc = construct(data);
		}else{
			//Handle on missing		
			throw "Couldn't find customer with #id#";	
		}


		return rc;
	}


	// Couldn't get a nice naming convention. (Create = creating with a post, so producing would be showing the result?)
	public function construct(required struct data ){
		var customer = new models.reeleezee.domain.customer.Customer();


		if(structKeyExists(data,'id') EQ TRUE){
			customer.setId(data.id);
		}
		if(structKeyExists(data,'AddressList') EQ TRUE){
			var addresses = [];
			for(var item in data.AddressList){
				ArrayAppend(addresses,AddressRepository.construct(item));
			}

			customer.setAddressList(addresses);
		}

		if(structKeyExists(data,'AdditionalName') EQ TRUE){
			customer.setAdditionalName(data.AdditionalName);
		}
		if(structKeyExists(data,'ChamberOfCommerceCity') EQ TRUE){
			customer.setChamberOfCommerceCity(data.ChamberOfCommerceCity);
		}
		if(structKeyExists(data,'ChamberOfCommerceNumber') EQ TRUE){
			customer.setChamberOfCommerceNumber(data.ChamberOfCommerceNumber);
		}
		if(structKeyExists(data,'City') EQ TRUE){
			customer.setCity(data.City);
		}
		if(structKeyExists(data,'DefaultAccruedQuantity') EQ TRUE){
			customer.setDefaultAccruedQuantity(data.DefaultAccruedQuantity);
		}
		if(structKeyExists(data,'DefaultRate') EQ TRUE){
			customer.setDefaultRate(data.DefaultRate);
		}
		if(structKeyExists(data,'DiscountPercentage') EQ TRUE){
			customer.setDiscountPercentage(data.DiscountPercentage);
		}
		if(structKeyExists(data,'DueDays') EQ TRUE){
			customer.setDueDays(data.DueDays);
		}
		if(structKeyExists(data,'EMail') EQ TRUE){
			customer.setEMail(data.EMail);
		}
		if(structKeyExists(data,'FirstName') EQ TRUE){
			customer.setFirstName(data.FirstName);
		}
		if(structKeyExists(data,'IdentifierNumber') EQ TRUE){
			customer.setIdentifierNumber(data.IdentifierNumber);
		}
		if(structKeyExists(data,'Initials') EQ TRUE){
			customer.setInitials(data.Initials);
		}
		if(structKeyExists(data,'IsArchived') EQ TRUE){
			customer.setIsArchived(data.IsArchived);
		}
		if(structKeyExists(data,'IsLinkedToVendor') EQ TRUE){
			customer.setIsLinkedToVendor(data.IsLinkedToVendor);
		}
		if(structKeyExists(data,'LastName') EQ TRUE){
			customer.setLastName(data.LastName);
		}
		if(structKeyExists(data,'LastNamePrefix') EQ TRUE){
			customer.setLastNamePrefix(data.LastNamePrefix);
		}
		if(structKeyExists(data,'Name') EQ TRUE){
			customer.setName(data.Name);
		}
		if(structKeyExists(data,'SearchName') EQ TRUE){
			customer.setSearchName(data.SearchName);
		}
		if(structKeyExists(data,'Title') EQ TRUE){
			customer.setTitle(data.Title);
		}

		// Country
		if(structKeyExists(data,'Country') EQ TRUE){
			customer.SetCountry(CountryRepository.construct(data.country));
		}


		if(structKeyExists(data,'Language') EQ TRUE){
			customer.SetLanguage(LanguageRepository.construct(data.Language));
		}


	
		return customer;

	}

	




}