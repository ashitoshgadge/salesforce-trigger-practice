trigger AccountTriggerPractise on Account (before insert, before update) {
    if(trigger.isInsert && trigger.isBefore){
        for(Account acc : trigger.new){
            acc.Industry = 'Banking';
        }
    }

    if(trigger.isBefore && trigger.isUpdate){
        for(Account acc : trigger.new){
            acc.Industry = 'Education';
            acc.Phone = '789';
        }
        
    }
}