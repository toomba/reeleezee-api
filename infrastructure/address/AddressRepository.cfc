component extends="models.reeleezee.infrastructure.api.ApiRepository" accessors="true" output="false" {

	property name="CountryRepository" inject="CountryRepository";


	public models.reeleezee.infrastructure.address.AddressRepository function init() {
		super.init();
		return this;
	}




	public models.reeleezee.domain.address.Address function construct(required struct data){
		var address = new models.reeleezee.domain.address.Address();

		if(structKeyExists(arguments.data,'id')){
			address.setId(arguments.data.id);
		}
		if(structKeyExists(arguments.data,'AreaLocality')){
			address.setAreaLocality(arguments.data.AreaLocality);
		}
		if(structKeyExists(arguments.data,'BuildingName')){
			address.setBuildingName(arguments.data.BuildingName);
		}
		if(structKeyExists(arguments.data,'BuildingNumber')){
			address.setBuildingNumber(arguments.data.BuildingNumber);
		}
		if(structKeyExists(arguments.data,'City')){
			address.setCity(arguments.data.City);
		}
		if(structKeyExists(arguments.data,'Country')){
			address.setCountry(CountryRepository.construct(arguments.data.Country));
		}
		if(structKeyExists(arguments.data,'Department')){
			address.setDepartment(arguments.data.Department);
		}
		if(structKeyExists(arguments.data,'District')){
			address.setDistrict(arguments.data.District);
		}
		if(structKeyExists(arguments.data,'Floor')){
			address.setFloor(arguments.data.Floor);
		}
		if(structKeyExists(arguments.data,'FullAddress')){
			address.setFullAddress(arguments.data.FullAddress);
		}
		if(structKeyExists(arguments.data,'Landmark')){
			address.setLandmark(arguments.data.Landmark);
		}
		if(structKeyExists(arguments.data,'MainStreet')){
			address.setMainStreet(arguments.data.MainStreet);
		}
		if(structKeyExists(arguments.data,'Neighborhood')){
			address.setNeighborhood(arguments.data.Neighborhood);
		}
		if(structKeyExists(arguments.data,'Number')){
			address.setNumber(arguments.data.Number);
		}
		if(structKeyExists(arguments.data,'NumberExtension')){
			address.setNumberExtension(arguments.data.NumberExtension);
		}
		if(structKeyExists(arguments.data,'PObox')){
			address.setPObox(arguments.data.PObox);
		}
		if(structKeyExists(arguments.data,'Postcode')){
			address.setPostcode(arguments.data.Postcode);
		}
		if(structKeyExists(arguments.data,'PostOffice')){
			address.setPostOffice(arguments.data.PostOffice);
		}
		if(structKeyExists(arguments.data,'ReplyMail')){
			address.setReplyMail(arguments.data.ReplyMail);
		}
		if(structKeyExists(arguments.data,'Room')){
			address.setRoom(arguments.data.Room);
		}
		if(structKeyExists(arguments.data,'Street')){
			address.setStreet(arguments.data.Street);
		}
		if(structKeyExists(arguments.data,'Village')){
			address.setVillage(arguments.data.Village);
		}


		return address;
	}





}