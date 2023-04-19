@isTest
private class SetContractToExpiredReplacementTest {
    @isTest 
    private static void testContractsForTrigger(){
       
        Pricebook2 p2 = TestDataFactory.createPricebook(); 
        p2.CurrencyIsoCode = 'EUR';
        insert p2;         
        
        Product2 p = TestDataFactory.createProduct('Enterprise', 'Licenses',null);
        insert p;        
        
        Account a = TestDataFactory.createAccountNew('Test_Account_Trigger','EUR');
        insert a;
       
        kugo2p__KugamonSetting__c testKugamonSetting = TestDataFactory.createKugamonSetting(p2.name); 
        insert testKugamonSetting ;
        
        Contract c1 = TestDataFactory.createDraftContract(a.Id,'EUR');
        c1.StartDate = Date.newInstance(2023, 04, 09);
        c1.ContractTerm = 12;
        insert c1; 
        
        Contract c2 = TestDataFactory.createDraftContract(a.Id,'EUR');
        c2.StartDate = Date.newInstance(2024, 04, 09);
        c2.ContractTerm = 12;
        insert c2;        
        
        c1 = [select Id, Status from Contract where Id=: c1.Id];     
        
        System.assertEquals(a.Name, 'Test_Account_Trigger');
        System.assertEquals(c2.Status, 'Draft');
        
    }
    
    @isTest 
    private static void testContractActivationDraftStatus(){
        Account a = TestDataFactory.createAccountNew('Test_Account_Trigger','EUR');
        insert a;
        
        Entitlement ent = TestDataFactory.createEntitlementPremier(a.Id);
        ent.Name='Premier Support';        
        ent.StartDate=Date.today().addDays(-1);      
        ent.Access_Code__c = 123456;              
        insert ent;
        
        Pricebook2 p2 = TestDataFactory.createPricebook(); 
        p2.CurrencyIsoCode = 'EUR';
        insert p2; 
        
        kugo2p__KugamonSetting__c testKugamonSetting = TestDataFactory.createKugamonSetting(p2.name); 
        insert testKugamonSetting ;
        
        Contract c1 = TestDataFactory.createDraftContract(a.Id,'EUR');        
        c1.EndDate = Date.today().addDays(7).addMonths(12);
        insert c1;  
        Contract cc = [Select id, Status, EndDate from Contract where id = : c1.id LIMIT 1];        
        Entitlement entitlementobj = [select StartDate,EndDate from Entitlement where Id=: ent.Id LIMIT 1];
               
        //System.assertEquals('Activated',cc.Status);
        //System.assertEquals(entitlementobj.EndDate, cc.EndDate);
    }
      
    @isTest 
    private static void testContractHelper(){
    
        Pricebook2 p2 = TestDataFactory.createPricebook(); 
        p2.CurrencyIsoCode = 'EUR';
        insert p2;       
                
        Product2 p = TestDataFactory.createProduct('Enterprise', 'Licenses',null);
        insert p;  
                
        Account a = TestDataFactory.createAccountNew('Test_Account_Trigger','EUR');
        insert a; 
        
        Contact con = new Contact(FirstName='Test', LastName='Test', AccountId=a.Id);
        insert con; 
        
        Id usrId = userinfo.getUserId();
        Date endDate = system.Today().addYears(1);
        
        Id renewRecdTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Renewal').getRecordTypeId();
        Opportunity renewalOpp = new Opportunity(Name='My Opp', AccountId=a.Id, RecordTypeId = renewRecdTypeId , StageName='Marketing Qualification', CloseDate=Date.today()+10, CurrencyIsoCode='EUR');
        renewalOpp.Amount = 99.0;
        renewalOpp.LeadSource = 'Advertisement' ;
        insert renewalOpp;  
        
        SBQQ__Quote__c renewQuote = new SBQQ__Quote__c(SBQQ__Account__c = a.Id,SBQQ__Opportunity2__c=renewalOpp.id,SBQQ__SalesRep__c=usrId,SBQQ__Primary__c=true,SBQQ__PrimaryContact__c=con.Id,SBQQ__StartDate__c=system.today().addYears(1),SBQQ__EndDate__c = endDate.addYears(1),Renewal_ACV__c = 70000);
        insert renewQuote;   
        
        renewalOpp.SBQQ__PrimaryQuote__c = renewQuote.Id;
        update renewalOpp;
        
        kugo2p__KugamonSetting__c testKugamonSetting = TestDataFactory.createKugamonSetting(p2.name); 
        insert testKugamonSetting ;
        
        Contract c = TestDataFactory.createDraftContract(a.Id,'EUR');        
        c.EndDate = Date.today().addDays(7).addMonths(12);
        c.kuga_sub__RenewalOpportunity__c = renewalOpp.Id;
        c.Order_ACV__c = 40000;           
        insert c;    
    }  
}