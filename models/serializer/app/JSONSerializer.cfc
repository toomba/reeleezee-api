component{

	property name="logger" inject="logbox:root";

	// Implements a fancier way of Serializing stuff. (A bit like the Java way of doing it with a toString function)
	public function ProSerializeJSON(any obj){
		return rc = SerializeJSON(serializer(obj));
	}

	private function serializer(any obj){

		// Check if it's an object
		if(isObject(obj)){
			// Might be slow to check.
			var meta = getMetadata(obj)
			var rc = {};
			logger.info(message="Parsing object of type #meta.fullname#");

			var serializeFunction = arrayFilter(meta.functions, function(item){
				return item.name EQ "serialize";
			})

			// There seems to be a serialize function available
			if(ArrayLen(serializeFunction) GT 0){
				return serializer(obj.serialize(obj));
			}else{
				for(var property in meta.properties){
					// Runs a dynamic accessor on a property (assuming it exists though)
					var dynamic = obj['get#property.name#']();
					if(!isNull(dynamic)){
						rc[property.name] = serializer(dynamic);	
					}
				}				
			}
			
			return serializer(rc);
		}else if(isArray(obj)){
			var rc = [];
			var list = "";

			for (i=1;i LTE ArrayLen(obj);i=i+1) {
				var meta = getMetadata(obj[i]);
				list = listAppend(list, meta.fullname)
				rc[i] = serializer(obj[i]);
			}

			logger.info(message="Parsing array with items [#list#]");

			return rc;
		}else if(isDate(obj)){
			return dateFormat(obj,"yyyy-mm-dd");	
		}
		else{
			logger.info(message="Parsing simple value #serializeJSON(obj)#");
		
			return obj
		}
	}

}