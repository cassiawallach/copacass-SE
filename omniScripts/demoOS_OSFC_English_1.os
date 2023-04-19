<?xml version="1.0" encoding="UTF-8"?>
<OmniScript xmlns="http://soap.sforce.com/2006/04/metadata">
    <elementTypeComponentMapping>{
  &quot;ElementTypeToHTMLTemplateList&quot; : [ ]
}</elementTypeComponentMapping>
    <isActive>false</isActive>
    <isIntegrationProcedure>false</isIntegrationProcedure>
    <isMetadataCacheDisabled>false</isMetadataCacheDisabled>
    <isOmniScriptEmbeddable>false</isOmniScriptEmbeddable>
    <isTestProcedure>false</isTestProcedure>
    <isWebCompEnabled>true</isWebCompEnabled>
    <language>English</language>
    <name>demoPassDataLWCOStoFC</name>
    <omniProcessElements>
        <isActive>true</isActive>
        <isOmniScriptEmbeddable>false</isOmniScriptEmbeddable>
        <level>0.0</level>
        <name>SetValues1</name>
        <omniProcessVersionNumber>0.0</omniProcessVersionNumber>
        <propertySetConfig>{
  &quot;controlWidth&quot; : 12,
  &quot;label&quot; : &quot;SetValues1&quot;,
  &quot;elementValueMap&quot; : {
    &quot;ContextId&quot; : &quot;001Dn0000066Fc5IAE&quot;,
    &quot;parentObj&quot; : {
      &quot;Id&quot; : &quot;001Dn0000066Fc5IAE&quot;,
      &quot;PostalCode&quot; : &quot;90048&quot;
    },
    &quot;accountsList&quot; : [ {
      &quot;Id&quot; : &quot;73989123456&quot;,
      &quot;Name&quot; : &quot;Dora Milaje&quot;,
      &quot;Phone&quot; : &quot;221-77-122-10-99&quot;,
      &quot;BillingCity&quot; : &quot;Wakanda City&quot;,
      &quot;BillingCountry&quot; : &quot;Wakanda&quot;
    }, {
      &quot;Id&quot; : &quot;93849829473D&quot;,
      &quot;Name&quot; : &quot;Helen of Troy&quot;,
      &quot;Phone&quot; : &quot;30-21-0325-9000&quot;,
      &quot;BillingCity&quot; : &quot;Athens&quot;,
      &quot;BillingCountry&quot; : &quot;Greece&quot;
    } ]
  },
  &quot;showPersistentComponent&quot; : [ true, false ],
  &quot;show&quot; : null,
  &quot;HTMLTemplateId&quot; : &quot;&quot;,
  &quot;wpm&quot; : false,
  &quot;ssm&quot; : false,
  &quot;message&quot; : { },
  &quot;pubsub&quot; : false
}</propertySetConfig>
        <sequenceNumber>0.0</sequenceNumber>
        <type>Set Values</type>
    </omniProcessElements>
    <omniProcessElements>
        <childElements>
            <isActive>true</isActive>
            <isOmniScriptEmbeddable>false</isOmniScriptEmbeddable>
            <level>1.0</level>
            <name>FlexCard1</name>
            <omniProcessVersionNumber>0.0</omniProcessVersionNumber>
            <propertySetConfig>{
  &quot;customAttributes&quot; : [ {
    &quot;name&quot; : &quot;parent-attribute&quot;,
    &quot;source&quot; : &quot;%parentObj%&quot;
  } ],
  &quot;bStandalone&quot; : false,
  &quot;lwcName&quot; : &quot;cfDemoPassDataParentAttributeFC&quot;,
  &quot;hide&quot; : false,
  &quot;conditionType&quot; : &quot;Hide if False&quot;,
  &quot;show&quot; : null,
  &quot;label&quot; : &quot;FlexCard1&quot;,
  &quot;controlWidth&quot; : 12
}</propertySetConfig>
            <sequenceNumber>2.0</sequenceNumber>
            <type>Custom Lightning Web Component</type>
        </childElements>
        <childElements>
            <isActive>true</isActive>
            <isOmniScriptEmbeddable>false</isOmniScriptEmbeddable>
            <level>1.0</level>
            <name>FlexCard2</name>
            <omniProcessVersionNumber>0.0</omniProcessVersionNumber>
            <propertySetConfig>{
  &quot;controlWidth&quot; : 12,
  &quot;label&quot; : &quot;CustomLWC1&quot;,
  &quot;show&quot; : null,
  &quot;conditionType&quot; : &quot;Hide if False&quot;,
  &quot;hide&quot; : false,
  &quot;lwcName&quot; : &quot;cfDemoPassDataRecordIdFC&quot;,
  &quot;bStandalone&quot; : false,
  &quot;customAttributes&quot; : [ {
    &quot;name&quot; : &quot;record-id&quot;,
    &quot;source&quot; : &quot;%ContextId%&quot;
  } ]
}</propertySetConfig>
            <sequenceNumber>5.0</sequenceNumber>
            <type>Custom Lightning Web Component</type>
        </childElements>
        <childElements>
            <isActive>true</isActive>
            <isOmniScriptEmbeddable>false</isOmniScriptEmbeddable>
            <level>1.0</level>
            <name>FlexCard3</name>
            <omniProcessVersionNumber>0.0</omniProcessVersionNumber>
            <propertySetConfig>{
  &quot;customAttributes&quot; : [ {
    &quot;source&quot; : &quot;%ContextId%&quot;,
    &quot;name&quot; : &quot;record-id&quot;
  } ],
  &quot;bStandalone&quot; : false,
  &quot;lwcName&quot; : &quot;cfDemoPassDataRecordIdDRFC&quot;,
  &quot;hide&quot; : false,
  &quot;conditionType&quot; : &quot;Hide if False&quot;,
  &quot;show&quot; : null,
  &quot;label&quot; : &quot;CustomLWC1&quot;,
  &quot;controlWidth&quot; : 12
}</propertySetConfig>
            <sequenceNumber>6.0</sequenceNumber>
            <type>Custom Lightning Web Component</type>
        </childElements>
        <childElements>
            <isActive>true</isActive>
            <isOmniScriptEmbeddable>false</isOmniScriptEmbeddable>
            <level>1.0</level>
            <name>FlexCard4</name>
            <omniProcessVersionNumber>0.0</omniProcessVersionNumber>
            <propertySetConfig>{
  &quot;controlWidth&quot; : 12,
  &quot;label&quot; : &quot;CustomLWC1&quot;,
  &quot;show&quot; : null,
  &quot;conditionType&quot; : &quot;Hide if False&quot;,
  &quot;hide&quot; : false,
  &quot;lwcName&quot; : &quot;cfDemoPassDataParentDataRecordsFC&quot;,
  &quot;bStandalone&quot; : false,
  &quot;customAttributes&quot; : [ {
    &quot;name&quot; : &quot;parent-data&quot;,
    &quot;source&quot; : &quot;true&quot;
  }, {
    &quot;name&quot; : &quot;records&quot;,
    &quot;source&quot; : &quot;%accountsList%&quot;
  } ]
}</propertySetConfig>
            <sequenceNumber>9.0</sequenceNumber>
            <type>Custom Lightning Web Component</type>
        </childElements>
        <childElements>
            <isActive>true</isActive>
            <isOmniScriptEmbeddable>false</isOmniScriptEmbeddable>
            <level>1.0</level>
            <name>LineBreak1</name>
            <omniProcessVersionNumber>0.0</omniProcessVersionNumber>
            <propertySetConfig>{
  &quot;label&quot; : &quot;LineBreak1&quot;,
  &quot;padding&quot; : 0,
  &quot;show&quot; : null,
  &quot;HTMLTemplateId&quot; : &quot;&quot;
}</propertySetConfig>
            <sequenceNumber>1.0</sequenceNumber>
            <type>Line Break</type>
        </childElements>
        <childElements>
            <isActive>true</isActive>
            <isOmniScriptEmbeddable>false</isOmniScriptEmbeddable>
            <level>1.0</level>
            <name>LineBreak2</name>
            <omniProcessVersionNumber>0.0</omniProcessVersionNumber>
            <propertySetConfig>{
  &quot;label&quot; : &quot;LineBreak2&quot;,
  &quot;padding&quot; : 0,
  &quot;show&quot; : null,
  &quot;HTMLTemplateId&quot; : &quot;&quot;
}</propertySetConfig>
            <sequenceNumber>4.0</sequenceNumber>
            <type>Line Break</type>
        </childElements>
        <childElements>
            <isActive>true</isActive>
            <isOmniScriptEmbeddable>false</isOmniScriptEmbeddable>
            <level>1.0</level>
            <name>LineBreak3</name>
            <omniProcessVersionNumber>0.0</omniProcessVersionNumber>
            <propertySetConfig>{
  &quot;label&quot; : &quot;LineBreak3&quot;,
  &quot;padding&quot; : 0,
  &quot;show&quot; : null,
  &quot;HTMLTemplateId&quot; : &quot;&quot;
}</propertySetConfig>
            <sequenceNumber>8.0</sequenceNumber>
            <type>Line Break</type>
        </childElements>
        <childElements>
            <isActive>true</isActive>
            <isOmniScriptEmbeddable>false</isOmniScriptEmbeddable>
            <level>1.0</level>
            <name>TextBlock1</name>
            <omniProcessVersionNumber>0.0</omniProcessVersionNumber>
            <propertySetConfig>{
  &quot;controlWidth&quot; : 12,
  &quot;label&quot; : &quot;TextBlock1&quot;,
  &quot;text&quot; : &quot;&lt;h2&gt;Property: record-id&lt;/h2&gt;\n&lt;h4&gt;&lt;span style=\&quot;color: #236fa1;\&quot;&gt;Pass the&amp;nbsp;&lt;span class=\&quot;guilabel taxonomy_source_doc-tag taxonomy_industry_cmt-tag taxonomy_industry_energy-tag taxonomy_industry_government-tag taxonomy_industry_health-tag taxonomy_industry_insurance-tag taxonomy_industry_media-tag taxonomy_industry_platform-tag taxonomy_industry_cmt-tag taxonomy_industry_energy-tag taxonomy_industry_government-tag taxonomy_industry_health-tag taxonomy_industry_insurance-tag taxonomy_industry_media-tag taxonomy_industry_platform-tag taxonomy_industry_cmt-tag taxonomy_industry_energy-tag taxonomy_industry_government-tag taxonomy_industry_health-tag taxonomy_industry_insurance-tag taxonomy_industry_media-tag taxonomy_industry_platform-tag taxonomy_industry_cmt-tag taxonomy_industry_energy-tag taxonomy_industry_government-tag taxonomy_industry_health-tag taxonomy_industry_insurance-tag taxonomy_industry_media-tag taxonomy_industry_platform-tag\&quot;&gt;recordId&lt;/span&gt; from the OmniScript to the FlexCard.&lt;/span&gt;&lt;/h4&gt;&quot;,
  &quot;show&quot; : null,
  &quot;dataJSON&quot; : false,
  &quot;HTMLTemplateId&quot; : &quot;&quot;,
  &quot;textKey&quot; : &quot;&quot;,
  &quot;sanitize&quot; : false
}</propertySetConfig>
            <sequenceNumber>3.0</sequenceNumber>
            <type>Text Block</type>
        </childElements>
        <childElements>
            <isActive>true</isActive>
            <isOmniScriptEmbeddable>false</isOmniScriptEmbeddable>
            <level>1.0</level>
            <name>TextBlock2</name>
            <omniProcessVersionNumber>0.0</omniProcessVersionNumber>
            <propertySetConfig>{
  &quot;controlWidth&quot; : 12,
  &quot;label&quot; : &quot;TextBlock2&quot;,
  &quot;text&quot; : &quot;&lt;h2&gt;Property: parent-attribute&lt;/h2&gt;\n&lt;h4&gt;&lt;span style=\&quot;color: #236fa1;\&quot;&gt;Pass a parent object from the OmniScript to the FlexCard. {Parent} merge field must be used on the FlexCard.&lt;/span&gt;&lt;/h4&gt;\n&lt;p&gt;&lt;/p&gt;&quot;,
  &quot;show&quot; : null,
  &quot;dataJSON&quot; : false,
  &quot;HTMLTemplateId&quot; : &quot;&quot;,
  &quot;textKey&quot; : &quot;&quot;,
  &quot;sanitize&quot; : false
}</propertySetConfig>
            <sequenceNumber>0.0</sequenceNumber>
            <type>Text Block</type>
        </childElements>
        <childElements>
            <isActive>true</isActive>
            <isOmniScriptEmbeddable>false</isOmniScriptEmbeddable>
            <level>1.0</level>
            <name>TextBlock3</name>
            <omniProcessVersionNumber>0.0</omniProcessVersionNumber>
            <propertySetConfig>{
  &quot;sanitize&quot; : false,
  &quot;textKey&quot; : &quot;&quot;,
  &quot;HTMLTemplateId&quot; : &quot;&quot;,
  &quot;dataJSON&quot; : false,
  &quot;show&quot; : null,
  &quot;text&quot; : &quot;&lt;h2&gt;Properties: parent-data, records&lt;/h2&gt;\n&lt;h4&gt;&lt;span style=\&quot;color: #236fa1;\&quot;&gt;Map data from the OmniScript Data JSON to data fields in the FlexCard.&lt;/span&gt;&lt;/h4&gt;&quot;,
  &quot;label&quot; : &quot;TextBlock1&quot;,
  &quot;controlWidth&quot; : 12
}</propertySetConfig>
            <sequenceNumber>7.0</sequenceNumber>
            <type>Text Block</type>
        </childElements>
        <isActive>true</isActive>
        <isOmniScriptEmbeddable>false</isOmniScriptEmbeddable>
        <level>0.0</level>
        <name>Step1</name>
        <omniProcessVersionNumber>0.0</omniProcessVersionNumber>
        <propertySetConfig>{
  &quot;label&quot; : &quot;Step 1&quot;,
  &quot;validationRequired&quot; : true,
  &quot;previousLabel&quot; : &quot;Previous&quot;,
  &quot;previousWidth&quot; : 3,
  &quot;nextLabel&quot; : &quot;Next&quot;,
  &quot;nextWidth&quot; : 3,
  &quot;cancelLabel&quot; : &quot;Cancel&quot;,
  &quot;cancelMessage&quot; : &quot;Are you sure?&quot;,
  &quot;saveLabel&quot; : &quot;Save for later&quot;,
  &quot;saveMessage&quot; : &quot;Are you sure you want to save it for later?&quot;,
  &quot;completeLabel&quot; : &quot;Complete&quot;,
  &quot;completeMessage&quot; : &quot;Are you sure you want to complete the script?&quot;,
  &quot;instruction&quot; : &quot;&quot;,
  &quot;showPersistentComponent&quot; : [ true, false ],
  &quot;remoteClass&quot; : &quot;&quot;,
  &quot;remoteMethod&quot; : &quot;&quot;,
  &quot;remoteTimeout&quot; : 30000,
  &quot;remoteOptions&quot; : { },
  &quot;knowledgeOptions&quot; : {
    &quot;language&quot; : &quot;English&quot;,
    &quot;publishStatus&quot; : &quot;Online&quot;,
    &quot;keyword&quot; : &quot;&quot;,
    &quot;dataCategoryCriteria&quot; : &quot;&quot;,
    &quot;remoteTimeout&quot; : 30000,
    &quot;typeFilter&quot; : &quot;&quot;
  },
  &quot;show&quot; : null,
  &quot;conditionType&quot; : &quot;Hide if False&quot;,
  &quot;HTMLTemplateId&quot; : &quot;&quot;,
  &quot;instructionKey&quot; : &quot;&quot;,
  &quot;chartLabel&quot; : null,
  &quot;allowSaveForLater&quot; : true,
  &quot;errorMessage&quot; : {
    &quot;custom&quot; : [ ],
    &quot;default&quot; : null
  },
  &quot;wpm&quot; : false,
  &quot;ssm&quot; : false,
  &quot;message&quot; : { },
  &quot;pubsub&quot; : false,
  &quot;businessCategory&quot; : &quot;&quot;,
  &quot;businessEvent&quot; : &quot;&quot;
}</propertySetConfig>
        <sequenceNumber>1.0</sequenceNumber>
        <type>Step</type>
    </omniProcessElements>
    <omniProcessType>OmniScript</omniProcessType>
    <propertySetConfig>{
  &quot;persistentComponent&quot; : [ {
    &quot;render&quot; : false,
    &quot;label&quot; : &quot;&quot;,
    &quot;remoteClass&quot; : &quot;&quot;,
    &quot;remoteMethod&quot; : &quot;&quot;,
    &quot;remoteTimeout&quot; : 30000,
    &quot;remoteOptions&quot; : {
      &quot;preTransformBundle&quot; : &quot;&quot;,
      &quot;postTransformBundle&quot; : &quot;&quot;
    },
    &quot;preTransformBundle&quot; : &quot;&quot;,
    &quot;postTransformBundle&quot; : &quot;&quot;,
    &quot;sendJSONPath&quot; : &quot;&quot;,
    &quot;sendJSONNode&quot; : &quot;&quot;,
    &quot;responseJSONPath&quot; : &quot;&quot;,
    &quot;responseJSONNode&quot; : &quot;&quot;,
    &quot;id&quot; : &quot;vlcCart&quot;,
    &quot;itemsKey&quot; : &quot;cartItems&quot;,
    &quot;modalConfigurationSetting&quot; : {
      &quot;modalHTMLTemplateId&quot; : &quot;vlcProductConfig.html&quot;,
      &quot;modalController&quot; : &quot;ModalProductCtrl&quot;,
      &quot;modalSize&quot; : &quot;lg&quot;
    }
  }, {
    &quot;render&quot; : false,
    &quot;dispOutsideOmni&quot; : false,
    &quot;label&quot; : &quot;&quot;,
    &quot;remoteClass&quot; : &quot;&quot;,
    &quot;remoteMethod&quot; : &quot;&quot;,
    &quot;remoteTimeout&quot; : 30000,
    &quot;remoteOptions&quot; : {
      &quot;preTransformBundle&quot; : &quot;&quot;,
      &quot;postTransformBundle&quot; : &quot;&quot;
    },
    &quot;preTransformBundle&quot; : &quot;&quot;,
    &quot;postTransformBundle&quot; : &quot;&quot;,
    &quot;id&quot; : &quot;vlcKnowledge&quot;,
    &quot;itemsKey&quot; : &quot;knowledgeItems&quot;,
    &quot;modalConfigurationSetting&quot; : {
      &quot;modalHTMLTemplateId&quot; : &quot;&quot;,
      &quot;modalController&quot; : &quot;&quot;,
      &quot;modalSize&quot; : &quot;lg&quot;
    }
  } ],
  &quot;allowSaveForLater&quot; : true,
  &quot;saveNameTemplate&quot; : null,
  &quot;saveExpireInDays&quot; : null,
  &quot;saveForLaterRedirectPageName&quot; : &quot;sflRedirect&quot;,
  &quot;saveForLaterRedirectTemplateUrl&quot; : &quot;vlcSaveForLaterAcknowledge.html&quot;,
  &quot;saveContentEncoded&quot; : false,
  &quot;saveObjectId&quot; : &quot;%ContextId%&quot;,
  &quot;saveURLPatterns&quot; : { },
  &quot;autoSaveOnStepNext&quot; : false,
  &quot;elementTypeToHTMLTemplateMapping&quot; : { },
  &quot;seedDataJSON&quot; : { },
  &quot;trackingCustomData&quot; : { },
  &quot;enableKnowledge&quot; : false,
  &quot;bLK&quot; : false,
  &quot;lkObjName&quot; : null,
  &quot;knowledgeArticleTypeQueryFieldsMap&quot; : { },
  &quot;timeTracking&quot; : false,
  &quot;hideStepChart&quot; : false,
  &quot;mergeSavedData&quot; : false,
  &quot;visualforcePagesAvailableInPreview&quot; : { },
  &quot;cancelType&quot; : &quot;SObject&quot;,
  &quot;allowCancel&quot; : true,
  &quot;cancelSource&quot; : &quot;%ContextId%&quot;,
  &quot;cancelRedirectPageName&quot; : &quot;OmniScriptCancelled&quot;,
  &quot;cancelRedirectTemplateUrl&quot; : &quot;vlcCancelled.html&quot;,
  &quot;consoleTabLabel&quot; : &quot;New&quot;,
  &quot;wpm&quot; : false,
  &quot;ssm&quot; : false,
  &quot;message&quot; : { },
  &quot;pubsub&quot; : false,
  &quot;autoFocus&quot; : false,
  &quot;currencyCode&quot; : &quot;&quot;,
  &quot;showInputWidth&quot; : false,
  &quot;rtpSeed&quot; : false,
  &quot;consoleTabTitle&quot; : null,
  &quot;consoleTabIcon&quot; : &quot;custom:custom18&quot;,
  &quot;errorMessage&quot; : {
    &quot;custom&quot; : [ ]
  },
  &quot;stylesheet&quot; : {
    &quot;newport&quot; : &quot;&quot;,
    &quot;lightning&quot; : &quot;&quot;,
    &quot;newportRtl&quot; : &quot;&quot;,
    &quot;lightningRtl&quot; : &quot;&quot;
  },
  &quot;stepChartPlacement&quot; : &quot;right&quot;,
  &quot;disableUnloadWarn&quot; : true,
  &quot;scrollBehavior&quot; : &quot;auto&quot;,
  &quot;currentLanguage&quot; : &quot;en_US&quot;
}</propertySetConfig>
    <subType>OSFC</subType>
    <type>demoOS</type>
    <uniqueName>demoOS_OSFC_English_1</uniqueName>
    <versionNumber>1.0</versionNumber>
    <webComponentKey>d7befbfe-e5d6-ee0c-ce14-e1df637ab7fe</webComponentKey>
</OmniScript>
