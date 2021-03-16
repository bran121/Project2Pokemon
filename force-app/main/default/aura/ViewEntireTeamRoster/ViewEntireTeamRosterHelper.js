({
    /*deleteRow: function(cmp, row) {
      var action = cmp.get("c.deletePokemonSlot");
        action.setParams({
            "PokemonSlot":row
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var rows = cmp.get('v.TeamList');
                var rowIndex = rows.indexOf(row);
                rows.splice(rowIndex, 1);
                cmp.set('v.TeamList', rows);
            }
            else if (state === "ERROR") {
                // handle error
            }
        });
        $A.enqueueAction(action);
    }*/
})