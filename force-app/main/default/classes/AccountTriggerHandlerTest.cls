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
}