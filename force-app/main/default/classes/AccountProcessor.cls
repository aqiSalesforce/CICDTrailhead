public with sharing class AccountProcessor {

    @future
  public static void countContacts(List<Id> recordIds) {
    List<Account> accounts = [Select Id, Name from Account Where Id IN :recordIds];
    // process account records to do awesome stuff
      if(!accounts.isEmpty()){
          Integer count = 0;
          for(Account acc : accounts){
              count++;
              acc.Number_of_contacts__c = count;
          }
          
          update accounts;
      }
  }
}