{
  "recordTypeMap": {},
  "RecordSetBundles": [
    {
      "Records": [
        {
          "attributes": {
            "type": "copado__ExtensionConfiguration__c",
            "url": "/services/data/v56.0/sobjects/copado__ExtensionConfiguration__c/a0h7S000000U2y1QAC"
          },
          "copado__AcceptanceCriteria__c": "{}",
          "copado__Active__c": true,
          "copado__ExtensionApplication__c": "Test",
          "copado__ExtensionTool__c": "Checkmarx",
          "copado__Status__c": "Inactive",
          "copado__TestType__c": "Checkmarx",
          "Id": "a0h7S000000U2y1QAC",
          "LastReferencedDate": "2022-11-11T08:52:58.000+0000",
          "LastViewedDate": "2022-11-11T08:52:58.000+0000",
          "Name": "Checkmarx"
        }
      ],
      "ObjectType": "copado__ExtensionConfiguration__c"
    },
    {
      "Records": [
        {
          "attributes": {
            "type": "copado__Function__c",
            "url": "/services/data/v56.0/sobjects/copado__Function__c/a0n7S000000U3MFQA0"
          },
          "copado__ApexClass__c": "copado_labs.EvaluateScanResult",
          "copado__API_Name__c": "Run_Checkmarx_QIF_1",
          "copado__Callback_Type__c": "ApexClass",
          "copado__Image_Name__c": "cbsrlaowbenauz7nj0qcriifrxseww-checkmarx-docker:v1.0",
          "copado__Options__c": "[ ]",
          "copado__Parameters__c": "[ {\n  \"name\" : \"CX_TENANT\",\n  \"defaultValue\" : \"\"\n}, {\n  \"name\" : \"CX_BASE_IAM_URI\",\n  \"defaultValue\" : \"\"\n}, {\n  \"name\" : \"CX_BASE_URI\",\n  \"defaultValue\" : \"\"\n}, {\n  \"name\" : \"CX_APIKEY\",\n  \"defaultValue\" : \"\"\n}, {\n  \"name\" : \"CX_PROJECT\",\n  \"defaultValue\" : \"\"\n}, {\n  \"name\" : \"branchesAndFileIdJson\",\n  \"defaultValue\" : \"\"\n}, {\n  \"name\" : \"git_json\",\n  \"defaultValue\" : \"{$Context.Repository.Credential}\"\n}, {\n  \"name\" : \"consolidatedResultId\",\n  \"defaultValue\" : \"{$Context.JobExecution__r.DataJson.resultId}\"\n}, {\n  \"name\" : \"testResultIds\",\n  \"defaultValue\" : \"{$Context.JobExecution__r.DataJson.resultIds}\"\n} ]",
          "copado__Script__c": "########## Get Source and Destination Branch names and Checkout Repository #############\ncopado -p \"Reading parameters...\"\noriginBranch=$(jq -r '.originBranch' <<< $branchesAndFileIdJson)\nBRANCH=\"$originBranch\"\ndestinationBranch=$(jq -r '.destinationBranch' <<< $branchesAndFileIdJson)\n\necho \"param branchesAndFileIdJson =  $branchesAndFileIdJson\"\necho \"param originBranch = $originBranch\"\necho \"param BRANCH = $BRANCH\"\n\ncopado -p \"cloning repo...\"\ncopado-git-get $destinationBranch\ncopado-git-get $BRANCH\n\n########### Create delta packages for new, modified or deleted metadata  ############\ncopado -p \"Generating Diff between the Source and Destination branches...\"\nmkdir changed-sources\nsfdx sgd:source:delta --to \"HEAD\" --from \"origin/$destinationBranch\" --output changed-sources/ --generate-delta --source .\necho \"Here's the files that have been changes in this US\"\ncat changed-sources/package/package.xml \n\n################ Run SFDX Scanner only on Changed Metadata  ###############\ncopado -p \"running Checkmarx San...\"\nexitCode=0\n\ncx scan create --sast-incremental --output-name \"cx_output_report\" --report-format \"sarif\" --output-path \".\" -s \"./changed-sources/\" --branch \"$BRANCH\" --scan-types \"sast,sca\" --project-name \"$CX_PROJECT\" --file-filter \"*.cls,!*__*.cls,*.page,*.js,*.html,*.trigger,!*__*.trigger,*.component,!*__*.component\"\n\n\ncopado -p \"Uploading Analysis Output\"\n\t\nif [ -n \"$testResultIds\" ];\nthen\n\ttestResultsIds=$(echo $testResultIds | sed -e \"s/\\[//g\" | sed -e \"s/\\]//g\" | sed -e \"s/ //g\" | xargs)\n\tfor testResultId in `echo $testResultsIds | sed 's/[)(]//g' | sed 's/,/ /g'`\n\tdo\n\t\tcopado -u cx_output_report.sarif --name \"pmd-output.sarif.json\" --parentid $testResultId\n\tdone\nfi\n\ncopado -p 'Attaching Result File'\n\nif [ -n \"$consolidatedResultId\" ];\nthen\n\tcopado -u cx_output_report.sarif --name \"pmd-output.sarif.json\" --parentid $consolidatedResultId\nelse\n\tcopado -u cx_output_report.sarif --name \"pmd-output.sarif.json\"\nfi",
          "copado__Type__c": "Custom",
          "copado__Version__c": "1",
          "Id": "a0n7S000000U3MFQA0",
          "LastReferencedDate": "2022-11-25T11:09:34.000+0000",
          "LastViewedDate": "2022-11-25T11:09:34.000+0000",
          "Name": "Run Checkmarx QIF"
        }
      ],
      "ObjectType": "copado__Function__c"
    },
    {
      "Records": [
        {
          "attributes": {
            "type": "copado__JobTemplate__c",
            "url": "/services/data/v56.0/sobjects/copado__JobTemplate__c/a0w7S000001wk2uQAA"
          },
          "copado__ApiName__c": "Run_Checkmarx_QIF_1",
          "copado__Type__c": "Custom",
          "copado__Version__c": 1,
          "Id": "a0w7S000001wk2uQAA",
          "LastReferencedDate": "2022-11-17T12:29:22.000+0000",
          "LastViewedDate": "2022-11-17T12:29:22.000+0000",
          "Name": "Run CheckMarx QIF"
        }
      ],
      "ObjectType": "copado__JobTemplate__c"
    },
    {
      "Records": [
        {
          "attributes": {
            "type": "copado__JobStep__c",
            "url": "/services/data/v56.0/sobjects/copado__JobStep__c/a0v7S000000HmDcQAK"
          },
          "copado__ApiName__c": "Run CheckMarx QIF_1_Execute CodeScan_4",
          "copado__ConfigJson__c": "{\"functionName\":\"Run_Checkmarx_QIF_1\",\"parameters\":[{\"name\":\"CX_TENANT\",\"value\":\"{$Pipeline.Property.CX_TENANT}\"},{\"name\":\"CX_BASE_IAM_URI\",\"value\":\"{$Pipeline.Property.CX_BASE_IAM_URI}\"},{\"name\":\"CX_BASE_URI\",\"value\":\"{$Pipeline.Property.CX_BASE_URI}\"},{\"name\":\"CX_APIKEY\",\"value\":\"{$Pipeline.Property.CX_APIKEY}\"},{\"name\":\"CX_PROJECT\",\"value\":\"{$Pipeline.Property.CX_PROJECT}\"},{\"name\":\"branchesAndFileIdJson\",\"value\":\"{$Job.PrevStep.ResultDataJson__c}\"},{\"name\":\"git_json\",\"value\":\"{$Context.Repository.Credential}\"},{\"name\":\"consolidatedResultId\",\"value\":\"{$Context.JobExecution__r.DataJson.resultId}\"},{\"name\":\"testResultIds\",\"value\":\"{$Context.JobExecution__r.DataJson.resultIds}\"}]}",
          "copado__CustomType__c": "Function",
          "copado__JobTemplate__c": "a0w7S000001wk2uQAA",
          "copado__Order__c": 4,
          "copado__Type__c": "Function",
          "Id": "a0v7S000000HmDcQAK",
          "Name": "Execute Scan"
        },
        {
          "attributes": {
            "type": "copado__JobStep__c",
            "url": "/services/data/v56.0/sobjects/copado__JobStep__c/a0v7S000000HmDdQAK"
          },
          "copado__ApiName__c": "Run CheckMarx QIF_1_Get Parent Execution Context_2",
          "copado__ConfigJson__c": "{\"flowName\":\"copado_labs.Carry_Orchastrator_Job_Execution_Context\",\"parameters\":[{\"name\":\"jobExecutionId\",\"value\":\"{$Job.FirstStep.copado__JobExecution__c}\"},{\"name\":\"testIds\",\"value\":\"{$Context.JobExecution__r.DataJson.testIds}\"},{\"name\":\"consolidatedResultId\",\"value\":\"{$Context.JobExecution__r.DataJson.resultId}\"}]}",
          "copado__CustomType__c": "Salesforce Flow",
          "copado__JobTemplate__c": "a0w7S000001wk2uQAA",
          "copado__Order__c": 2,
          "copado__Type__c": "Flow",
          "Id": "a0v7S000000HmDdQAK",
          "Name": "Get Parent Execution Context"
        },
        {
          "attributes": {
            "type": "copado__JobStep__c",
            "url": "/services/data/v56.0/sobjects/copado__JobStep__c/a0v7S000000HmDeQAK"
          },
          "copado__ApiName__c": "Run CheckMarx QIF_1_Retrieve Branches and Ruleset File Id_3",
          "copado__ConfigJson__c": "{\"flowName\":\"copadoQuality.RetrieveBranchesAndFileIdForPMDScan\",\"parameters\":[{\"name\":\"testIds\",\"value\":\"{$Context.JobExecution__r.DataJson.testIds}\"},{\"name\":\"jobExecutionId\",\"value\":\"{$Context.JobExecution__c}\"},{\"name\":\"extensionConfigurationId\",\"value\":\"{$Context.JobExecution__r.DataJson.extensionConfigurationId}\"},{\"name\":\"consolidatedResultId\",\"value\":\"{$Context.JobExecution__r.DataJson.resultId}\"}]}",
          "copado__CustomType__c": "Salesforce Flow",
          "copado__JobTemplate__c": "a0w7S000001wk2uQAA",
          "copado__Order__c": 3,
          "copado__Type__c": "Flow",
          "Id": "a0v7S000000HmDeQAK",
          "Name": "Retrieve Branches and Ruleset File Id"
        },
        {
          "attributes": {
            "type": "copado__JobStep__c",
            "url": "/services/data/v56.0/sobjects/copado__JobStep__c/a0v7S000000HmDfQAK"
          },
          "copado__ApiName__c": "Run CheckMarx QIF_1_Set Repository For Scan_1",
          "copado__ConfigJson__c": "{\"flowName\":\"copado_labs.SetRepositoryForScan\",\"parameters\":[{\"name\":\"testIds\",\"value\":\"{$Context.JobExecution__r.DataJson.testIds}\"},{\"name\":\"jobStepToUpdate\",\"value\":\"{$Job.Step.Execute Scan.Id}\"}]}",
          "copado__CustomType__c": "Salesforce Flow",
          "copado__JobTemplate__c": "a0w7S000001wk2uQAA",
          "copado__Order__c": 1,
          "copado__Type__c": "Flow",
          "Id": "a0v7S000000HmDfQAK",
          "Name": "Set Repository For Scan"
        }
      ],
      "ObjectType": "copado__JobStep__c"
    }
  ],
  "blobsByUID": {}
}