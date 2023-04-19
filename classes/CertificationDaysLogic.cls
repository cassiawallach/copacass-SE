global class CertificationDaysLogic {    
    @InvocableMethod(label='CertificationDaysLogic' Description = 'Logic to update ILT Roster records based on certs attained by attendees')
    global static void UpdateILTClassField (List<ValuesFromFlow> requests) {
        
        /*
        Documentation: 
        
		Logic: 
            ILT Roster Updates
                1. Academy Cert is created or edited, triggers flow
                2. Flow calls this class, passing UserId, ProgramId, AcademyCertId as variables. 
                3. Get all ILT Rosters with matching UserId and ProgramId values from flow. NOTE: A user can only have 1 cert per program. 
                4. Populate Certification_Influenced__c lookup on ILT Rosters lookup with AcademyCertId
            
            ILT Class Updates 
                5. Get all ILT Classes from ILT Rosters that were updated from above
                6. Populate Number_of_Attendees_Certified__c on Class based on # of Roster records with the Certification_Influenced__c populated
		*/
       
        //User (KEY), Program (VALUE)
        Map<ID, ID> UserProgramMap = new Map<ID, ID>();
        //Cert (KEY), User+ProgramString (VALUE)
        Map<ID, String> CertId_UserProgramStringMap = new Map<ID, String>();
        
        //User+ProgramString (KEY), Cert (VALUE)
        Map<String, ID> UserProgramString_CertIdMap = new Map<String, ID>();
        
        //Roster (KEY) and Class (VALUE) map
        Map<ID, ID> RosterClassMap = new Map<ID, ID>();
        
        //Iterate through flow requests and add values to maps
        for(ValuesFromFlow req : requests){
            UserProgramMap.put(req.academyCertificationCreatedByID, req.academyProgramID);			
            
            //Concatenate createdById and academyProgramId
            String Cert_UserProgramString = string.valueOf(req.academyCertificationCreatedByID) + string.valueOf(req.academyProgramID);
            system.debug('Cert_UserProgramString = ' + Cert_UserProgramString);
            
            CertId_UserProgramStringMap.put(req.academyCertificationID, Cert_UserProgramString);
            
            UserProgramString_CertIdMap.put(Cert_UserProgramString, req.academyCertificationID);
            }
                      
        //Get Rosters if Attended = true AND CreatedByID and Roster.Class.Learning.Program.ID is in UserProgramMap
         List<redwing__ILT_Roster__c> ILTRosterList = new List<redwing__ILT_Roster__c>([
            SELECT ID, 
             redwing__Attended__c, 
             redwing__ILT_Class__c, 
             redwing__User__r.id, 
             Certification_Influenced__c, 
             redwing__ILT_Class__r.redwing__Learning__r.Academy_Certification_Program__r.id
            FROM redwing__ILT_Roster__c 
            //Uncomment this before deploying. 
            //I could not update the Attended field to true manually, 
            //so had to remove below WHERE clause for testing purposes (EV). 
            //WHERE redwing__Attended__c = true
            //AND
            WHERE redwing__User__r.id IN: UserProgramMap.keySet() 
            AND redwing__ILT_Class__r.redwing__Learning__r.Academy_Certification_Program__r.id IN: UserProgramMap.values()]);
        
        system.debug('ILTRosterList = ' + ILTRosterList);

        //Iterate through Rosters and update the Certification_Influenced__c lookup field
        for(redwing__ILT_Roster__c Ros : ILTRosterList){
            system.debug('in for loop');
        	
            //Concatenate UserId and ProgramId from Roster
            String Roster_UserProgramString = string.valueOf(ros.redwing__User__r.id) + string.valueOf(ros.redwing__ILT_Class__r.redwing__Learning__r.Academy_Certification_Program__r.id);

            //Use Roster_UserProgramString in map to return AcademyCertId
            If(Roster_UserProgramString != null){
            Ros.Certification_Influenced__c = UserProgramString_CertIdMap.get(Roster_UserProgramString);
            
            //Add RosterId and ClassId in map
            RosterClassMap.put(ros.Id, ros.redwing__ILT_Class__r.id);
            }
        }
        
        //CREATE AS SEPARATE METHOD or CLASS(?)------------>
        
        //Update Roster Records
        If(!ILTRosterList.isEmpty()){
            update ILTRosterList;
            
            //Get ILT Classes from map and related Rosters that have Certification_Influenced__c populated
            List<redwing__ILT_Class__c> ClassListUpdate = new List<redwing__ILT_Class__c>([
                SELECT ID, 
                	Number_of_Attendees_Certified__c, 
                (SELECT ID FROM redwing__ILT_Rosters__r WHERE Certification_Influenced__c != null)   
                FROM redwing__ILT_Class__c
                WHERE ID IN: RosterClassMap.values()]);
    
            //Iterate through Classes and update Number_of_Attendees_Certified__c 
            for(redwing__ILT_Class__c cls : ClassListUpdate){
                If(cls.redwing__ILT_Rosters__r.size()>0){
                cls.Number_of_Attendees_Certified__c = cls.redwing__ILT_Rosters__r.size();
                }
                system.debug('cls.redwing__ILT_Rosters__r.size: ' + cls.redwing__ILT_Rosters__r.size());    
            }

            If(!ClassListUpdate.isEmpty()){
            update ClassListUpdate;
            }
        }

    // <------------CREATE AS SEPARATE METHOD or CLASS(?)

    }
    
    global class ValuesFromFlow {
        @InvocableVariable(required=true description='Academy Certification ID' label='academyCertificationID')
        public ID academyCertificationID;
                
        @InvocableVariable(required=true description='User ID from Academy Certification CreatedByID' label='academyCertificationCreatedByID')
        public ID academyCertificationCreatedByID;
        
        @InvocableVariable(required=true description='Academy Program ID from Academy Certification' label='academyProgramID')
        public ID academyProgramID;
    }
}


/*
	Future considerations to be thorough (TBD):                            
	- Logic if academy cert is deleted? or expires?
	- Factor in maintenance exams?
*/