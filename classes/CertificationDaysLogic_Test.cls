@isTest(SeeAllData=true)
public class CertificationDaysLogic_Test {

    //@TestSetup
    //static void makeData() {}      

    @isTest
    public static void CertificationDaysLogic_TestCases() {
        
        Test.startTest();
        
		//List<Academy_Certification__c> ACList = [SELECT id FROM Academy_Certification__c];
		Academy_Certification__c AC = [SELECT id, 
                                       name, 
                                       Certification_Program__c, 
                                       Certification_Student__c,
                                       Status__c,
                                       Expiration_Date__c
                                       FROM Academy_Certification__c 
                                       LIMIT 1];

        Academy_Certification__c ACClone = AC.clone(false, true, false, false);
        insert ACClone;
        
        update AC;
//        system.assert.equals();
        
        Test.stopTest();
    }
}

/*        Test.startTest();
        

		for(Academy_Certification__c AC : ACList) {
            
        }
        update leads;
        List<Lead> updatedLeads = [SELECT Rating FROM Lead];
        for(Lead lead : updatedLeads) {
            System.assertEquals(RATING_COLD, lead.Rating, 'Lead rating should be: ' + RATING_COLD);
        }

        Test.stopTest();
*/