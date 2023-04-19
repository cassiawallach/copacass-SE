public with sharing class DigitSecgetCommit {

    @TestVisible
    public class FlowInputs {
    @InvocableVariable public String parentId;  
    }

    @TestVisible
    public class FlowOutputs{
        @InvocableVariable public String metadata;
    }
    
    @InvocableMethod(label='DigitSec Security Scan Commit' description='Get Last Commit for the DigitSec Security Scan using S4' category='S4')
    public static List<FlowOutputs> DigitSecgetCommit(List<FlowInputs> params) {
        List<FlowOutputs> result = new List<FlowOutputs>();
        if(Schema.sObjectType.Attachment.isAccessible())
        {   
            Attachment att=[Select Id, ParentId, Name, body, ContentType From Attachment where Id=:params[0].parentId limit 1];
            Blob MyBlob=att.body;
            String Contents = MyBlob.toString();
            FlowOutputs out = new FlowOutputs();
            out.metadata = EncodingUtil.base64Encode(MyBlob);
            //out.metadata = EncodingUtil.base64Decode(Contents).toString();
            result.add(out);
        }
        return result;

    }
    
}