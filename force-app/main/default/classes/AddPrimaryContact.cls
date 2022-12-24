public class AddPrimaryContact implements Queueable{

    private Contact contacto;
    private String statusContact;
    public AddPrimaryContact(Contact ct, String status) {
        this.contacto = ct;
        this.statusContact = status;
    }
    public void execute(QueueableContext context) {
        List<Account> accs = [SELECT Id FROM Account WHERE BillingState = : statusContact];
        if(!accs.isEmpty()){
            List<Contact> contactsToInsert = new List<Contact>();
            for(Account acc : accs){
                Contact clonedContact = contacto.clone(false);
                clonedContact.FirstName = 'Contact Test ';
                clonedContact.LastName = acc.Id;
                clonedContact.AccountId = acc.Id;
                contactsToInsert.add(clonedContact);
            }
            
            insert contactsToInsert;
        }
    }
}