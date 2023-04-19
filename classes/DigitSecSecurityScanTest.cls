@isTest
public with sharing class DigitSecSecurityScanTest {

    @isTest
    public static void SecurityScanTest() {
        //Start test

        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        HTTPResponse res = DigitSecSecurityScan.getSarifFile('61170ff22c21461facabdb9b','U2FsdGVkX1+wwW1HmSbt4135As9eDJgj5SnnkeoTSBJD1tkLn2Tx8fhKOOLIpYTEFVjaw9DNUSltvX+s9E3mC4Hf2og9nZoWacw67Fh0wowMZB6tIhl/FbpJq14Xq28Ba+JwkNLEsjLw6JB5q/o8EsVg/TkA0a837Zs6j7mHS6To7tPvtEtxmAfaFyr3QTKnnURJBvMRynygDiyacjjqOR19/P1p3b9LHmamMtZ0SVkiW+oMGtNMNiNnVmf6fsGETZIsz9bI87dbkNQIr75T6nuzWj36FZzmJfTRbz1xtfwPtMmedzckTkd5C1QHQL4qbBTpDPV0PnnAWMaZf/UuQfGSW3+ycrjvq/13YxZLAHUcsCyRgj+unCZ+PKhKBNGvXqD5jOV+1a7g8BPxoGIdEQ==');
        res = DigitSecSecurityScan.getAllFindings('61170ff22c21461facabdb9b','U2FsdGVkX1+wwW1HmSbt4135As9eDJgj5SnnkeoTSBJD1tkLn2Tx8fhKOOLIpYTEFVjaw9DNUSltvX+s9E3mC4Hf2og9nZoWacw67Fh0wowMZB6tIhl/FbpJq14Xq28Ba+JwkNLEsjLw6JB5q/o8EsVg/TkA0a837Zs6j7mHS6To7tPvtEtxmAfaFyr3QTKnnURJBvMRynygDiyacjjqOR19/P1p3b9LHmamMtZ0SVkiW+oMGtNMNiNnVmf6fsGETZIsz9bI87dbkNQIr75T6nuzWj36FZzmJfTRbz1xtfwPtMmedzckTkd5C1QHQL4qbBTpDPV0PnnAWMaZf/UuQfGSW3+ycrjvq/13YxZLAHUcsCyRgj+unCZ+PKhKBNGvXqD5jOV+1a7g8BPxoGIdEQ==');
        res = DigitSecSecurityScan.getScan('61170ff22c21461facabdb9b','','U2FsdGVkX1+wwW1HmSbt4135As9eDJgj5SnnkeoTSBJD1tkLn2Tx8fhKOOLIpYTEFVjaw9DNUSltvX+s9E3mC4Hf2og9nZoWacw67Fh0wowMZB6tIhl/FbpJq14Xq28Ba+JwkNLEsjLw6JB5q/o8EsVg/TkA0a837Zs6j7mHS6To7tPvtEtxmAfaFyr3QTKnnURJBvMRynygDiyacjjqOR19/P1p3b9LHmamMtZ0SVkiW+oMGtNMNiNnVmf6fsGETZIsz9bI87dbkNQIr75T6nuzWj36FZzmJfTRbz1xtfwPtMmedzckTkd5C1QHQL4qbBTpDPV0PnnAWMaZf/UuQfGSW3+ycrjvq/13YxZLAHUcsCyRgj+unCZ+PKhKBNGvXqD5jOV+1a7g8BPxoGIdEQ==');
        

        Test.startTest();
        try{
        DigitSecFinding__c dsf = DigitSecSecurityScan.getCopadoFindings('{"exploit":"","traces":"<br><br>↓<br><b>UserClass</b> Apex_CRUD_False_Positive2 ( <i>classes/Apex_CRUD_False_Positive2.cls </i> Line: 1 Col: 27 )<br><b>public with sharing class Apex_CRUD_False_Positive2<b><br><br>↓<br><b>Method</b> Crud3 ( <i>classes/Apex_CRUD_False_Positive2.cls </i> Line: 6 Col: 26 )Parameters: <var>operation</var> ( Type: String )Parameters: <var>hash</var> ( Type: String )Parameters: <var>profile_key</var> ( Type: Id )<br><b>String Crud3(String operation, String hash, Id profile_key)<b><br><br>↓<br><b>Assignment</b> generatedCode.Name ( <i>classes/Apex_CRUD_False_Positive2.cls </i> Line: 8 Col: 3 )<br><b>generatedCode.Name=MetadataService<b><br><br>↓<br><b>If-Else Block</b> condition taken (<i> classes/Apex_CRUD_False_Positive2.cls </i> Line: 9 Col: 3 )<br><b>Schema.SObjectType.Document.isCreateable()<b><br><br>↓<br><b>If-Else Block</b> condition not taken (<i> classes/Apex_CRUD_False_Positive2.cls </i> Line: 10 Col: 4 )<br><b>generatedCode.Id==null<b><br><br>↓<br><b>DmlUpdateStatement</b> generatedCode ( <i>classes/Apex_CRUD_False_Positive2.cls </i> Line: 13 Col: 5 )<br><b>update generatedCode<b><br>","description":"Authorization, or access control, is a way of mediating access to resources and application functionality based on the identity of a user. Anytime a user can gain access to a resource that is denied to their role, they have performed authorization bypass. There are countless ways authentication bypass can occur. In this case, the user is able to execute a Read, Update, or Delete (CRUD) function in Apex code without their permission being validated correctly. Authorization Bypass occurs when user permissions are not validated prior to executing a Create, Read, Update, or Delete (CRUD) function in Apex code.","issue":"Authorization Bypass","filename":"classes/Apex_CRUD_False_Positive2.cls","line":13,"col":5,"status":"active","severity":"high","remediationguidance":"PGI+IDEuIDwvYj5Vc2VyIHBlcm1pc3Npb25zIHNob3VsZCBhbHdheXMgYmUgdmFsaWRhdGVkIGJlZm9yZSBhIENSVUQgZnVuY3Rpb24gaXMgZXhlY3V0ZWQgaW4gQXBleCBjb2RlLiBUaGlzIHdheSwgaWYgdGhlIHVzZXIgZG9lcyBub3QgaGF2ZSB0aGUgY29ycmVjdCBwZXJtaXNzaW9ucyBmb3Igd2hhdCB0aGV5IGFyZSB0cnlpbmcgdG8gZG8sIHRoZXkgd2lsbCBub3cgYmUgYWxsb3dlZCB0byBwcm9jZWVkLjxicj48Yj4gMi4gPC9iPkltcGxlbWVudCBhY2Nlc3MgY29udHJvbCBjaGVja3Mgc3VjaCBhcyBpc0FjY2Vzc2libGUoKSBwcmlvciB0byBTZWxlY3QuIGlzQWNjZXNzaWJsZSgpIGNoZWNrcyB0byBzZWUgaWYgdGhlIHVzZXIgd2hvIGlzIHRyeWluZyB0byBzZWxlY3Qgc29tZXRoaW5nIGhhcyBwZXJtaXNzaW9ucyB0byBhY2Nlc3MgdGhhdCBpbmZvcm1hdGlvbi48YnI+PGI+IDMuIDwvYj5JbXBsZW1lbnQgYWNjZXNzIGNvbnRyb2wgY2hlY2tzIHN1Y2ggYXMgaXNDcmVhdGVhYmxlKCkgcHJpb3IgdG8gaW5zZXJ0LiBpc0NyZWF0ZWFibGUoKSBjaGVja3MgdG8gc2VlIGlmIHRoZSB1c2VyIHdobyBpcyB0cnlpbmcgdG8gaW5zZXJ0IHNvbWV0aGluZyBpcyBhbGxvd2VkIHRvIGluc2VydCB0aGF0IHR5cGUgb2YgaW5mb3JtYXRpb24vb2JqZWN0Ljxicj48Yj4gNC4gPC9iPkltcGxlbWVudCBhY2Nlc3MgY29udHJvbCBjaGVja3Mgc3VjaCBhcyBpc1VwZGF0ZWFibGUoKSBwcmlvciB0byB1cGRhdGUuIGlzVXBkYXRlYWJsZSgpIGNoZWNrcyB0byBzZWUgaWYgdGhlIHVzZXIgd2hvIGlzIHRyeWluZyB0byB1cGRhdGUgc29tZXRoaW5nIGlzIGFsbG93ZWQgdG8gZG8gc28uPGJyPjxiPiA1LiA8L2I+SW1wbGVtZW50IGFjY2VzcyBjb250cm9sIGNoZWNrcyBzdWNoIGFzIGlzRGVsZXRlYWJsZSgpIHByaW9yIHRvIGRlbGV0ZS4gaXNEZWxldGVhYmxlKCkgY2hlY2tzIHRvIHNlZSBpZiB0aGUgdXNlciB3aG8gaXMgdHJ5aW5nIHRvIGRlbGV0ZSBzb21ldGhpbmcgaXMgYWxsb3dlZCB0byBkbyBzby48YnI+PGI+IDYuIDwvYj5Db2RlIFNuaXBwZXQ6IGlmKFNjaGVtYS5zT2JqZWN0VHlwZS5DYXNlLmlzQ3JlYXRlYWJsZSgpKSB7aW5zZXJ0IFNlY3VyaXR5U2NhbkNhc2U7fTxicj4="}','00B4R00000B2AgKUAV');
        copado__Result__c CopadoResult = DigitSecSecurityScan.getResultObject('{"Critical":4,"High":108,"Medium":192,"Low":42,"Info":0,"status":"completed","autoscan":false}','a284R000003nBkVQAU','scanId');
        }catch(Exception e)
        {}
        
        //Test.setMock(HttpCalloutMock.class, new MockHttpResponseFindings());
        //List<DigitSecFinding__c> s4f = DigitSecSecurityScan.getCopadoFindings('[{\"exploit\":\"\",\"traces\":\"<br><br>↓<br><b>UserClass</b> ApexCRUD_False_Positive1 ( <i>classes/ApexCRUD_False_Positive1.cls </i> Line: 1 Col: 27 )<br><b>public with sharing class ApexCRUD_False_Positive1<b><br><br>↓<br><b>Method</b> followRecord ( <i>classes/ApexCRUD_False_Positive1.cls </i> Line: 7 Col: 27 )Parameters: <var>recordId</var> ( Type: String )Parameters: <var>isFollowed</var> ( Type: Boolean )<br><b>Boolean followRecord(String recordId, Boolean isFollowed)<b><br><br>↓<br><b>Parameter</b> recordId ( <i>classes/ApexCRUD_False_Positive1.cls </i> Line: 7 Col: 47 )<br>↓<br><b>If-Else Block</b> condition taken (<i> classes/ApexCRUD_False_Positive1.cls </i> Line: 8 Col: 13 )<br><b>!isFollowed<b><br><br>↓<br><b>VarDecl </b> entitysubscription ( <i>classes/ApexCRUD_False_Positive1.cls </i> Line: 9 Col: 36 )Parameters: <var>entitysubscription</var> ( Type: EntitySubscription )<br><b>EntitySubscription entitysubscription = UserInfo.getUserId()<b><br><br>↓<br><b>If-Else Block</b> condition taken (<i> classes/ApexCRUD_False_Positive1.cls </i> Line: 10 Col: 17 )<br><b>Schema.SObjectType.EntitySubscription.isCreateable()&&Schema.SObjectType.EntitySubscription.fields.ParentId.isCreateable()&&Schema.SObjectType.EntitySubscription.fields.SubscriberId.isCreateable()<b><br><br>↓<br><b>DmlInsertStatement</b> entitysubscription ( <i>classes/ApexCRUD_False_Positive1.cls </i> Line: 12 Col: 21 )<br><b>insert entitysubscription<b><br>\",\"description\":\"Authorization, or access control, is a way of mediating access to resources and application functionality based on the identity of a user. Anytime a user can gain access to a resource that is denied to their role, they have performed authorization bypass. There are countless ways authentication bypass can occur. In this case, the user is able to execute a Read, Update, or Delete (CRUD) function in Apex code without their permission being validated correctly. Authorization Bypass occurs when user permissions are not validated prior to executing a Create, Read, Update, or Delete (CRUD) function in Apex code.\",\"issue\":\"Authorization Bypass\",\"filename\":\"classes/ApexCRUD_False_Positive1.cls\",\"line\":12,\"col\":21,\"status\":\"active\",\"severity\":\"high\",\"remediationguidance\":\"PGI+IDEuIDwvYj5Vc2VyIHBlcm1pc3Npb25zIHNob3VsZCBhbHdheXMgYmUgdmFsaWRhdGVkIGJlZm9yZSBhIENSVUQgZnVuY3Rpb24gaXMgZXhlY3V0ZWQgaW4gQXBleCBjb2RlLiBUaGlzIHdheSwgaWYgdGhlIHVzZXIgZG9lcyBub3QgaGF2ZSB0aGUgY29ycmVjdCBwZXJtaXNzaW9ucyBmb3Igd2hhdCB0aGV5IGFyZSB0cnlpbmcgdG8gZG8sIHRoZXkgd2lsbCBub3cgYmUgYWxsb3dlZCB0byBwcm9jZWVkLjxicj48Yj4gMi4gPC9iPkltcGxlbWVudCBhY2Nlc3MgY29udHJvbCBjaGVja3Mgc3VjaCBhcyBpc0FjY2Vzc2libGUoKSBwcmlvciB0byBTZWxlY3QuIGlzQWNjZXNzaWJsZSgpIGNoZWNrcyB0byBzZWUgaWYgdGhlIHVzZXIgd2hvIGlzIHRyeWluZyB0byBzZWxlY3Qgc29tZXRoaW5nIGhhcyBwZXJtaXNzaW9ucyB0byBhY2Nlc3MgdGhhdCBpbmZvcm1hdGlvbi48YnI+PGI+IDMuIDwvYj5JbXBsZW1lbnQgYWNjZXNzIGNvbnRyb2wgY2hlY2tzIHN1Y2ggYXMgaXNDcmVhdGVhYmxlKCkgcHJpb3IgdG8gaW5zZXJ0LiBpc0NyZWF0ZWFibGUoKSBjaGVja3MgdG8gc2VlIGlmIHRoZSB1c2VyIHdobyBpcyB0cnlpbmcgdG8gaW5zZXJ0IHNvbWV0aGluZyBpcyBhbGxvd2VkIHRvIGluc2VydCB0aGF0IHR5cGUgb2YgaW5mb3JtYXRpb24vb2JqZWN0Ljxicj48Yj4gNC4gPC9iPkltcGxlbWVudCBhY2Nlc3MgY29udHJvbCBjaGVja3Mgc3VjaCBhcyBpc1VwZGF0ZWFibGUoKSBwcmlvciB0byB1cGRhdGUuIGlzVXBkYXRlYWJsZSgpIGNoZWNrcyB0byBzZWUgaWYgdGhlIHVzZXIgd2hvIGlzIHRyeWluZyB0byB1cGRhdGUgc29tZXRoaW5nIGlzIGFsbG93ZWQgdG8gZG8gc28uPGJyPjxiPiA1LiA8L2I+SW1wbGVtZW50IGFjY2VzcyBjb250cm9sIGNoZWNrcyBzdWNoIGFzIGlzRGVsZXRlYWJsZSgpIHByaW9yIHRvIGRlbGV0ZS4gaXNEZWxldGVhYmxlKCkgY2hlY2tzIHRvIHNlZSBpZiB0aGUgdXNlciB3aG8gaXMgdHJ5aW5nIHRvIGRlbGV0ZSBzb21ldGhpbmcgaXMgYWxsb3dlZCB0byBkbyBzby48YnI+PGI+IDYuIDwvYj5Db2RlIFNuaXBwZXQ6IGlmKFNjaGVtYS5zT2JqZWN0VHlwZS5DYXNlLmlzQ3JlYXRlYWJsZSgpKSB7aW5zZXJ0IFNlY3VyaXR5U2NhbkNhc2U7fTxicj4=\"},{\"exploit\":\"\",\"traces\":\"<br><br>↓<br><b>UserClass</b> ApexCRUD_False_Positive1 ( <i>classes/ApexCRUD_False_Positive1.cls </i> Line: 1 Col: 27 )<br><b>public with sharing class ApexCRUD_False_Positive1<b><br><br>↓<br><b>Method</b> followRecord ( <i>classes/ApexCRUD_False_Positive1.cls </i> Line: 7 Col: 27 )Parameters: <var>recordId</var> ( Type: String )Parameters: <var>isFollowed</var> ( Type: Boolean )<br><b>Boolean followRecord(String recordId, Boolean isFollowed)<b><br><br>↓<br><b>Parameter</b> recordId ( <i>classes/ApexCRUD_False_Positive1.cls </i> Line: 7 Col: 47 )<br>↓<br><b>If-Else Block</b> condition taken (<i> classes/ApexCRUD_False_Positive1.cls </i> Line: 8 Col: 13 )<br><b>!isFollowed<b><br><br>↓<br><b>VarDecl </b> entitysubscription ( <i>classes/ApexCRUD_False_Positive1.cls </i> Line: 9 Col: 36 )Parameters: <var>entitysubscription</var> ( Type: EntitySubscription )<br><b>EntitySubscription entitysubscription = UserInfo.getUserId()<b><br><br>↓<br><b>If-Else Block</b> condition taken (<i> classes/ApexCRUD_False_Positive1.cls </i> Line: 10 Col: 17 )<br><b>Schema.SObjectType.EntitySubscription.isCreateable()&&Schema.SObjectType.EntitySubscription.fields.ParentId.isCreateable()&&Schema.SObjectType.EntitySubscription.fields.SubscriberId.isCreateable()<b><br><br>↓<br><b>DmlInsertStatement</b> entitysubscription ( <i>classes/ApexCRUD_False_Positive1.cls </i> Line: 12 Col: 21 )<br><b>insert entitysubscription<b><br>\",\"description\":\"Authorization, or access control, is a way of mediating access to resources and application functionality based on the identity of a user. Anytime a user can gain access to a resource that is denied to their role, they have performed authorization bypass. There are countless ways authentication bypass can occur. In this case, the user is able to execute a Read, Update, or Delete (CRUD) function in Apex code without their permission being validated correctly. Authorization Bypass occurs when user permissions are not validated prior to executing a Create, Read, Update, or Delete (CRUD) function in Apex code.\",\"issue\":\"Authorization Bypass\",\"filename\":\"classes/ApexCRUD_False_Positive1.cls\",\"line\":12,\"col\":21,\"status\":\"active\",\"severity\":\"high\",\"remediationguidance\":\"PGI+IDEuIDwvYj5Vc2VyIHBlcm1pc3Npb25zIHNob3VsZCBhbHdheXMgYmUgdmFsaWRhdGVkIGJlZm9yZSBhIENSVUQgZnVuY3Rpb24gaXMgZXhlY3V0ZWQgaW4gQXBleCBjb2RlLiBUaGlzIHdheSwgaWYgdGhlIHVzZXIgZG9lcyBub3QgaGF2ZSB0aGUgY29ycmVjdCBwZXJtaXNzaW9ucyBmb3Igd2hhdCB0aGV5IGFyZSB0cnlpbmcgdG8gZG8sIHRoZXkgd2lsbCBub3cgYmUgYWxsb3dlZCB0byBwcm9jZWVkLjxicj48Yj4gMi4gPC9iPkltcGxlbWVudCBhY2Nlc3MgY29udHJvbCBjaGVja3Mgc3VjaCBhcyBpc0FjY2Vzc2libGUoKSBwcmlvciB0byBTZWxlY3QuIGlzQWNjZXNzaWJsZSgpIGNoZWNrcyB0byBzZWUgaWYgdGhlIHVzZXIgd2hvIGlzIHRyeWluZyB0byBzZWxlY3Qgc29tZXRoaW5nIGhhcyBwZXJtaXNzaW9ucyB0byBhY2Nlc3MgdGhhdCBpbmZvcm1hdGlvbi48YnI+PGI+IDMuIDwvYj5JbXBsZW1lbnQgYWNjZXNzIGNvbnRyb2wgY2hlY2tzIHN1Y2ggYXMgaXNDcmVhdGVhYmxlKCkgcHJpb3IgdG8gaW5zZXJ0LiBpc0NyZWF0ZWFibGUoKSBjaGVja3MgdG8gc2VlIGlmIHRoZSB1c2VyIHdobyBpcyB0cnlpbmcgdG8gaW5zZXJ0IHNvbWV0aGluZyBpcyBhbGxvd2VkIHRvIGluc2VydCB0aGF0IHR5cGUgb2YgaW5mb3JtYXRpb24vb2JqZWN0Ljxicj48Yj4gNC4gPC9iPkltcGxlbWVudCBhY2Nlc3MgY29udHJvbCBjaGVja3Mgc3VjaCBhcyBpc1VwZGF0ZWFibGUoKSBwcmlvciB0byB1cGRhdGUuIGlzVXBkYXRlYWJsZSgpIGNoZWNrcyB0byBzZWUgaWYgdGhlIHVzZXIgd2hvIGlzIHRyeWluZyB0byB1cGRhdGUgc29tZXRoaW5nIGlzIGFsbG93ZWQgdG8gZG8gc28uPGJyPjxiPiA1LiA8L2I+SW1wbGVtZW50IGFjY2VzcyBjb250cm9sIGNoZWNrcyBzdWNoIGFzIGlzRGVsZXRlYWJsZSgpIHByaW9yIHRvIGRlbGV0ZS4gaXNEZWxldGVhYmxlKCkgY2hlY2tzIHRvIHNlZSBpZiB0aGUgdXNlciB3aG8gaXMgdHJ5aW5nIHRvIGRlbGV0ZSBzb21ldGhpbmcgaXMgYWxsb3dlZCB0byBkbyBzby48YnI+PGI+IDYuIDwvYj5Db2RlIFNuaXBwZXQ6IGlmKFNjaGVtYS5zT2JqZWN0VHlwZS5DYXNlLmlzQ3JlYXRlYWJsZSgpKSB7aW5zZXJ0IFNlY3VyaXR5U2NhbkNhc2U7fTxicj4=\"} ]', 'test');
        

        //Set up
        List<DigitSecSecurityScan.FlowInputs> requests = new List<DigitSecSecurityScan.FlowInputs>();
        DigitSecSecurityScan.FlowInputs request = new DigitSecSecurityScan.FlowInputs();
        request.userstoryId = 'a1Z5e000006a1cSEAQ';
        request.scanId = '61170ff22c21461facabdb9b';
        request.jwt = 'test';
        request.orgId = '6113f7c8c9a8407dc62fef02';
        request.savetoLocalObject = true;
        request.resultobjectId = 'a1l5e000001AakdAAC';
        requests.add(request);

        DigitSecSecurityScan.DigitSecSecurityScan(requests);
        

        
        
        
        
        // Call the method
        

        // List<Attachment> results = [SELECT id FROM Attachment where ParentId=:task.Id LIMIT 1];
        
        test.stopTest();
    }
     class MockHttpResponseGenerator implements HttpCalloutMock {
        // Implement this interface method
        public HTTPResponse respond(HTTPRequest req) {
            // Optionally, only send a mock response for a specific endpoint
            // and method.
            // Create a fake response
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            res.setBody('{"example":"test"}');
            res.setStatusCode(200);
            return res;
        }
    }
    
    class MockHttpResponseFindings implements HttpCalloutMock {
        // Implement this interface method
        public HTTPResponse respond(HTTPRequest req) {
            // Optionally, only send a mock response for a specific endpoint
            // and method.
            // Create a fake response
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            res.setBody('[{}]');
            res.setStatusCode(200);
            return res;
        }
    }
}