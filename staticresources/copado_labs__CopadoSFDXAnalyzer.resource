{
  "recordTypeMap": {},
  "RecordSetBundles": [
    {
      "Records": [
        {
          "attributes": {
            "type": "copado__ExtensionConfiguration__c",
            "url": "/services/data/v56.0/sobjects/copado__ExtensionConfiguration__c/a1M5w000007zn2BEAQ"
          },
          "copado__AcceptanceCriteria__c": "{}",
          "copado__Active__c": true,
          "copado__ExtensionApplication__c": "Test",
          "copado__ExtensionTool__c": "sfdx-scanner",
          "copado__Status__c": "Inactive",
          "copado__TestType__c": "Static Code Analysis",
          "Id": "a1M5w000007zn2BEAQ",
          "LastReferencedDate": "2022-11-28T12:47:49.000+0000",
          "LastViewedDate": "2022-11-28T12:47:49.000+0000",
          "Name": "SFDX Scanner Config"
        },
        {
          "attributes": {
            "type": "copado__ExtensionConfiguration__c",
            "url": "/services/data/v56.0/sobjects/copado__ExtensionConfiguration__c/a1M5w000007zodcEAA"
          },
          "copado__AcceptanceCriteria__c": "{}",
          "copado__Active__c": true,
          "copado__ExtensionApplication__c": "Test",
          "copado__ExtensionTool__c": "sfdx-scanner-dfa",
          "copado__Status__c": "Inactive",
          "copado__TestType__c": "Static Code Analysis",
          "Id": "a1M5w000007zodcEAA",
          "LastReferencedDate": "2022-11-28T12:49:28.000+0000",
          "LastViewedDate": "2022-11-28T12:49:28.000+0000",
          "Name": "SFDX Scanner Config DFA"
        }
      ],
      "ObjectType": "copado__ExtensionConfiguration__c"
    },
    {
      "Records": [
        {
          "attributes": {
            "type": "copado__Function__c",
            "url": "/services/data/v56.0/sobjects/copado__Function__c/a1S5w000004pSJnEAM"
          },
          "copado__ApexClass__c": "copado_labs.EvaluateSFDXAnalyzerResult",
          "copado__API_Name__c": "Run_CodeAnalyzer_QIF",
          "copado__Callback_Type__c": "ApexClass",
          "copado__Description__c": "For the Quality Gate Engine only",
          "copado__Image_Name__c": "ubxxrh6cjl2pkhy5iaingoykadytnn-sfdx-scanner:v1.2",
          "copado__Options__c": "[ ]",
          "copado__Parameters__c": "[ {\n  \"name\" : \"git_json\",\n  \"defaultValue\" : \"{$Context.Repository.Credential}\"\n}, {\n  \"name\" : \"branchesAndFileIdJson\",\n  \"defaultValue\" : \"{$Job.PrevStep.ResultDataJson__c}\"\n}, {\n  \"name\" : \"severityThreshold\",\n  \"defaultValue\" : \"2\"\n}, {\n  \"name\" : \"engine\",\n  \"defaultValue\" : \"eslint-lwc,pmd,cpd,retire-js\"\n} ]",
          "copado__Script__c": "########## Get Source and Destination Branch names and Checkout Repository #############\ncopado -p \"Reading parameters...\"\noriginBranch=$(jq -r '.originBranch' <<< $branchesAndFileIdJson)\nBRANCH=\"$originBranch\"\ndestinationBranch=$(jq -r '.destinationBranch' <<< $branchesAndFileIdJson)\n\necho \"param branchesAndFileIdJson =  $branchesAndFileIdJson\"\necho \"param originBranch = $originBranch\"\necho \"param BRANCH = $BRANCH\"\n\ncopado -p \"cloning repo...\"\ncopado-git-get $destinationBranch\ncopado-git-get $BRANCH\n\n########### Create delta packages for new, modified or deleted metadata  ############\ncopado -p \"Generating Diff between the Source and Destination branches...\"\nmkdir changed-sources\nsfdx sgd:source:delta --to \"HEAD\" --from \"origin/$destinationBranch\" --output changed-sources/ --generate-delta --source .\necho \"Here's the files that have been changes in this US\"\ncat changed-sources/package/package.xml \n\n################ Run SFDX Scanner only on Changed Metadata  ###############\n#TODO change html format with sarif, once the sarif viewer is generic enough\ncopado -p \"running sfdx scanner...\"\nexitCode=0\nsfdx scanner:run --format html --target \"./changed-sources/**/*.*\" --engine $engine --severity-threshold $severityThreshold --outfile ./result.html || exitCode=$?\n\n############ Attach Results to the Function results record  ####################\ncopado -p \"uploading results...\"\nif [ -f \"result.html\" ]; then\n    copado -u result.html\nfi\n\necho \"sfdx scanner scan completed. exit code: $exitCode\"\nexit $exitCode",
          "copado__Type__c": "Custom",
          "copado__Version__c": "1",
          "Id": "a1S5w000004pSJnEAM",
          "LastReferencedDate": "2022-11-28T12:41:18.000+0000",
          "LastViewedDate": "2022-11-28T12:41:18.000+0000",
          "Name": "Run SFDX Code Analyzer QIF"
        },
        {
          "attributes": {
            "type": "copado__Function__c",
            "url": "/services/data/v56.0/sobjects/copado__Function__c/a1S5w000004pSNVEA2"
          },
          "copado__ApexClass__c": "copado_labs.EvaluateSFDXAnalyzerResult",
          "copado__API_Name__c": "Run_CodeAnalyzer_DFA_QIF",
          "copado__Callback_Type__c": "ApexClass",
          "copado__Description__c": "For the Quality Gate Engine only",
          "copado__Image_Name__c": "ubxxrh6cjl2pkhy5iaingoykadytnn-sfdx-scanner:v1.2",
          "copado__Options__c": "[ ]",
          "copado__Parameters__c": "[ {\n  \"name\" : \"git_json\",\n  \"defaultValue\" : \"{$Context.Repository.Credential}\"\n}, {\n  \"name\" : \"branchesAndFileIdJson\",\n  \"defaultValue\" : \"{$Job.PrevStep.ResultDataJson__c}\"\n}, {\n  \"name\" : \"severityThreshold\",\n  \"defaultValue\" : \"2\"\n} ]",
          "copado__Script__c": "########## Get Source and Destination Branch names and Checkout Repository #############\ncopado -p \"Reading parameters...\"\noriginBranch=$(jq -r '.originBranch' <<< $branchesAndFileIdJson)\nBRANCH=\"$originBranch\"\ndestinationBranch=$(jq -r '.destinationBranch' <<< $branchesAndFileIdJson)\n\necho \"param branchesAndFileIdJson =  $branchesAndFileIdJson\"\necho \"param originBranch = $originBranch\"\necho \"param BRANCH = $BRANCH\"\n\ncopado -p \"cloning repo...\"\ncopado-git-get $destinationBranch\ncopado-git-get $BRANCH\n\n########### Create delta packages for new, modified or deleted metadata  ############\ncopado -p \"Generating Diff between the Source and Destination branches...\"\nmkdir changed-sources\nsfdx sgd:source:delta --to \"HEAD\" --from \"origin/$destinationBranch\" --output changed-sources/ --generate-delta --source .\necho \"Here's the files that have been changes in this US\"\ncat changed-sources/package/package.xml \n\n################ Run SFDX Scanner only on Changed Metadata  ###############\n#TODO change html format with sarif, once the sarif viewer is generic enough\ncopado -p \"running sfdx scanner:dfa...\"\nexitCode=0\nsfdx scanner:run:dfa --format html --projectdir \"./changed-sources/\"  --target \"./changed-sources/**/*.*\" --severity-threshold $severityThreshold --outfile ./result-dfa.html || exitCode=$?\n\n############ Attach Results to the Function results record  ####################\nif [ -f \"result-dfa.html\" ]; then\n    copado -u result-dfa.html\nfi\n\necho \"sfdx scanner scan completed. exit code: $exitCode\"\nexit $exitCode",
          "copado__Type__c": "Custom",
          "copado__Version__c": "1",
          "Id": "a1S5w000004pSNVEA2",
          "LastReferencedDate": "2022-11-28T12:42:20.000+0000",
          "LastViewedDate": "2022-11-28T12:42:20.000+0000",
          "Name": "Run SFDX Code Analyzer DFA QIF"
        }
      ],
      "ObjectType": "copado__Function__c"
    },
    {
      "Records": [
        {
          "attributes": {
            "type": "copado__JobTemplate__c",
            "url": "/services/data/v56.0/sobjects/copado__JobTemplate__c/a1b5w00000EDHLiAAP"
          },
          "copado__ApiName__c": "Run SFDX Codeanalyzer QIF_1",
          "copado__Type__c": "Custom",
          "copado__Version__c": 1,
          "Id": "a1b5w00000EDHLiAAP",
          "LastReferencedDate": "2022-11-28T12:42:32.000+0000",
          "LastViewedDate": "2022-11-28T12:42:32.000+0000",
          "Name": "Run SFDX Codeanalyzer QIF"
        },
        {
          "attributes": {
            "type": "copado__JobTemplate__c",
            "url": "/services/data/v56.0/sobjects/copado__JobTemplate__c/a1b5w00000EDHMWAA5"
          },
          "copado__ApiName__c": "Run SFDX Codeanalyzer DFA QIF_1",
          "copado__Type__c": "Custom",
          "copado__Version__c": 1,
          "Id": "a1b5w00000EDHMWAA5",
          "LastReferencedDate": "2022-11-28T13:19:53.000+0000",
          "LastViewedDate": "2022-11-28T13:19:53.000+0000",
          "Name": "Run SFDX Codeanalyzer DFA QIF"
        }
      ],
      "ObjectType": "copado__JobTemplate__c"
    },
    {
      "Records": [
        {
          "attributes": {
            "type": "copado__JobStep__c",
            "url": "/services/data/v56.0/sobjects/copado__JobStep__c/a1a5w00001EEXowAAH"
          },
          "copado__ApiName__c": "Run SFDX Codeanalyzer QIF_1_Run SFDX Code Analyzer_1",
          "copado__ConfigJson__c": "{\"functionName\":\"Run_CodeAnalyzer_QIF\",\"parameters\":[{\"name\":\"git_json\",\"value\":\"{$Context.Repository.Credential}\"},{\"name\":\"branchesAndFileIdJson\",\"value\":\"{$Job.PrevStep.ResultDataJson__c}\"},{\"name\":\"severityThreshold\",\"value\":\"2\"},{\"name\":\"engine\",\"value\":\"eslint-lwc,pmd,cpd,retire-js\"}]}",
          "copado__CustomType__c": "Function",
          "copado__JobTemplate__c": "a1b5w00000EDHLiAAP",
          "copado__Order__c": 4,
          "copado__Type__c": "Function",
          "Id": "a1a5w00001EEXowAAH",
          "Name": "Run SFDX Code Analyzer"
        },
        {
          "attributes": {
            "type": "copado__JobStep__c",
            "url": "/services/data/v56.0/sobjects/copado__JobStep__c/a1a5w00001EEXoxAAH"
          },
          "copado__ApiName__c": "Run SFDX Codeanalyzer QIF_1_Set Repository For Scan_2",
          "copado__ConfigJson__c": "{\"flowName\":\"copadoQuality.SetRepositoryForPMDScan\",\"parameters\":[{\"name\":\"testIds\",\"value\":\"{$Context.JobExecution__r.DataJson.testIds}\"},{\"name\":\"jobStepToUpdate\",\"value\":\"{$Job.Step.Run SFDX Code Analyzer.Id}\"}]}",
          "copado__CustomType__c": "Salesforce Flow",
          "copado__JobTemplate__c": "a1b5w00000EDHLiAAP",
          "copado__Order__c": 1,
          "copado__Type__c": "Flow",
          "Id": "a1a5w00001EEXoxAAH",
          "Name": "Set Repository For Scan"
        },
        {
          "attributes": {
            "type": "copado__JobStep__c",
            "url": "/services/data/v56.0/sobjects/copado__JobStep__c/a1a5w00001EEXoyAAH"
          },
          "copado__ApiName__c": "Run SFDX Codeanalyzer QIF_1_Retrieve Branches_3",
          "copado__ConfigJson__c": "{\"flowName\":\"copadoQuality.RetrieveBranchesAndFileIdForPMDScan\",\"parameters\":[{\"name\":\"testIds\",\"value\":\"{$Context.JobExecution__r.DataJson.testIds}\"},{\"name\":\"jobExecutionId\",\"value\":\"{$Context.JobExecution__c}\"},{\"name\":\"extensionConfigurationId\",\"value\":\"{$Context.JobExecution__r.DataJson.extensionConfigurationId}\"},{\"name\":\"consolidatedResultId\",\"value\":\"{$Context.JobExecution__r.DataJson.resultId}\"}]}",
          "copado__CustomType__c": "Salesforce Flow",
          "copado__JobTemplate__c": "a1b5w00000EDHLiAAP",
          "copado__Order__c": 3,
          "copado__Type__c": "Flow",
          "Id": "a1a5w00001EEXoyAAH",
          "Name": "Retrieve Branches"
        },
        {
          "attributes": {
            "type": "copado__JobStep__c",
            "url": "/services/data/v56.0/sobjects/copado__JobStep__c/a1a5w00001EEXozAAH"
          },
          "copado__ApiName__c": "Run SFDX Codeanalyzer QIF_1_Get Parent Execution Context_4",
          "copado__ConfigJson__c": "{\"flowName\":\"copado_labs.Carry_Orchastrator_Job_Execution_Context\",\"parameters\":[{\"name\":\"jobExecutionId\",\"value\":\"{$Job.FirstStep.copado__JobExecution__c}\"},{\"name\":\"testIds\",\"value\":\"{$Context.JobExecution__r.DataJson.testIds}\"},{\"name\":\"consolidatedResultId\",\"value\":\"{$Context.JobExecution__r.DataJson.resultId}\"}]}",
          "copado__CustomType__c": "Salesforce Flow",
          "copado__JobTemplate__c": "a1b5w00000EDHLiAAP",
          "copado__Order__c": 2,
          "copado__Type__c": "Flow",
          "Id": "a1a5w00001EEXozAAH",
          "Name": "Get Parent Execution Context"
        },
        {
          "attributes": {
            "type": "copado__JobStep__c",
            "url": "/services/data/v56.0/sobjects/copado__JobStep__c/a1a5w00001EEXx0AAH"
          },
          "copado__ApiName__c": "Run SFDX Codeanalyzer DFA QIF_1_Get Parent Execution Context_2",
          "copado__ConfigJson__c": "{\"flowName\":\"copado_labs.Carry_Orchastrator_Job_Execution_Context\",\"parameters\":[{\"name\":\"jobExecutionId\",\"value\":\"{$Job.FirstStep.copado__JobExecution__c}\"},{\"name\":\"testIds\",\"value\":\"{$Context.JobExecution__r.DataJson.testIds}\"},{\"name\":\"consolidatedResultId\",\"value\":\"{$Context.JobExecution__r.DataJson.resultId}\"}]}",
          "copado__CustomType__c": "Salesforce Flow",
          "copado__JobTemplate__c": "a1b5w00000EDHMWAA5",
          "copado__Order__c": 2,
          "copado__Type__c": "Flow",
          "Id": "a1a5w00001EEXx0AAH",
          "Name": "Get Parent Execution Context"
        },
        {
          "attributes": {
            "type": "copado__JobStep__c",
            "url": "/services/data/v56.0/sobjects/copado__JobStep__c/a1a5w00001EEXx1AAH"
          },
          "copado__ApiName__c": "Run SFDX Codeanalyzer DFA QIF_1_Retrieve Branches_3",
          "copado__ConfigJson__c": "{\"flowName\":\"copadoQuality.RetrieveBranchesAndFileIdForPMDScan\",\"parameters\":[{\"name\":\"testIds\",\"value\":\"{$Context.JobExecution__r.DataJson.testIds}\"},{\"name\":\"jobExecutionId\",\"value\":\"{$Context.JobExecution__c}\"},{\"name\":\"extensionConfigurationId\",\"value\":\"{$Context.JobExecution__r.DataJson.extensionConfigurationId}\"},{\"name\":\"consolidatedResultId\",\"value\":\"{$Context.JobExecution__r.DataJson.resultId}\"}]}",
          "copado__CustomType__c": "Salesforce Flow",
          "copado__JobTemplate__c": "a1b5w00000EDHMWAA5",
          "copado__Order__c": 3,
          "copado__Type__c": "Flow",
          "Id": "a1a5w00001EEXx1AAH",
          "Name": "Retrieve Branches"
        },
        {
          "attributes": {
            "type": "copado__JobStep__c",
            "url": "/services/data/v56.0/sobjects/copado__JobStep__c/a1a5w00001EEXx2AAH"
          },
          "copado__ApiName__c": "Run SFDX Codeanalyzer DFA QIF_1_Run SFDX Code Analyzer_4",
          "copado__ConfigJson__c": "{\"functionName\":\"Run_CodeAnalyzer_DFA_QIF\",\"parameters\":[{\"name\":\"git_json\",\"value\":\"{$Context.Repository.Credential}\"},{\"name\":\"branchesAndFileIdJson\",\"value\":\"{$Job.PrevStep.ResultDataJson__c}\"},{\"name\":\"severityThreshold\",\"value\":\"2\"}]}",
          "copado__CustomType__c": "Function",
          "copado__JobTemplate__c": "a1b5w00000EDHMWAA5",
          "copado__Order__c": 4,
          "copado__Type__c": "Function",
          "Id": "a1a5w00001EEXx2AAH",
          "Name": "Run SFDX Code Analyzer"
        },
        {
          "attributes": {
            "type": "copado__JobStep__c",
            "url": "/services/data/v56.0/sobjects/copado__JobStep__c/a1a5w00001EEXx3AAH"
          },
          "copado__ApiName__c": "Run SFDX Codeanalyzer DFA QIF_1_Set Repository For Scan_1",
          "copado__ConfigJson__c": "{\"flowName\":\"copadoQuality.SetRepositoryForPMDScan\",\"parameters\":[{\"name\":\"testIds\",\"value\":\"{$Context.JobExecution__r.DataJson.testIds}\"},{\"name\":\"jobStepToUpdate\",\"value\":\"{$Job.Step.Run SFDX Code Analyzer.Id}\"}]}",
          "copado__CustomType__c": "Salesforce Flow",
          "copado__JobTemplate__c": "a1b5w00000EDHMWAA5",
          "copado__Order__c": 1,
          "copado__Type__c": "Flow",
          "Id": "a1a5w00001EEXx3AAH",
          "Name": "Set Repository For Scan"
        }
      ],
      "ObjectType": "copado__JobStep__c"
    }
  ],
  "blobsByUID": {}
}
