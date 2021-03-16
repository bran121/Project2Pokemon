public class DeletePokemon {
    public static void DeleteAllPokemon(){
List<Pokemon__c> ALLPOKEMON = [Select Name from Pokemon__c];
                delete ALLPOKEMON;
    }




public static void DeleteAllPokemonRosters(){
List<Pokemon_Roster__c> DeletePokemonRosters = [Select Name from Pokemon_Roster__c];
                delete DeletePokemonRosters;
    }
}