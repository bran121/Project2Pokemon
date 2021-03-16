public inherited sharing class Utility {
    
    
    public static List<Pokemon__c> ConsumeAPI(){
        
        String BaseURL ='https://pokeapi.co/api/v2/pokemon/';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        
        List<Pokemon__c> PokeList = new List<Pokemon__c>();
        //List<Move__c> MoveList = new List<Move__c>();
        
        Integer counter = 1;
        while (counter <5){
            
            request.setEndpoint(BaseURL + String.valueof(counter));
            request.setMethod('GET');
            
            HttpResponse response = http.send(request);

            if(response.getStatusCode() == 200){
                system.debug('hello');
                
                Object deserializedResponse = JSON.deserializeUntyped(response.getBody());
                Map<String, Object> respMap = (Map<String, Object>) deserializedResponse;
                
                List<Object> PokedexFirstArray = (List<Object>) respMap.get('forms');
                Map<String, Object> PokedexValue = (Map<String, Object>) PokedexFirstArray[0];
                String PokemonName = String.valueOf(PokedexValue.get('name')); // Name of Pokemon
                system.debug(PokemonName);
                
                // Move stuff
                List<Object> PokemonMovesList = (List<Object>) respMap.get('moves');
                Map<String, Object> PokemonMoves = (Map<String, Object>) PokemonMovesList[0]; // Gets First Move Index within MoveList
                Map<String, Object> PokemonMove = (Map<String,Object>) PokemonMoves.get('move'); // Gets Move within first index
                
                
                
                Integer counterM = 0;
                List<String> MoveSet = new List<String>();
                while (counterM < 4){
                    PokemonMoves = (Map<String, Object>) PokemonMovesList[counter]; // Current Move index
                    Map<String, Object> AddMove = (Map<String,Object>) PokemonMoves.get('move'); //Stores Current move
                    String SomeMove = String.valueOf(AddMove.get('name'));//Move1
                    /*String Move1 = SomeMove;
                    
                    List<Move__c> ListOfMoves;
                    PokeList.add(new Pokemon__c(name=PokeName, Move1 = ListOfMoves[0];
                                               				   Move2 = List[1]
                                               				   Move3)));
                    */
                   Pokemon__c p = new Pokemon__c(Name = PokemonName);
                    //system.debug(p.id);
                    //insert p;
                   // MoveList.add(new Move__c (Name = SomeMove, Pokemon__c = p.id));
                   // system.debug(moveList);
                    
                    counterM += 1;
                }
                
              //  MoveList.clear();
                
            }        	
            
            counter +=1;
        }
       // insert MoveList;
        //insert PokeList[0];
        return null; 
        
    }
    
}