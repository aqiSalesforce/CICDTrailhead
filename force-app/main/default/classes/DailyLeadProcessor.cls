public class DailyLeadProcessor implements Schedulable{

    public void execute(SchedulableContext ctx) {
        List<Lead> leads = [SELECT Id, LeadSource
            FROM Lead
            WHERE LeadSource = ''];
        
        if(!leads.isEmpty()){
            for(Lead lead : leads){
                lead.LeadSource = 'Dreamforce';
            }
            
            update leads;
        }
    }
}