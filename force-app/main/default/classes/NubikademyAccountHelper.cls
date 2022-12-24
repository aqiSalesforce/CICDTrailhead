public with sharing class NubikademyAccountHelper {

    public static void fillAccount(List<Account> accounts) {
        if(!accounts.isEmpty()){
            Integer count = 0;
            for(Account acc : accounts){
                count++;
                acc.Name = acc.Name + ' ' + count;
            }
        }
    }
}