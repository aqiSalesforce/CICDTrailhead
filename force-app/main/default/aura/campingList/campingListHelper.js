({
	createItem: function(component, item) {
        let action = component.get("c.saveItem");
        action.setParams({
            "item": item
        });
        action.setCallback(this, function(response){
            let state = response.getState();
            if (state === "SUCCESS") {
                let parsedCampingItem = JSON.parse(JSON.stringify(item));
                let campingItems = JSON.parse(JSON.stringify(component.get("v.items")));
                campingItems.push(parsedCampingItem);
                component.set("v.items", campingItems);
                component.set("v.newItem", {
                    'sObjectType': 'Camping_Item__c',
                              'Name': '',
                              'Quantity__c': 0,
                              'Price__c': 0,
                              'Packed__c': false});
            }
        });
        $A.enqueueAction(action);
    },
})