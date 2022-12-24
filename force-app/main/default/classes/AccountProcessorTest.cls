@IsTest
private class AccountProcessorTest {
  
  	@testSetup
    private static void createData(){
        Account acc = new Account();
        acc.Name = 'Ejemplo';
        insert acc;
    }
    
    @IsTest
    private static void test() {
        List<Account> accounts = [Select Id, Number_of_contacts__c, Name from Account];
        List<Id> accIds = new List<Id>{accounts.get(0).Id};
        Test.startTest();
        AccountProcessor.countContacts(accIds);
        Test.stopTest();
        // runs callout and check results
        //System.assertNotEquals(null, accounts.get(0).Number_of_contacts__c);
    }
}