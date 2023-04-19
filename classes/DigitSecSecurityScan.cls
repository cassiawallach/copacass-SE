public with sharing class DigitSecSecurityScan {
    
    @TestVisible
    public class FlowInputs {
    @InvocableVariable public String userstoryId;
    @InvocableVariable public String scanId;
    @InvocableVariable public String jwt;
    @InvocableVariable public String orgId;
    @InvocableVariable public Boolean savetoLocalObject;
    @InvocableVariable public String resultobjectId;    
}

@InvocableMethod(label='DigitSec Security Scan' description='DigitSec Security Scan using S4' category='S4')
public Static void DigitSecSecurityScan(List<FlowInputs> params) {
  
      /* S4 Setup */
    String xaccesstoken = params[0].jwt;
    String orgId = params[0].orgId;
    String scanId = params[0].scanId;
    String resultObject = '';
    String resultobjectId = '';
    resultobjectId = params[0].resultobjectId;
    Boolean savetoLocalObject = params[0].savetoLocalObject;
    resultObject = params[0].userstoryId;
    List<DigitSecFinding__c> s4flist = new List<DigitSecFinding__c>();
    

        // Create HTTP request to send.
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        HTTPResponse response;
            /* S4 Get All Findings */
            /*HTTPResponse response = getSarifFile(scanId, xaccesstoken);
            Blob body = response.getBodyAsBlob();
            String filename = 'SecurityScan-SARIF-'+ scanId + '.sarif.json';
            Attachment att = new Attachment(Name = filename, Body = body, ContentType = 'application/sarif+json', ParentId=resultobjectId);*/
              
            if(savetoLocalObject == true)
            {
                response = getAllFindings(scanId, xaccesstoken);
                JSONParser parser = JSON.createParser(response.getBody());
                while (parser.nextToken() != null) {
                System.debug('Past Token: ' + parser.getCurrentToken());
                if (parser.getCurrentToken() == JSONToken.START_ARRAY ) {
                    System.debug('Current Token: ' + parser.getCurrentToken());
                    while (parser.nextToken() != null && parser.getCurrentToken() != JSONToken.END_ARRAY) {
                        s4flist.add(getCopadoFindings(parser.getText(), resultobjectId));
                    }
                }
            }
                
                
            }

            copado__Result__c resultInfo;
            response = getScan(scanId, orgId, xaccesstoken);
            resultInfo = getResultObject(response.getBody(), resultobjectId, scanId);

            if(resultInfo != null && Schema.sObjectType.copado__Result__c.isUpdateable() && Schema.sObjectType.copado__User_Story__c.isUpdateable()){
                copado__User_Story__c userStory = [SELECT Id FROM copado__User_Story__c WHERE Id =:resultObject WITH SECURITY_ENFORCED LIMIT 1];
                userStory.DigitSec_Scan_Result__c = resultInfo.copado__Status__c;
                userStory.DigitSec_Security_Scan__c = resultInfo.Id;
                update userStory;
                update resultInfo;
            }
            /*if(Schema.sObjectType.Attachment.isCreateable())
            {
                insert att;
            }*/
            if(Schema.sObjectType.DigitSecFinding__c.isCreateable()){
                insert s4flist;
            }
}

public static copado__Result__c getResultObject(String responsebody, String resultobjectId, String scanId){
    copado__Result__c resultInfo;
    JSONParser parser = JSON.createParser(responsebody);
    while (parser.nextToken() != null) {
    if (parser.getCurrentToken() == JSONToken.START_OBJECT) {
        s4digitsecscan scan = (s4digitsecscan)parser.readValueAs(s4digitsecscan.class);
        if(Schema.sObjectType.copado__Result__c.isAccessible())
        {
            try{
            resultInfo = [SELECT Id FROM copado__Result__c WHERE Id = :resultobjectId LIMIT 1];
            if(resultInfo !=null){
                try{
                if(scan.isSecurityGatePassed){
                    resultInfo.copado__Status__c = 'Success';
                }else
                {
                    resultInfo.copado__Status__c = 'Failed';
                }
                }catch(Exception ex)
                {
                    resultInfo.copado__Status__c = 'Success';
                }
                resultInfo.copado__Job_Id__c = scanId;
                resultInfo.copado__Description__c = '<b>DigitSec Security Scan Summary: </b><br> Critical: <b>' + scan.Critical + ' </b><br> High: <b>' +  scan.High + ' </b><br>  Medium: <b>' + scan.Medium + ' </b><br> Low: <b>' + scan.Low + '</b><br> Security Gate Passed: <b> ' + scan.isSecurityGatePassed +'</b>'; 
                resultInfo.copado__End_Time__c = DateTime.now();
                resultInfo.copado__Link__c = 'https://s4.digitsec.com/index#scan/'+scanId; 
            }
        }catch(Exception ex)
        {
            resultInfo = null;
        }
        }
        }
    }
return resultInfo;
}

public static DigitSecFinding__c getCopadoFindings(String responsebody, String resultObject)
{
        try{
        DigitSecS4Findings findings =  DigitSecS4Findings.parse(responsebody);
        DigitSecFinding__c s4f = new DigitSecFinding__c();
                        String temp = '';
                        if(findings.filename != 'NA'){
                        temp = findings.issue + ' @ ' + findings.filename;
                        }else {
                        temp = findings.issue;  
                        }
                        if(temp.length() > 80){temp = temp.SubString(0,79);}
                        s4f.Name = temp;
                        if(findings.filename != 'NA'){
                        temp = findings.issue + ' @ ' + findings.filename + ' line: ' + findings.line;
                        }else
                        {
                        temp = findings.issue;
                        }
                        if(temp.length() > 255){temp = temp.substring(0,255);}
                        s4f.Issue__c = temp;
                        temp = findings.description;
                        if(temp.length() >32768){temp = temp.substring(0,32768);}
                        s4f.Description__c = temp;
                        s4f.Severity__c = findings.severity.touppercase();
                        temp = EncodingUtil.base64Decode(findings.remediationguidance).toString();
                        if(temp.length() >32768){temp = temp.substring(0,32768);}
                        s4f.Remediation__c = temp;
                        s4f.Status__c = findings.status;
                        temp = findings.traces;
                        if(temp.length() >32768){temp = temp.substring(0,32768);}
                        s4f.Vulnerability_Trace__c = temp;
                        temp = findings.exploit;
                        if(temp.length() >32768){temp = temp.substring(0,32768);}
                        s4f.Exploit__c = temp;
                        s4f.DigitSecResult__c  = resultObject;
                        return s4f;
                    }catch(Exception ex)
                    {
                        return null;
                    }
}

public static HTTPResponse getSarifFile(String scanId, String xaccesstoken)
{
        // Create HTTP request to send.
        Http http = new Http();
        HttpRequest request = new HttpRequest();

        /* S4 Get All Findings */
        request.setEndPoint('callout:DigitSecCredentials/scan/'+scanId+'/sarif/download');
        request.setMethod('GET');
        request.setHeader('Content-Type','application/json;charset=UTF-8');
        request.setHeader('x-access-token', xaccesstoken);
        request.setTimeout(120000);
        HTTPResponse response = http.send(request);
        return response;
}

public static HTTPResponse getAllFindings(String scanId, String xaccesstoken)
{
        // Create HTTP request to send.
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        /* S4 Get All Findings and Store as a Related Object in Copado */
        request.setEndPoint('callout:DigitSecCredentials/scan/'+scanId+'/copadofinding/download');
        request.setMethod('GET');
        request.setHeader('Content-Type','application/json;charset=UTF-8');
        request.setHeader('x-access-token', xaccesstoken);
        request.setTimeout(120000);
    return http.send(request);
}

public static HTTPResponse getScan(String scanId, String orgId, String xaccesstoken)
{
        // Create HTTP request to send.
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndPoint('callout:DigitSecCredentials/scan/list/status');
                request.setMethod('POST');
                request.setHeader('Content-Type','application/json;charset=UTF-8');
                request.setHeader('x-access-token', xaccesstoken);
                request.setBody('{"orgId": "'+orgId+'", "scanId":"'+scanId+'"}'); 
                request.setTimeout(120000);
                return http.send(request);
}

}