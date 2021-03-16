public class PopulatePokemon {

	// in anonymous window , startpoint =1, endpoint = 51, for first 50 pokemon
    public static List<Pokemon__c> ConsumeAPI(Integer startpoint, Integer endpoint){
        
        String BaseURL ='https://pokeapi.co/api/v2/pokemon/';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        
        List<Pokemon__c> PokeList = new List<Pokemon__c>();
        List<String> PokeMoveList = new List<String>();
        
        Integer counter = startpoint;
        while (counter < endpoint){
            
            request.setEndpoint(BaseURL + String.valueof(counter));
            request.setMethod('GET');
            HttpResponse response = http.send(request);
            
            if(response.getStatusCode() == 200){
                
                Object deserializedResponse = JSON.deserializeUntyped(response.getBody());
                Map<String, Object> respMap = (Map<String, Object>) deserializedResponse;
                
                // Name Methods & Variables
                List<Object> PokedexFirstArray = (List<Object>) respMap.get('forms');
                Map<String, Object> PokedexValue = (Map<String, Object>) PokedexFirstArray[0];
                String PokemonName = String.valueOf(PokedexValue.get('name')); // Name of Pokemon

               
                
                // Moves Methods and Variables
                List<Object> PokemonMovesList = (List<Object>) respMap.get('moves');
                Map<String, Object> PokemonMoves = (Map<String, Object>) PokemonMovesList[0]; // Gets First Move Index within MoveList
                Map<String, Object> PokemonMove = (Map<String,Object>) PokemonMoves.get('move'); // Gets Move within first index
                
                Integer MoveCounter = 0;
				String Move1, Move2, Move3, Move4;
                List<String> MoveSet = new List<String>();
                while (MoveCounter < 4){
                    PokemonMoves = (Map<String, Object>) PokemonMovesList[Movecounter]; // Current Move index
                    Map<String, Object> AddMove = (Map<String,Object>) PokemonMoves.get('move'); //Stores Current move
                    String SomeMove = String.valueOf(AddMove.get('name'));//Move1
                    PokeMoveList.add(SomeMove);
                 // system.debug(PokeMoveList);
                                         
                    MoveCounter += 1;
                }
                counter += 1;
                Move1 = PokeMoveList[0];
                Move2 = PokeMoveList[1];
                Move3 = PokeMoveList[2];
                Move4 = PokeMoveList[3];  
                PokeMoveList.clear();
            
                // URL Stuff
                Map<String, Object> SpriteURLMap = (Map<String, Object>) respMap.get('sprites');
                Map<String, Object> SpriteURLInnerMap = (Map<String, Object>) SpriteURLMap.get('other');
                Map<String, Object> SpriteURLDeeperMap = (Map<String, Object>) SpriteURLInnerMap.get('official-artwork');
                String SpriteURL = String.valueof(SpriteURLDeeperMap.get('front_default'));
                
            PokeList.add(new Pokemon__C(name=PokemonName,
                                            Move_1__c = Move1,
                                            Move_2__c = Move2,
                                            Move_3__c = Move3,
                                            Move_4__c = Move4,
                                       		SpriteURLField__c = SpriteURL));
             //   system.debug(PokeList);
                
            }
}
        insert PokeList;
        
       
        return null;
    }
}