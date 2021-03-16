public class ViewEntireTeamRosterApex {

    @AuraEnabled
    public static List<Pokemon_roster__c> GetFullRoster(){
        return [SELECT Name, User__c, Pokemon__r.Name from Pokemon_roster__c];
    
    }
    @auraEnabled
    public static List<Pokemon_Roster__c> getRosterSlot(){    
    		List<Pokemon_Roster__c> RosterSlotList = [SELECT Name From Pokemon_Roster__c LIMIT 10];   
        	return RosterSlotList;
}
    @AuraEnabled
	public static void deleteRosterSlots(List<Pokemon_Roster__c> lstId){
        List<Pokemon_Roster__c> ListToDelete = [SELECT Id From Pokemon_Roster__c Where Id IN:lstId];
        delete ListToDelete;
}

}