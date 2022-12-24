@isTest
public class AddPrimaryContactTest {
    @testSetup
    static void setup() {
        List<Account> accountsNY = new List<Account>();
        // add a parent account
        accountsNY.add(new Account(name='Parent'));
        // add 100 child accounts
        for (Integer i = 0; i < 50; i++) {
            accountsNY.add(new Account(
                name='Test Account'+i,
                BillingState = 'NY'
            ));
        }
        insert accountsNY;
        
        List<Account> accountsCA = new List<Account>();
        // add a parent account
        accountsCA.add(new Account(name='Parent'));
        // add 100 child accounts
        for (Integer i = 0; i < 50; i++) {
            accountsCA.add(new Account(
                name='Test Account'+i,
                BillingState = 'CA'
            ));
        }
        insert accountsCA;
        
        Contact con = new Contact(FirstName = 'ContactTest', LastName='Test');
        con.AccountId = accountsCA.get(0).Id;
        insert con;
    }
    static testmethod void testQueueable() {
        // query for test data to pass to queueable class
        Id parentId = [select id from account where name = 'Parent'][0].Id;
        List<Account> accounts = [select id, name from account where name like 'Test Account%'];
        Contact cnt = [SELECT Id FROM Contact LIMIT 1];
        //cnt.AccountId = accounts.get(0).Id;
        //update cnt; 
        // Create our Queueable instance
        AddPrimaryContact updater = new AddPrimaryContact(cnt, 'CA');
        // startTest/stopTest block to force async processes to run
        Test.startTest();
        System.enqueueJob(updater);
        Test.stopTest();
        // Validate the job ran. Check if record have correct parentId now
        //System.assertEquals(100, [select count() from account where parentId = :parentId]);
    }
}