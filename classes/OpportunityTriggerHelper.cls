public with sharing class OpportunityTriggerHelper {

    Public static Map<Id,User> opportunityOwnerMangers;
    Public static Map<Id,User> opportunityOwnerMap;
    public static Map<Id,Opportunity> opportunitiesWithAccount = new Map<Id,Opportunity>();
    public static map<Id,Account> updateCustomerSuccessManagerUsers = new map<id,Account>();
    public static map<Id,Account> accountMap = new map<id,Account>();
    public static Map<Id,contract> contractMap = new Map<Id,contract>();
   
    public static void prepareData(List<sobject> records){        
        Set<string> accountIdSet = New Set<String>();
        Set<string> setOfContractIds = New Set<String>();
        Map<String,opportunity> oppMap = New Map<String,opportunity>();
        Set<String> opportunityOwnerIds = new set<String>();
        for(sObject oppObj : records){
            Opportunity opp = (Opportunity)oppObj;
            
            if(opp.ContractId!= NULL){
                setOfContractIds.add(opp.ContractId);
            }
            accountIdSet.add(opp.AccountId);
            OpportunityOwnerIds.add(opp.OwnerId);
            opp.SRB__c = 0;
            oppMap.put(opp.AccountId,opp );
        }
        if(OpportunityOwnerIds.size()>0){
            opportunityOwnerMangers = new map<Id,User>([SELECT Id,UserRole.Name, ManagerId,Manager.Email FROM USER WHERE ID IN : OpportunityOwnerIds AND ManagerId != '' AND Manager.Email != '']);
            opportunityOwnerMap = new map<Id,User>([SELECT Id,UserRole.Name FROM USER WHERE ID IN : OpportunityOwnerIds AND UserRole.Name != '']);
        }
        if(accountIdSet.Size() > 0 ){
            system.debug('accountIdSet size: ' + accountIdSet.size());
            accountMap = new Map<Id,Account>([SELECT Id, Account_Manager__c,Account_Manager__r.IsActive FROM Account WHERE Id IN :accountIdSet]);
            system.debug('accountMap size: ' + accountMap.size());

            For(Opportunity opp : [Select Id,Name,StageName,ACV__c,SRB__c,AccountId,Account.Type,Account.Customer_Success_Manager__c, Account.Account_Manager__c,Account.Account_Manager__r.IsActive, ContractId,Contract.Has_Premier_Support__c From Opportunity Where AccountId IN:oppMap.keyset() AND StageName='Closed Won']){               
                opportunitiesWithAccount.put(opp.Id,opp);
                If(oppMap.containsKey(opp.AccountId)  && opp.ACV__c!=NULL){
                    oppMap.get(opp.AccountId).SRB__c += opp.ACV__c;
                }

            }
            if(opportunitiesWithAccount.size()>0){
                contractMap=new map<Id,contract>([SELECT Id,Has_Premier_Support__c FROM Contract WHERE Id IN: setOfContractIds ]);
            }
        }
    }
    //update MRR on opportunity
    public static void updateMRR(Opportunity oldOpp,Opportunity newOpp){
        if(newOpp.X1st_Year_ACV_only__c != Null && newOpp.SBQQ__PrimaryQuote__c != Null){
            newOpp.MRR__c  = newOpp.X1st_Year_ACV_only__c/12;
        }
    }
     //update closedate for renewal opportunity
    public static void updateRenewalOpportunityDueDate(Opportunity newOpp){
        Id devRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Renewal').getRecordTypeId();
        if(newOpp.RecordTypeId == devRecordTypeId){
            newOpp.Renewal_Due_Date__c = newOpp.CloseDate;
            //Set Renewal Manager from account if populated
            system.debug('accountMap size update: ' + accountMap.size());
            system.debug('accountMap.Account_Manager__c: ' + accountMap.get(newOpp.AccountId).Account_Manager__c);
            system.debug('accountMap.Account_Manager__r.IsActive: ' + accountMap.get(newOpp.AccountId).Account_Manager__r.IsActive);
            if(accountMap.get(newOpp.AccountId).Account_Manager__c != null && accountMap.get(newOpp.AccountId).Account_Manager__r.IsActive){
                newOpp.OwnerId  = accountMap.get(newOpp.AccountId).Account_Manager__c;
            }
        }        
    }
    //commented by rahul ranjan 12/04/2022
    /*public static void setOpportunityRegion(Opportunity newOpp){
        if(opportunityOwnerMangers.containsKey(newOpp.OwnerId)){
            String managerEmail = opportunityOwnerMangers.get(newOpp.OwnerId).Manager.Email;
            if(managerEmail.contains('krobinson@copa')){
                newOpp.Opportunity_Region__c = 'Summit';
            }
            else if(managerEmail.contains('apatel@copa')){
                newOpp.Opportunity_Region__c = 'Select';
            }
            else if(managerEmail.contains('mhill@copa')){
                newOpp.Opportunity_Region__c = 'EMEA';
            }
        }
        
    }*/
    //By using this method update Opportunity Creation Role on the basis of opportunity owner role
    public static void setOpportunityCreationRole(Opportunity newOpp){
        if(opportunityOwnerMap.containsKey(newOpp.OwnerId)){
            String oppOwnerRole = opportunityOwnerMap.get(newOpp.OwnerId).UserRole.Name;
            system.debug('oppOwnerRole' + oppOwnerRole);
            if(oppOwnerRole.contains('Sales')){
                newOpp.Opportunity_Creation_Role__c  = 'Sales';
            }
            else if(oppOwnerRole.contains('Customer') || oppOwnerRole.contains('Account Manager') || oppOwnerRole.contains('Renewal')){
                newOpp.Opportunity_Creation_Role__c  = 'Customer';
            }
            else if(oppOwnerRole.contains('Alliances')){
                newOpp.Opportunity_Creation_Role__c  = 'Partner';
            }else if(oppOwnerRole.contains('Marketing')){
                newOpp.Opportunity_Creation_Role__c  = 'BDR';
            }else{
                newOpp.Opportunity_Creation_Role__c  = 'Other';
            }
            
        }
    }
    
    public static void updateNextStepDate(Opportunity oldOpp,Opportunity newOpp){
        Set<String> accessUserRoles = new Set<String>{'Account Executive EMEA','Account Executive Enterprise Sales','Account Executive Select'};
        if(newOpp.NextStep!=NULL && newOpp.NextStep!=oldOpp.NextStep){
            newOpp.OA__Next_Step_Date__c = SYSTEM.TODAY();
        }
        if(newOpp.StageName == 'Marketing Qualification' && newOpp.OwnerId != oldOpp.OwnerId && opportunityOwnerMangers.containsKey(newOpp.OwnerId) && opportunityOwnerMangers.get(newOpp.OwnerId).UserRole!=NULL){
            if(accessUserRoles.contains(opportunityOwnerMangers.get(newOpp.ownerId).UserRole.Name)){
                newOpp.SQL_Transfer_Date__c = SYSTEM.TODAY();
            }
        }
        if(oldOpp.StageName == 'Marketing Qualification' && newOpp.StageName != 'Marketing Qualification' && newOpp.StageName != 'Closed Lost' && newOpp.StageName!=oldOpp.StageName){
            newOpp.SAL_Acceptance_Date__c = SYSTEM.TODAY();
        }
        if(newOpp.ContractId != NULL && opportunitiesWithAccount.containsKey(newOpp.Id) && opportunitiesWithAccount.get(newOpp.Id).AccountId!=NULL && contractMap.containsKey(newOpp.ContractId) && opportunitiesWithAccount.get(newOpp.Id).Account.Customer_Success_Manager__c==NULL && contractMap.get(newOpp.ContractId).Has_Premier_Support__c == False && newOpp.IsWon == TRUE &&  newOpp.StageName == 'Closed Won'){
            Account oppAccount = new Account();
            oppAccount.Id = newOpp.AccountId;
            oppAccount.Customer_Success_Manager__c = SYSTEM.LABEL.AccountCustomerSuccessManager;
            updateCustomerSuccessManagerUsers.put(newOpp.Id,oppAccount);
        }
    }
    //by using this method create ROI Calculation when new opportunity is inserted with Value Prop ID
    public static void createRoiCalculation(Opportunity newOpp){
        Account accName = new Account();
        if(newOpp.AccountId != null){
            accName =[Select Id,Name From Account where Id=:newOpp.AccountId Limit 1];
        }
        if(newOpp.Value_Prop_ID__c != null && accName != Null){
            DL_VC__VC_Value_Proposition__c obj = new DL_VC__VC_Value_Proposition__c ();
            obj.DL_VC__VC_Opportunity__c  = newOpp.id;
            obj.DL_VC__VC_Value_Prop_Id__c =  newOpp.Value_Prop_ID__c;
            obj.Name = accName.Name +'-'+'Web Calculator';
            obj.DL_VC__VC_Go_To_Customer__c = 'No';
            Insert obj;
        }
        
        
    }
    //This method updates the Renewal ACV on Opportunity when Primary Quote is changed.
    public static void updateRenewalACVfromPrimaryQuote(Opportunity oldOpp,Opportunity newOpp){
        set<Id> quoteId = new set<Id>();
        Id renewRecTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Renewal').getRecordTypeId();
        if(newOpp.RecordTypeId == renewRecTypeId && newOpp.SBQQ__PrimaryQuote__c != NULL && newOpp.SBQQ__PrimaryQuote__c != oldOpp.SBQQ__PrimaryQuote__c && newOpp.isClosed == false){
            quoteId.add(newOpp.SBQQ__PrimaryQuote__c);
        } 
        
        if(quoteId != null) {
            Map<Id,SBQQ__Quote__c> mapIdAndQuote = new Map<Id,SBQQ__Quote__c>([Select id, Renewal_ACV__c 
                                                                                        from SBQQ__Quote__c where Id IN:quoteId ]);
            if(mapIdAndQuote != null && mapIdAndQuote.containskey(newOpp.SBQQ__PrimaryQuote__c) && mapIdAndQuote.get(newOpp.SBQQ__PrimaryQuote__c).Renewal_ACV__c != null) {
               
                newOpp.Renewal_ACV__c = mapIdAndQuote.get(newOpp.SBQQ__PrimaryQuote__c).Renewal_ACV__c ;                
            }
        }
    }
    //This method updates Type to renewal if Opportunity is Renewal. 
    /*public static void setOpportunityType(Opportunity newOpp){
        Id renewRecTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Renewal').getRecordTypeId();
        
        system.debug('newOpp-->>>'+newOpp);
        opportunity oppRecord = [SELECT Id,RecordTypeId,SBQQ__Renewal__c,SBQQ__RenewedContract__r.kuga_sub__RenewalOpportunity__r.Type 
                                 FROM Opportunity 
                                 WHERE Id =: newOpp.Id 
                                 AND RecordTypeId =: renewRecTypeId];
        system.debug('oppRecord-->>>'+oppRecord);
        system.debug('renewRecTypeId-->>>'+renewRecTypeId);
        system.debug('oppRecord.SBQQ__RenewedContract__r.kuga_sub__RenewalOpportunity__r.Type-->>>'+oppRecord.SBQQ__RenewedContract__r.kuga_sub__RenewalOpportunity__r.Type);
        if(oppRecord.SBQQ__RenewedContract__r.kuga_sub__RenewalOpportunity__r.Type == 'Temporary License') {
             system.debug('Inside Action');
           //newOpp.Type = 'Temporary Licenses - Renewal';   
        }
    }*/
    //This method updates Push Counter by 1 if new closeDate is greater than prior close date. 
    public static void updatePushCounter(Opportunity newOpp,Opportunity oldOpp){        
        if(newOpp.CloseDate > oldOpp.CloseDate && newOpp.CloseDate.month() != oldOpp.CloseDate.month()) {
            newOpp.Push_Counter__c = newOpp.Push_Counter__c != null ? newOpp.Push_Counter__c+1 : 1;             
        }
    }
    
    //This method updates Quote Sales Rep if Opportunity owner is changed. 
    public static void updatePrimaryQuoteOwner(Opportunity newOpp,Opportunity oldOpp){ 
        Id renewalRecordTypeId = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('Renewal').getRecordTypeId();          
        if(newOpp.RecordTypeId == renewalRecordTypeId && newOpp.OwnerId != oldOpp.OwnerId && newOpp.SBQQ__PrimaryQuote__c != null) {            
            SBQQ__Quote__c quote = new SBQQ__Quote__c(id = newOpp.SBQQ__PrimaryQuote__c); 
            quote.SBQQ__SalesRep__c =  newOpp.OwnerId;
            update quote;      
        }
    }
    
    public static void finish(){ 
        if(updateCustomerSuccessManagerUsers.size()>0){
            UPDATE updateCustomerSuccessManagerUsers.values();
        }
    }
}