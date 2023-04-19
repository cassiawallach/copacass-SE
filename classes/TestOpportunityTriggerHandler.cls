@isTest
public class TestOpportunityTriggerHandler {
    
    @isTest
    public static void unitTestkrobinson(){
        UserRole portalRole = [Select Id From UserRole Where PortalType = 'None' Limit 1];
        Profile profile1 = [Select Id from Profile where name = 'System Administrator'];
        
        User userManager = TestDataFactory.createUser();
        userManager = TestDataFactory.setToAdmin(userManager);
        userManager.UserRoleId = portalRole.Id;
        userManager.Email='krobinson@copatst.com';
        userManager.Username='krobinson@copatst.com';
        Database.insert(userManager);
        
        User oppOwner = TestDataFactory.createUser();
        oppOwner = TestDataFactory.setToAdmin(oppOwner);
        oppOwner.UserRoleId = portalRole.Id;
        oppOwner.managerId = userManager.Id;
        Database.insert(oppOwner);
        
        System.runAs ( oppOwner ) {
            Account ca = TestDataFactory.createAccount('Copado Solutions SL','EUR');
            INSERT ca;
            
            Opportunity o = TestDataFactory.createOpportunity(ca, 'My Opp', 'New Customer');
            o.AccountId=ca.Id;
            o.CloseDate=System.Today();
            o.Main_Problems__c = 'Opp Main problem';
            o.Amount = 100;
            o.LeadSource='Advertisement';
            o.ACV__c = 1234;
            o.SRB__c = 0;
            o.Opportunity_Creation_Role__c  ='Other';
            insert o;
            
            o.SRB__c = 10;
            UPDATE o;
            
            DELETE o;
            checkRecursive.runOnce();
        }
    }
    @isTest
    public static void unitTestForSalesRole(){
        UserRole salesRole = [Select Id,name From UserRole where Name ='Sales Engineer' limit 1];
        User oppOwner = TestDataFactory.createUser();
        oppOwner.UserRoleId = salesRole.Id;
        Database.insert(oppOwner);
        System.runAs ( oppOwner ) {
            Account ca = TestDataFactory.createAccount('Copado Solutions SL','EUR');
            ca.Type = '';
            INSERT ca;
            
            Opportunity o = TestDataFactory.createOpportunity(ca, 'My Opp', 'New Customer');
            o.AccountId=ca.Id;
            o.CloseDate=System.Today();
            o.Opportunity_Creation_Role__c  ='Sales';
            insert o;
            
        }
        
        UserRole salesRole1 = [Select Id,name From UserRole where Name ='Customer Support' limit 1];
        User oppOwner1 = TestDataFactory.createUser();
        oppOwner1.UserRoleId = salesRole1.Id;
        Database.insert(oppOwner1);
        System.runAs ( oppOwner1 ) {
            Account accObj = TestDataFactory.createAccount('Copado Solutions SL','EUR');
            accObj.Type = '';
            INSERT accObj;
            
            Opportunity opp = TestDataFactory.createOpportunity(accObj, 'My Opp', 'New Customer');
            opp.AccountId=accObj.Id;
            opp.CloseDate=System.Today();
            opp.Opportunity_Creation_Role__c  ='Customer';
            insert opp;
            
        }
        UserRole salesRole2 = [Select Id,name From UserRole where Name ='Alliances Team' limit 1];
        User oppOwner2 = TestDataFactory.createUser();
        oppOwner2.UserRoleId = salesRole2.Id;
        Database.insert(oppOwner2);
        System.runAs ( oppOwner2 ) {
            Account accObj1 = TestDataFactory.createAccount('Copado Solutions SL','EUR');
            accObj1.Type = '';
            INSERT accObj1;
            
            Opportunity opp1 = TestDataFactory.createOpportunity(accObj1, 'My Opp', 'New Customer');
            opp1.AccountId=accObj1.Id;
            opp1.CloseDate=System.Today();
            opp1.Opportunity_Creation_Role__c  ='Partner';
            insert opp1;
            
        }
        UserRole salesRole3 = [Select Id,name From UserRole where Name ='Marketing Analyst' limit 1];
        User oppOwner3 = TestDataFactory.createUser();
        oppOwner3.UserRoleId = salesRole3.Id;
        Database.insert(oppOwner3);
        System.runAs ( oppOwner3 ) {
            Account accObj2 = TestDataFactory.createAccount('Copado Solutions SL','EUR');
            accObj2.Type = '';
            INSERT accObj2;
            
            Opportunity opp2 = TestDataFactory.createOpportunity(accObj2, 'My Opp', 'New Customer');
            opp2.AccountId=accObj2.Id;
            opp2.CloseDate=System.Today();
            opp2.Opportunity_Creation_Role__c  ='BDR';
            insert opp2;
            
        }
    }
    @isTest
    public static void unitTestApatel(){
        UserRole portalRole = [Select Id From UserRole Where PortalType = 'None' Limit 1];
        Profile profile1 = [Select Id from Profile where name = 'System Administrator'];
        
        User userManager = TestDataFactory.createUser();
        userManager = TestDataFactory.setToAdmin(userManager);
        userManager.UserRoleId = portalRole.Id;
        userManager.Email='apatel@copatst.com';
        userManager.Username='apatel@copatst.com';
        Database.insert(userManager);
        
        User oppOwner = TestDataFactory.createUser();
        oppOwner = TestDataFactory.setToAdmin(oppOwner);
        oppOwner.UserRoleId = portalRole.Id;
        oppOwner.managerId = userManager.Id;
        Database.insert(oppOwner);
        
        System.runAs ( oppOwner ) {
            Account ca = TestDataFactory.createAccount('Copado Solutions SL','EUR');
            ca.Type = '';
            INSERT ca;
            
            Opportunity o = TestDataFactory.createOpportunity(ca, 'My Opp', 'New Customer');
            o.AccountId=ca.Id;
            o.CloseDate=System.Today();
            o.Main_Problems__c = 'Opp Main problem';
            o.Amount = 100;
            o.LeadSource='Advertisement';
            o.ACV__c = 1234;
            o.SRB__c = 0;
            insert o;
            
            o.StageName = 'Discovery';
            o.SRB__c = 10;
            UPDATE o;
            
            DELETE o;
            checkRecursive.runOnce();
        }
    }
    @isTest
    public static void unitTestMhill(){
        UserRole portalRole = [Select Id From UserRole Where PortalType = 'None' Limit 1];
        Profile profile1 = [Select Id from Profile where name = 'System Administrator'];
        
        User userManager = TestDataFactory.createUser();
        userManager = TestDataFactory.setToAdmin(userManager);
        userManager.UserRoleId = portalRole.Id;
        userManager.Email='mhill@copatst.com';
        userManager.Username='mhill@copatst.com';
        Database.insert(userManager);
        
        User oppOwner = TestDataFactory.createUser();
        oppOwner = TestDataFactory.setToAdmin(oppOwner);
        oppOwner.UserRoleId = portalRole.Id;
        oppOwner.managerId = userManager.Id;
        Database.insert(oppOwner);
        
        System.runAs ( oppOwner ) {
            Account ca = TestDataFactory.createAccount('Copado Solutions SL','EUR');
            ca.Type = '';
            INSERT ca;
            
            Opportunity o = TestDataFactory.createOpportunity(ca, 'My Opp', 'New Customer');
            o.AccountId=ca.Id;
            o.CloseDate=System.Today();
            o.Main_Problems__c = 'Opp Main problem';
            o.Amount = 100;
            o.LeadSource='Advertisement';
            o.ACV__c = 1234;
            o.SRB__c = 0;
            insert o;
            
            o.NextStep='2';
            o.SRB__c = 10;
            o.OwnerId = userManager.Id;
            UPDATE o;
            
            o.OwnerId = oppOwner.Id;
            UPDATE o;
            
            DELETE o;
            checkRecursive.runOnce();
        }
    }
    @isTest
    public static void unitTestEMEA(){
        test.startTest();
        Id pricebookId = Test.getStandardPricebookId();
        Pricebook2 p2 = new Pricebook2(Name='Test', CurrencyIsoCode='EUR', IsActive=true);
        insert p2;
        
        List<BusinessHours> bhs=[select id from BusinessHours where name LIKE '%GMT%' AND isActive= true limit 1];
        
        Account ca = TestDataFactory.createAccount('Copado Solutions SL','EUR');
        ca.Working_Business_Hours__c = bhs.get(0).Id;
        ca.Type = '';
        INSERT ca;       
        
        List<Opportunity> oppList = new List<Opportunity>();
        Opportunity o = TestDataFactory.createOpportunity(ca, 'My Opp MakeData', 'New Customer');
        o.RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('New').getRecordTypeId();
        o.CloseDate=System.Today();
        o.Main_Problems__c = 'Opp Main problem';
        o.Amount = 100;
        o.LeadSource='Advertisement';
        o.ACV__c = 1234;
        o.SRB__c = 0;
        o.AccountId = ca.Id;
        INSERT o;
        
        checkRecursive.runOnce();
        test.stopTest();
    }
    @isTest
    public static void testROICalculation(){
        Account ca = TestDataFactory.createAccount('Copado Solutions SL','EUR');
        ca.Type = '';
        INSERT ca;       
        
        Opportunity o = TestDataFactory.createOpportunity(ca, 'My Opp MakeData', 'New Customer');
        o.RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('New').getRecordTypeId();
        o.Value_Prop_ID__c = 'test123';
        o.AccountId = ca.Id;
        INSERT o;
        
        DL_VC__VC_Value_Proposition__c roiObj = TestDataFactory.createROICalculation(o.Id);
        Insert roiObj;
    }
    
