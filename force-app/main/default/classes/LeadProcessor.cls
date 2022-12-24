public class LeadProcessor implements
    Database.Batchable<sObject>{
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT ID FROM Lead'
        );
    }
    public void execute(Database.BatchableContext bc, List<Lead> scope){
        for (Lead lead : scope){
            lead.LeadSource = 'Dreamforce';
        }
        update scope;
    }
    public void finish(Database.BatchableContext bc){
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors,
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
    }
}