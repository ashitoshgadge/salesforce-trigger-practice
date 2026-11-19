trigger AccountTrigger on Account (before insert) {

    AccountTriggerHandler.handleBeforeInsert(trigger.new);

}