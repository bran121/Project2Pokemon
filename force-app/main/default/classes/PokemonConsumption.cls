public class PokemonConsumption {
    /*
	@auraEnabled
    public static String makeCallout() {
        
    	Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://pokeapi.co/api/v2/pokemon/1');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        if(response.getStatusCode() == 200) {
            
            Object deserializedResponse = JSON.deserializeUntyped(response.getBody());
            Map<String, Object> respMap = (Map<String, Object>) deserializedResponse;
                 
 			// [ ]  = List,    {} = map
            // Gets List for Name
            List<Object> PokedexFirstArray = (List<Object>) respMap.get('forms');
            Map<String, Object> PokedexValue = (Map<String, Object>) PokedexFirstArray[0]; // Gets Name of Pokemon within first index of List
            
            
            // Gets List for all Moves
            List<Object> PokemonMovesList = (List<Object>) respMap.get('moves');
            Map<String, Object> PokemonMoves = (Map<String, Object>) PokemonMovesList[0]; // Gets First Move Index within MoveList
            Map<String, Object> PokemonMove = (Map<String,Object>) PokemonMoves.get('move'); // Gets Move within first index
            
            
            // Creates Move set for Pokemon
            Integer counter = 0;
            List<String> MoveSet = new List<String>();
            while (counter < 4){
                PokemonMoves = (Map<String, Object>) PokemonMovesList[counter]; // Current Move index
                Map<String, Object> AddMove = (Map<String,Object>) PokemonMoves.get('move'); //Stores Current move
                MoveSet.add(String.valueOf(AddMove.get('name'))); //Adds Current Move to MoveSet
                counter +=1;
            }
   
            String PokemonName = String.valueOf(PokedexValue.get('name')); // Name of Pokemon
            
            
            
            // Find PNG
            Map<String, Object> SpriteURLMap = (Map<String, Object>) respMap.get('sprites');
            Map<String, Object> SpriteURLInnerMap = (Map<String, Object>) SpriteURLMap.get('other');
            Map<String, Object> SpriteURLDeeperMap = (Map<String, Object>) SpriteURLInnerMap.get('official-artwork');
            String SpriteURL = String.valueof(SpriteURLDeeperMap.get('front_default'));
            
            
            
            
            
            
            system.debug(PokemonName + ' ' + SpriteURL);
}
       return null; 
    }*/
    
}