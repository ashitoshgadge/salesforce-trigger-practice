@IsTest
public class AccountTriggerHandlerTest {
    @IsTest
    static void testDescriptionIsBlank(){
        Account acc = new Account(Name = 'testAccount');
        Test.startTest();
        insert acc;
        Test.stopTest();

        Account insertedAcc = [SELECT Id,Description FROM Account WHERE Id =: acc.Id];

        Assert.areEqual('New customer account created via Salesforce.',
                         insertedAcc.Description,
                         'Blank description should be populated'   );
    }
    @IsTest
    static void testDescriptionIsNotBlank(){
        string custDescription = 'vip client';
        Account acc = new Account(Name = 'test account2',Description = custDescription);

        Test.startTest();
        insert acc;
        Test.stopTest();

        Account insertedAccount = [SELECT Id,Description FROM Account WHERE Id =: acc.Id];
        Assert.areEqual(custDescription,insertedAccount.Description,'Existing custom description should not be overwritten');
    }
}