    @isTest
    public static void testUpdateRenewalACV(){
        Account ca = TestDataFactory.createAccount('Copado Solutions SL','EUR');
        ca.Type = '';
        INSERT ca;   
        
        Contact con = TestDataFactory.createContact(ca.Id, 'MyTestContact');
        insert con;    
        
        Opportunity o = TestDataFactory.createOpportunity(ca, 'My Opp MakeData', 'New Customer');
        o.RecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('New').getRecordTypeId();
        o.Value_Prop_ID__c = 'test123';
        o.AccountId = ca.Id;
        INSERT o;
        test.startTest();
        Id usrId = userinfo.getUserId();
        Date endDate = system.Today().addYears(1);
        SBQQ__Quote__c quote = TestDataFactory.createCPQuote(o);
        quote.SBQQ__SalesRep__c = usrId;
        quote.SBQQ__PrimaryContact__c=con.Id;
        quote.Renewal_ACV__c = 1000;
        insert quote;    
        SBQQ__Quote__c quote1 = TestDataFactory.createCPQuote(o);
        quote1.SBQQ__SalesRep__c = usrId;
        quote1.SBQQ__PrimaryContact__c=con.Id;
        quote1.SBQQ__Primary__c = false;
        quote1.Renewal_ACV__c = 2000;
        insert quote1;  
        quote1.SBQQ__Primary__c = true;
        update quote1; 
        test.stopTest();
    }   
}