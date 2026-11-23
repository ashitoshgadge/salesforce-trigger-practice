trigger Lecture36AccountTrigger on Account (after insert, after update) {
// scenario : on account ,after insert,update ,when update : ind : eng ,phone : 123

    if(trigger.isAfter && trigger.isUpdate && Lecture36AccountTriggerHandler.isRecursion){
        Lecture36AccountTriggerHandler.isRecursion = false;
        List<Account> accList = [SELECT Id,Industry,Phone FROM Account WHERE Id IN:Trigger.NEW];
        List<Account> updatedAccount = new List<Account>();

        for(Account acc : accList){
            acc.Industry = 'Finance';
            acc.Phone    = '786';
            updatedAccount.add(acc);
        }
        if(!updatedAccount.isEmpty()){
            update updatedAccount;
        }
    }
}