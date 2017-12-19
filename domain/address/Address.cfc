component accessors="true" output="false" {


	property name="id" 							type="string";
	//property name="AddressFormat" 				type="AddressFormat[]";
	property name="AreaLocality" 				type="string";
	property name="BuildingName" 				type="boolean";
	property name="BuildingNumber" 				type="boolean";
	property name="City" 						type="string";
	property name="Country" 					type="models.reeleezee.domain.country.Country";
	property name="Department" 					type="string";
	property name="District" 					type="string";
	property name="Floor" 						type="string";
	property name="FullAddress" 				type="string";
	property name="Landmark" 					type="string";
	property name="MainStreet" 					type="string";
	property name="Neighborhood" 				type="string"; 
	property name="Number" 						type="string"; 
	property name="NumberExtension" 			type="string"; 
	property name="PObox" 						type="string"; 
	property name="Postcode" 					type="string"; 
	property name="PostOffice" 					type="string"; 
	//property name="Province" 					type="Region"; 
	property name="ReplyMail" 					type="string"; 
	property name="Room" 						type="string"; 
	//property name="State" 						type="Region"; 
	property name="Street" 						type="string"; 
	//property name="Type" 						type="AddressType[]"; 

	property name="Village" 					type="string"; 


	public models.reeleezee.domain.address.Address function init(
		string id,
		string AreaLocality,
		boolean BuildingName,
		boolean BuildingNumber,
		string City,
		models.reeleezee.domain.country.Country Country,
		string Department,
		string District,
		string Floor,
		string FullAddress,
		string Landmark,
		string MainStreet,
		string Neighborhood,
		string Number,
		string NumberExtension,
		string PObox,
		string Postcode,
		string PostOffice,
		string ReplyMail,
		string Room,
		string Street,
		string Village
	) {

		variables.id = arguments.id;
		variables.AreaLocality = arguments.AreaLocality;
		variables.BuildingName = arguments.BuildingName;
		variables.BuildingNumber = arguments.BuildingNumber;
		variables.City = arguments.City;
		variables.Country = arguments.Country;
		variables.Department = arguments.Department;
		variables.District = arguments.District;
		variables.Floor = arguments.Floor;
		variables.FullAddress = arguments.FullAddress;
		variables.Landmark = arguments.Landmark;
		variables.MainStreet = arguments.MainStreet;
		variables.Neighborhood = arguments.Neighborhood;
		variables.Number = arguments.Number;
		variables.NumberExtension = arguments.NumberExtension;
		variables.PObox = arguments.PObox;
		variables.Postcode = arguments.Postcode;
		variables.PostOffice = arguments.PostOffice;
		variables.ReplyMail = arguments.ReplyMail;
		variables.Room = arguments.Room;
		variables.Street = arguments.Street;
		variables.Village = arguments.Village;

		return this;
	};

}