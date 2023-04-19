public class AccountManager {
    
    public static void createAccount(String accountName, String accountType) {
        Account newAccount = new Account();
        newAccount.Name = accountName;
        newAccount.Type = accountType;
        insert newAccount;
    }
    
    public static void updateAccount(String accountId, String accountName, String accountType) {
        Account accountToUpdate = [SELECT Id, Name, Type FROM Account WHERE Id = :accountId];
        accountToUpdate.Name = accountName;
        accountToUpdate.Type = accountType;
        update accountToUpdate;
    }
    
    public static void deleteAccount(String accountId) {
        Account accountToDelete = [SELECT Id FROM Account WHERE Id = :accountId];
        delete accountToDelete;
    }
}