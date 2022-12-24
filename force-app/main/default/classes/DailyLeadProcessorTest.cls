@isTest
public class DailyLeadProcessorTest {

    @testSetup
    static void setup() {
        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            leads.add(new Lead(
                FirstName='Test Lead ',
                LastName=String.valueOf(i),
                Company = 'X'
            ));
        }
        insert leads;
    }
    
    static testmethod void testScheduledJob(){
        String CRON_EXP = '0 0 0 ? * * *';
        Test.startTest();
        // Schedule the test job
        String jobId = System.schedule('DailyLeadProcessor',
            CRON_EXP,
            new DailyLeadProcessor());
        Test.stopTest();
    }
}