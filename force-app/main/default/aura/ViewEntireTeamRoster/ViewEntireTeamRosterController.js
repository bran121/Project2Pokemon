({
	populateTeam : function(component, event, helper) {
        component.set('v.columns', 
                      [{label:'Pokemon', fieldName:'PokemonName', type:'String'},
                       {label: 'Roster Slot', fieldName:'Name', type:'String'},
        				//{type:"button", typeAttributes:{ label: 'Release', name:'Release', title:'Release', disabled:false}}
                       ]);
       
        
        
        var action =component.get("c.GetFullRoster");
        
        action.setCallback(this, function(response){
                           var state=response.getState();
        if (state === "SUCCESS"){
            var rows = response.getReturnValue();     
            for (var i = 0; i < rows.length; i++) { 
                var row = rows[i]; 
                //as data columns with relationship __r can not be displayed directly in data table, so generating dynamic columns 
                if (row.Pokemon__r) { 
                    row.PokemonName = row.Pokemon__r.Name; 
                    //row.AccountName = row.Opportunity__r.Account.Name;  
                } 
            } 
            console.log(response.getReturnValue());
            console.log(rows);
            component.set("v.TeamList", rows);
        }
            
                           })
        $A.enqueueAction(action);
		
	},
    
    handleRowAction : function(component, event, helper){
        var selRows = event.getParam('selectedRows');
        component.set("v.delIds",selRows);
    },
    
    
    doDelete : function(component, event, helper){
        var delIdList = component.get("v.delIds");
        var action = component.get('c.deleteRosterSlots');
        action.setParams({lstId : delIdList});
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                $A.get('e.force:refreshView').fire();
                //alert('Successfully Deleted');   
            }
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + 
                                    errors[0].message);
                    }
                } 
                else {
                    console.log("Unknown Error");
                }
            }
        });
        $A.enqueueAction(action);
    },
    
    
    
    
    
        
 
})