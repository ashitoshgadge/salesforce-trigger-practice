public with sharing class AccountTriggerHandler {
    public static void handleBeforeInsert(List<Account> acc) {
        for(Account act : acc){
                if(string.isBlank(act.Description)){
                    act.Description = 'New customer account created via Salesforce.';
                }
        }

    }
}