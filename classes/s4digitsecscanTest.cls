@isTest
public with sharing class s4digitsecscanTest {

    @isTest
    public static void s4scanTest() {

        //New Comment
        // Start Test
        test.startTest();
        JSONParser parser = JSON.createParser('{"Critical":4,"High":108,"Medium":192,"Low":42,"Info":0,"status":"completed","autoscan":false,"Findings_new":false,"scan_type":"Static","repo_id":null,"repo_name":"","isSecurityGatePassed":true,"source":null,"scan_log":[],"_id":"611573f53d876fc5732e7e0c","Org_Id":"6100a4131735df45df80f191","Created_date":"2021-08-12T19:18:13.610Z","Initiated_Scan_date":"2021-08-12T19:18:13.610Z","__v":0,"size":126904564,"static_libraries":{"unpackaged":{"types":[{"name":"ApexClass","members":["*"]},{"name":"LightningComponentBundle","members":["*"]},{"name":"ApexPage","members":["*"]},{"name":"Certificate","members":["*"]},null,{"name":"Settings","members":["*"]},{"name":"CspTrustedSite","members":["*"]},{"name":"RemoteSiteSetting","members":["*"]},{"name":"CorsWhitelistOrigin","members":["*"]},{"name":"StaticResource","members":["*"]},{"name":"AuraDefinitionBundle","members":["*"]}]},"packageNames":[],"apiVersion":"45.0"}},{"Critical":4,"High":107,"Medium":192,"Low":42,"Info":0,"status":"completed","autoscan":false,"Findings_new":false,"scan_type":"Static","repo_id":null,"repo_name":"","isSecurityGatePassed":null,"source":null,"scan_log":[],"_id":"6112b7eb6a0a3702fdcd7f5f","Org_Id":"6100a4131735df45df80f191","Created_date":"2021-08-10T17:31:23.231Z","Initiated_Scan_date":"2021-08-10T17:31:23.231Z","__v":0,"size":126894449,"static_libraries":{"unpackaged":{"types":[{"name":"ApexClass","members":["*"]},{"name":"LightningComponentBundle","members":["*"]},{"name":"ApexPage","members":["*"]},{"name":"Certificate","members":["*"]},null,{"name":"Settings","members":["*"]},{"name":"CspTrustedSite","members":["*"]},{"name":"RemoteSiteSetting","members":["*"]},{"name":"CorsWhitelistOrigin","members":["*"]},{"name":"StaticResource","members":["*"]},{"name":"AuraDefinitionBundle","members":["*"]}]},"packageNames":[],"apiVersion":"45.0"}},{"Critical":4,"High":107,"Medium":192,"Low":42,"Info":0,"status":"completed","autoscan":false,"Findings_new":false,"scan_type":"Static","repo_id":null,"repo_name":"","isSecurityGatePassed":null,"source":null,"scan_log":[],"_id":"6112ac45bf0f21fb0f258286","Org_Id":"6100a4131735df45df80f191","Created_date":"2021-08-10T16:41:41.982Z","Initiated_Scan_date":"2021-08-10T16:41:41.982Z","__v":0,"size":126894001,"static_libraries":{"unpackaged":{"types":[{"name":"ApexClass","members":["*"]},{"name":"LightningComponentBundle","members":["*"]},{"name":"ApexPage","members":["*"]},{"name":"Certificate","members":["*"]},null,{"name":"Settings","members":["*"]},{"name":"CspTrustedSite","members":["*"]},{"name":"RemoteSiteSetting","members":["*"]},{"name":"CorsWhitelistOrigin","members":["*"]},{"name":"StaticResource","members":["*"]},{"name":"AuraDefinitionBundle","members":["*"]}]},"packageNames":[],"apiVersion":"45.0"}}');
        s4digitsecscan createScan = new s4digitsecscan(parser);
        //End Test
        test.stopTest();
        

    }
}