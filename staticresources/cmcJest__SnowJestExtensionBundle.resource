{
  "recordTypeMap": {},
  "RecordSetBundles": [
    {
      "Records": [
        {
          "attributes": {
            "type": "copado__ExtensionConfiguration__c",
            "url": "/services/data/v56.0/sobjects/copado__ExtensionConfiguration__c/a0h3G000000Xgh3QAC"
          },
          "copado__AcceptanceCriteria__c": "{\n    \"numFailedTests\": {\n        \"errorDescription\": \"There should not be more than 5 failed test\",\n        \"value\": 5,\n        \"findingOperators\": \"Less than\"\n    },\n    \"numPassedTests\": {\n        \"errorDescription\": \"There should be more than 15 passed test\",\n        \"value\": 15,\n        \"findingOperators\": \"Equals or Greater than\"\n    }\n}",
          "copado__Active__c": true,
          "copado__ExtensionApplication__c": "Test",
          "copado__ExtensionTool__c": "JEST",
          "copado__Status__c": "Inactive",
          "copado__TestType__c": "Unit Test",
          "Id": "a0h3G000000Xgh3QAC",
          "LastReferencedDate": "2022-10-21T17:27:00.000+0000",
          "LastViewedDate": "2022-10-21T17:27:00.000+0000",
          "Name": "ServiceNow JEST Config"
        }
      ],
      "ObjectType": "copado__ExtensionConfiguration__c"
    },
    {
      "Records": [
        {
          "attributes": {
            "type": "copado__Function__c",
            "url": "/services/data/v56.0/sobjects/copado__Function__c/a0n3G000000cOMRQA2"
          },
          "copado__API_Name__c": "runJest",
          "copado__Image_Name__c": "copado-multicloud-servicenow:v2",
          "copado__Options__c": "[ ]",
          "copado__Parameters__c": "[ {\n  \"required\" : true,\n  \"name\" : \"git_json\",\n  \"defaultValue\" : \"{$Context.Repository.Credential}\"\n}, {\n  \"name\" : \"originBranch\",\n  \"defaultValue\" : \"{$Context.Apex.cmcJest.GetOriginBranch}\"\n}, {\n  \"name\" : \"testResultIds\",\n  \"defaultValue\" : \"{$Context.JobExecution__r.DataJson.resultIds}\"\n}, {\n  \"name\" : \"consolidatedResultId\",\n  \"defaultValue\" : \"{$Context.JobExecution__r.DataJson.resultId}\"\n} ]",
          "copado__Script__c": "gitSetup() {    \n      copado -p \"Fetching Git branches: $originBranch\"\n      mkdir repository && cd repository\n      #cd /app\n      git_depth=${git_depth:-100}\n      copado-git-get --depth \"$git_depth\" \"$originBranch\"\n}\n# Function to install LWC Jest dependencies.\n# Will create or update the package.json with { \"test:lwc\" : \"lwc-jest\" } to the scripts property.\n# No arguments.\n\nfunction verify_default_path_directories() {\n  if [ ! -f \"sfdx-project.json\" ]; then\n    copado -p \"Verify sfdx-project.json\"\n    tmp='{\"packageDirectories\":[{\"path\":\"src\"},{\"path\":\"records\"},{\"path\":\"scripts\"},{\"path\":\"__test__\"}],\"sourceApiVersion\": \"47.0\"}';\n    echo $tmp > sfdx-project.json\n  fi\n}\n    \nfunction install_lwc_jest() {\n\n  # Create a default package.json if file doesn't exist\n  if [ ! -f \"package.json\" ]; then\ncopado -p \"Initialising npm\"\n    npm init -y\n  fi\n\n  # Now that we have package.json to store dependency references to\n  # and to run our lwc jest test scripts, run npm installer\n  #copado -p \"Installing @sfdx-lwc-jest\"\n  npm install\n  #npm install jq --save-dev\n  \n  # Check if the scripts property in package.json contains key for \"test:unit\"\n  local scriptValue=$(jq -r '.scripts[\"test:unit\"]' < package.json)\n\n  # If no \"test:unit\" script properties, then add them\n  if [[ -z \"$scriptValue\" || $scriptValue == null ]]; then\n    local tmp=$(mktemp)\n    jq '.scripts[\"test:unit\"]=\"sfdx-lwc-jest\"' package.json > $tmp\n    jq '.scripts[\"test:unit:debug\"]=\"sfdx-lwc-jest --debug\"' package.json > $tmp\n    jq '.scripts[\"test:unit:coverage\"]=\"sfdx-lwc-jest --coverage\"' package.json > $tmp\n    jq '.scripts[\"test:unit:copado\"]=\"sfdx-lwc-jest --coverage --verbose -- --json\"' package.json > $tmp\n    #jq '.scripts[\"test:unit:copado\"]=\"jest --coverage --verbose -- --json\"' package.json > $tmp\n    # jq '.scripts[\"test:unit:copado\"]=\"jest --coverage --verbose -- --json --config=jest.config.js\"' package.json > $tmp\n    mv $tmp package.json\n    echo \"added jest test:unit script properties to package.json\" >&2\n    cat package.json >&2\n  fi\n  \n  #npm install @salesforce/lwc-jest --save-dev\n  #npm install --save-dev jest\n}\n    \n# TODO\ngetDiffFiles() {\n    copado -p \"Fetching changes from $originBranch\"\n    git fetch\n    git checkout $originBranch\n    base=`git merge-base main HEAD`\necho $base\n    changes=$(git diff --name-only $base HEAD)\n    files=\"\"\necho \"found changes\"\n    for file in $changes;\n    do  \n        file=$(echo $file | sed 's/.*\\///')\n        files=\"$files$file,\"\n    done\n\n    files=${files::-1}\n    echo $files\n}\n\n# Checks if there are LWC Jest Test files in any of the package directories of sfdx-project.json.\n# This is necessary because npm will throw error if no test classes are found.\n# No arguments.\n# Returns `true` or `false`\n\nfunction check_has_jest_tests() {\n  echo $(ls)\n  local hasJestTests=true\n  for pkgDir in $(jq -r '.packageDirectories[].path' < sfdx-project.json)\n  do\n    if [ -f $pkgDir ]; then\n      local fileCnt=$(find $pkgDir -type f -path \"**/__tests__/*.test.ts\" | wc -l);\n      if [ $fileCnt -gt 0 ]; then\n        hasJestTests=true\n        copado -p \"Jest Tests found\"\n      fi\n    fi\n  done\n  echo $hasJestTests\n}\n\nfunction test_lwc_jest() {\n  echo $(ls)\n  copado -p \"Executing Jest Test\"\n  #local hasJestTests=$(check_has_jest_tests)\n  local hasJestTests=true\n  if [ $hasJestTests ]; then\n    copado -p \"Test execution in progress\"\n    local result=$(npm run test:unit:copado > jest-output.json || true)\n    \n    while [ ! -f jest-output.json ]\n    do\n      echo \"waiting tests to finish\"\n      sleep 5\n    done\n    cat jest-output.json >&2     \n    echo $result\n    attachTestResults\n  else\n    copado -p \"Skipping, nothing to test\"\n    echo 'Skipping lwc tests, found no jest tests in any package directories' >&2\n  fi\n}\n\nattachTestResults() {\n\tcopado -p \"Uploading Analysis Output\"\n  copado -u jest-output.json   \n\tif [ -n \"$testResultIds\" ];\n    then\n      testResultsIds=$(echo $testResultIds | sed -e \"s/\\[//g\" | sed -e \"s/\\]//g\" | sed -e \"s/ //g\" | xargs)\n       for testResultId in `echo $testResultsIds | sed 's/[)(]//g' | sed 's/,/ /g'`\n       do\n          copado -u jest-output.json --parentid $testResultId\n\t   done\n    fi\n    if [ -n \"$consolidatedResultId\" ];\n    then\n      copado -u jest-output.json --parentid $consolidatedResultId\n    fi\n}\n\ngitSetup\nverify_default_path_directories\ninstall_lwc_jest\n#getDiffFiles\ntest_lwc_jest",
          "copado__Type__c": "Custom",
          "Id": "a0n3G000000cOMRQA2",
          "LastReferencedDate": "2022-11-01T10:20:25.000+0000",
          "LastViewedDate": "2022-11-01T10:20:25.000+0000",
          "Name": "runJest"
        }
      ],
      "ObjectType": "copado__Function__c"
    },
    {
      "Records": [
        {
          "attributes": {
            "type": "copado__JobTemplate__c",
            "url": "/services/data/v56.0/sobjects/copado__JobTemplate__c/a0w3G0000012r2GQAQ"
          },
          "copado__ApiName__c": "JEST_1",
          "copado__Type__c": "Custom",
          "copado__Version__c": 1,
          "Id": "a0w3G0000012r2GQAQ",
          "LastReferencedDate": "2022-11-01T10:20:39.000+0000",
          "LastViewedDate": "2022-11-01T10:20:39.000+0000",
          "Name": "JEST"
        }
      ],
      "ObjectType": "copado__JobTemplate__c"
    },
    {
      "Records": [
        {
          "attributes": {
            "type": "copado__JobStep__c",
            "url": "/services/data/v56.0/sobjects/copado__JobStep__c/a0v3G000000Whp6QAC"
          },
          "copado__ApiName__c": "JEST_1_Set Repository to Test_1",
          "copado__ConfigJson__c": "{\"flowName\":\"SetRepositoryForJESTScan\",\"parameters\":[{\"name\":\"testIds\",\"value\":\"{$Context.JobExecution__r.DataJson.testIds}\"},{\"name\":\"jobStepToUpdate\",\"value\":\"{$Job.Step.Execute JEST.Id}\"},{\"name\":\"resultId\",\"value\":\"{$Context.JobExecution__r.DataJson.resultId}\"}]}",
          "copado__CustomType__c": "Salesforce Flow",
          "copado__JobTemplate__c": "a0w3G0000012r2GQAQ",
          "copado__Order__c": 1,
          "copado__Type__c": "Flow",
          "Id": "a0v3G000000Whp6QAC",
          "Name": "Set Repository to Test"
        },
        {
          "attributes": {
            "type": "copado__JobStep__c",
            "url": "/services/data/v56.0/sobjects/copado__JobStep__c/a0v3G000000Whp7QAC"
          },
          "copado__ApiName__c": "JEST_1_Execute JEST_2",
          "copado__ConfigJson__c": "{\"functionName\":\"runJest\",\"parameters\":[{\"name\":\"git_json\",\"value\":\"{$Context.Repository.Credential}\",\"required\":true},{\"name\":\"originBranch\",\"value\":\"{$Context.Apex.cmcJest.GetOriginBranch}\"},{\"name\":\"testResultIds\",\"value\":\"{$Context.JobExecution__r.DataJson.resultIds}\"},{\"name\":\"consolidatedResultId\",\"value\":\"{$Context.JobExecution__r.DataJson.resultId}\"}]}",
          "copado__CustomType__c": "Function",
          "copado__JobTemplate__c": "a0w3G0000012r2GQAQ",
          "copado__Order__c": 2,
          "copado__Type__c": "Function",
          "Id": "a0v3G000000Whp7QAC",
          "Name": "Execute JEST"
        },
        {
          "attributes": {
            "type": "copado__JobStep__c",
            "url": "/services/data/v56.0/sobjects/copado__JobStep__c/a0v3G000000WlZkQAK"
          },
          "copado__ApiName__c": "JEST_1_Evaluate Acceptance Criteria_3",
          "copado__ConfigJson__c": "{\"functionName\":\"Evaluate_Acceptance_Criteria\",\"parameters\":[{\"name\":\"acceptanceCriteria\",\"value\":\"{$Context.JobExecution__r.DataJson.acceptanceCriteria}\"},{\"name\":\"jestOutputFileId\",\"value\":\"{$Context.Apex.cmcJest.GetJestOutputFileVersionId}\"},{\"name\":\"jestOutputFileName\",\"value\":\"jest-output.json\"}]}",
          "copado__CustomType__c": "Function",
          "copado__JobTemplate__c": "a0w3G0000012r2GQAQ",
          "copado__Order__c": 3,
          "copado__Type__c": "Function",
          "Id": "a0v3G000000WlZkQAK",
          "Name": "Evaluate Acceptance Criteria"
        }
      ],
      "ObjectType": "copado__JobStep__c"
    }
  ],
  "blobsByUID": {}
}