@isTest
public class NubikademyAccountHelperTest {

    @TestSetup
    private static void createData(){
        Account acc = new Account();
        acc.Name = 'Test';
        insert acc;
    }
    
    @isTest
    public static void fillAccountDescriptionTest(){
        Account acc = [SELECT Id FROM Account WHERE Name = 'Test' LIMIT 1];
        Test.startTest();
        if(acc != null){
            acc.Description = 'Test Update';
            update acc;
        }
        Test.stopTest();
        Account accResult = [SELECT Id, Name FROM Account WHERE Name = 'Test 1' LIMIT 1];
        System.assertEquals('Test 1', accResult.Name);
    }
}