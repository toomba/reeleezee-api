component accessors="true" output="false" {

	property name="settings" inject="coldbox:setting:reeleezee";
	property name="apiUrl" type="string";

	property name="jsonSerializer" inject="models.reeleezee.models.serializer.app.JSONSerializer";

	public models.reeleezee.infrastructure.api.ApiRepository function init() {
		variables.apiUrl = "https://portal.reeleezee.nl/api/v1";
		return this;
	}

	private any function doRequest(required string path ,string method="GET",struct queryParams={}, struct postParams={}, any bodyParams = {}, struct additionalHeaders={} ){
		var rc = {};
		var fullpath = variables.apiUrl & arguments.path;



		var httpService = new http();
		httpService.setMethod(method);
		httpService.setCharset("utf-8");
		httpService.setUrl(fullpath);

		// Add query params
		for(var key in queryParams){
			httpService.addParam(type="url",name=key,value=queryParams[key]);
		}

		// Add post params
		for(var key in postParams){
			httpService.addParam(type="formfield",name=key,value=postParams[key]);
		}

		for(var key in additionalHeaders){
			httpService.addParam(type="headers",name=key,value=additionalHeaders[key]);
		}

		// Authentication
		var base64authentication = ToBase64("#variables.settings.username#:#variables.settings.password#");

		httpService.addParam(type="headers",name="Authorization",value="Basic #base64authentication#");
		httpService.addParam(type="headers",name="Accept",value="application/json");
		httpService.addParam(type="headers",name="Content-Type",value="application/json");


		if(method EQ "POST" OR method EQ "PUT"){
			var bodyData = jsonSerializer.ProSerializeJSON(bodyParams);

			httpService.addParam(type="body",value="#bodyData#");
		}

		var req = httpService.send();

		var result = req.getPrefix();


		switch(result.statuscode){
			case "200 OK":
				// Convert some data
				if(isJSON(result.filecontent)){
					rc = deserializeJSON(result.filecontent);
				}else{
					throw "Reeleezee API encountered an issue #result.statuscode# - Cannot Parse data as it is not JSON";
				}
			break;
			case "204 No Content":

				if(method EQ "PUT"){
					rc = true;
				}else{
					rc = false;
				}
			break;
			default:
				throw "Reeleezee API encountered an issue #result.statuscode#";
			break;
		}


		return rc;

	}
}