@isTest
private class LeadProcessorTest {
    @testSetup
    static void setup() {
        List<Lead> leads = new List<Lead>();
        // insert 10 leads
        for (Integer i=0;i<10;i++) {
            leads.add(new Lead(FirstName='Account ', LastName=String.valueOf(i),
                Company='New York'));
        }
        insert leads;
    }
    @isTest static void test() {
        Test.startTest();
        LeadProcessor uca = new LeadProcessor();
        Id batchId = Database.executeBatch(uca);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        //System.assertEquals(10, [select count() from contact where MailingCity = 'New York']);
    }
}