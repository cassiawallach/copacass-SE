@isTest
private class AccountManagerTest {
    
    @isTest static void testCreateAccount() {
        AccountManager.createAccount('Test Account', 'Prospect');
        List<Account> accounts = [SELECT Id, Name, Type FROM Account WHERE Name = 'Test Account'];
        System.assertEquals(1, accounts.size());
        System.assertEquals('Prospect', accounts[0].Type);
    }
    
    @isTest static void testUpdateAccount() {
        AccountManager.createAccount('Test Account', 'Prospect');
        List<Account> accounts = [SELECT Id, Name, Type FROM Account WHERE Name = 'Test Account'];
        Account accountToUpdate = accounts[0];
        AccountManager.updateAccount(accountToUpdate.Id, 'Updated Account', 'Customer');
        accounts = [SELECT Id, Name, Type FROM Account WHERE Id = :accountToUpdate.Id];
        System.assertEquals('Updated Account', accounts[0].Name);
        System.assertEquals('Customer', accounts[0].Type);
    }
    
    @isTest static void testDeleteAccount() {
        AccountManager.createAccount('Test Account', 'Prospect');
        List<Account> accounts = [SELECT Id, Name, Type FROM Account WHERE Name = 'Test Account'];
        Account accountToDelete = accounts[0];
        AccountManager.deleteAccount(accountToDelete.Id);
        accounts = [SELECT Id, Name, Type FROM Account WHERE Id = :accountToDelete.Id];
        System.assertEquals(0, accounts.size());
    }
}