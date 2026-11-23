trigger Lecture35AccountTrigger on Account (before insert, before update, after insert, after update) {
/*when record insert ,industry field banking
when record update ,industry field finance.*/

if(trigger.isBefore)
{
    for(Account acc : trigger.new){
       /* if(trigger.isInsert){
            acc.Industry = 'Banking';
        }
        if(trigger.isUpdate)
        {
            acc.Industry = 'Finance';
        }
            */
        if(trigger.newMap.get(acc.Id).Industry == 'Shipping' && trigger.oldMap.get(acc.Id).Industry == 'Banking'){
            acc.Industry = 'Agriculture';
        }  
    }
}
}