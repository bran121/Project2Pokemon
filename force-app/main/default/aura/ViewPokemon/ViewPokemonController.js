({
	PopulatePokedex : function(component, event, helper) {
        component.set('v.mycolumns', [//{label:'Pokemon', fieldName:'Name', type:'url', sortable: true},   
            							{label: 'Pokemon', fieldName: 'linkName', type: 'url', sortable:true,
            							typeAttributes: {label: {fieldName:'Name'}, target: '_blank'}},
                                      {label:'Move 1', fieldName:'Move_1__c', type:'String', sortable: true},
                                      {label:'Move 2', fieldName:'Move_2__c', type:'String', sortable: true},
                                      {label:'Move 3', fieldName:'Move_3__c', type:'String', sortable: true},
                                      {label:'Move 4', fieldName:'Move_4__c', type:'String', sortable: true},
                                      {label: 'Image', cellAttributes:{ class: 'customCSS', fieldName:'SpriteURLField__c' }},
                                      {type:"button", typeAttributes:{label:'Add To Team',   name:'Add',  title:'Add',   disabled:false,   }}
            
        ]);
        var action =component.get("c.FetchPoke");
        action.setParams({});
        action.setCallback(this, function(response){
        var state=response.getState();
        if (state === "SUCCESS"){
            
            var records =response.getReturnValue();
            records.forEach(function(record){
                    record.linkName = '/'+record.Id;
                });
            
            
            console.log(response.getReturnValue());
            //component.set("v.PokemonList", response.getReturnValue());
            component.set("v.PokemonList", records);
            helper.sortData(component, component.get("v.sortedBy"), component.get("v.sortedDirection"));
            
            
        }
            
                           })
        $A.enqueueAction(action);
		
	},
    updateColumnSorting: function (cmp, event, helper) {
        var fieldName = event.getParam('fieldName');
        var sortDirection = event.getParam('sortDirection');
        cmp.set("v.sortedBy", fieldName);
        cmp.set("v.sortedDirection", sortDirection);
        helper.sortData(cmp, fieldName, sortDirection);
    },
    
    addToRoster: function(component, event, helper) {
        var recId = event.getParam('row').Id;
        var userId =$A.get("$SObjectType.CurrentUser.Id");
        var actionName = event.getParam('action').name;
        
        if(actionName =='Add'){
            //alert(recId);
            //alert(actionName);
            var createRecordEvent = $A.get("e.force:createRecord");
            //alert(createRecordEvent);
            createRecordEvent.setParams({
                
                "entityApiName": "Pokemon_Roster__c",
                "defaultFieldValues": {
                    'User__c' : userId,
                    'Pokemon__c' : recId 
                }
                
            });

        createRecordEvent.fire();
        }
    }
})