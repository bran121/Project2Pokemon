public class FetchPokemon {

    @AuraEnabled
    public static List<Pokemon__c> FetchPoke(){
        return [SELECT name, Move_1__c, Move_2__c, Move_3__c, Move_4__c, SpriteURL__c, SpriteURLField__c from Pokemon__c];
    
    }
}