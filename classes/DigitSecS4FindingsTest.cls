@isTest
public with sharing class DigitSecS4FindingsTest {
    @isTest
    public static void S4FindingsTest() {

        // Start Test
        
        test.startTest();
        JSONParser parser = JSON.createParser('{"scanId":["607cd8c250616c02d82b28c9"],"severity":"critical","screenshots":[],"remediationguidance":["Review all the objects that have guest access enabled and make the internal objects private.","Go to Setup > Security > Sharing Settings > click on Edit > select Private from the Default External Access column."],"isnew":true,"status":"active","traces":[],"_id":"607cd8c750616c02d82b28ca","orgId":"6025d7bc2a8bd11a5e18fbfc","codesnippets":"581 objects are exposed on the internet via Guest Access","exploits":"(AAkPay__Bank_Feed_Criteria__c) has been given (ReadWrite) permissions to public,(AAkPay__Import_File_Mapping__c) has been given (ReadWrite) permissions to public,(APXTConga4__Conga_Email_Template__c) has been given (ReadWrite) permissions to public,(APXTConga4__Conga_Template__c) has been given (ReadWrite) permissions to public","line":0,"col":0,"filename":"Salesforce Objects","issuetype":"SFDC_GUEST_ACCESS","founddate":"2021-04-19T01:11:35.360Z","updateddate":"2021-04-19T01:11:35.360Z","severityid":0,"issue":"Objects Exposed on the Internet","description":"A Guest User is a special type of user that you use in conjunction with a Force.com site or Salesforce Community that allows you to build functions for external users who don’t have full licenses to your Salesforce org. The Guest User governs the permissions for external users when they interact with a Site or Community page prior to logging into the Site or Community. Your Salesforce data is at risk of being exposed on the internet as you have given public access to your Salesforce objects.","assigned":null,"hash":"79e19d8412bf86ac4420a0daf6fa827a1db65ef4","history":[],"comments":[],"__v":0}');
        DigitSecS4Findings createFindings = new DigitSecS4Findings(parser);
        //End Test

        test.stopTest();
        

    }
}