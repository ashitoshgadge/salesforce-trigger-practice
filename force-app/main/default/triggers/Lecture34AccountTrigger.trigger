trigger Lecture34AccountTrigger on Account (before insert, before update , after update , after insert) {

    if(trigger.isBefore && (trigger.isInsert || trigger.isUpdate)){
        for(Account acc : trigger.new)
        {
            if(acc.Industry == 'Technology' && acc.AnnualRevenue == null && String.isBlank(String.ValueOf(acc.AnnualRevenue)))
            {
                acc.addError('Annual revenue should not be null');
            }
        }
    }
    //scenario : to get related record and update the related contact.
    if(trigger.isBefore && trigger.isUpdate){   // before mai bhi lagaya to contList de dega ,because update ha agar insert hota to after mai chalta
        Set<Id> accId = new Set<Id>();
        for(Account acc : trigger.new){
            accId.add(acc.Id);
        }
        List<Contact> cntList = [SELECT Id FROM Contact WHERE AccountId =: accId];
        
        List<Contact> upCntList = new List<Contact>();
        for(Contact cnt : cntList){
            cnt.Phone = '123';
            upCntList.add(cnt);
        } 
        if(!upCntList.isEmpty()){
            update upCntList;
        }
        System.debug('cntList : ' + cntList);
    }

    

}