<?xml version="1.0" encoding="UTF-8"?>
<OmniScript xmlns="http://soap.sforce.com/2006/04/metadata">
    <elementTypeComponentMapping>{
  &quot;ElementTypeToHTMLTemplateList&quot; : [ ]
}</elementTypeComponentMapping>
    <isActive>true</isActive>
    <isIntegrationProcedure>false</isIntegrationProcedure>
    <isMetadataCacheDisabled>false</isMetadataCacheDisabled>
    <isOmniScriptEmbeddable>false</isOmniScriptEmbeddable>
    <isTestProcedure>false</isTestProcedure>
    <isWebCompEnabled>true</isWebCompEnabled>
    <language>English</language>
    <name>Team Edit Account</name>
    <omniProcessElements>
        <isActive>true</isActive>
        <isOmniScriptEmbeddable>false</isOmniScriptEmbeddable>
        <level>0.0</level>
        <name>IPGetAccountDetails</name>
        <omniProcessVersionNumber>0.0</omniProcessVersionNumber>
        <propertySetConfig>{
  &quot;HTMLTemplateId&quot; : &quot;&quot;,
  &quot;businessCategory&quot; : &quot;&quot;,
  &quot;businessEvent&quot; : &quot;&quot;,
  &quot;controlWidth&quot; : 12,
  &quot;enableActionMessage&quot; : false,
  &quot;enableDefaultAbort&quot; : false,
  &quot;errorMessage&quot; : {
    &quot;custom&quot; : [ ],
    &quot;default&quot; : null
  },
  &quot;extraPayload&quot; : {
    &quot;AccountId&quot; : &quot;%ContextId%&quot;
  },
  &quot;failureAbortLabel&quot; : &quot;Abort&quot;,
  &quot;failureAbortMessage&quot; : &quot;Are you sure?&quot;,
  &quot;failureGoBackLabel&quot; : &quot;Go Back&quot;,
  &quot;failureNextLabel&quot; : &quot;Continue&quot;,
  &quot;inProgressMessage&quot; : &quot;In Progress&quot;,
  &quot;integrationProcedureKey&quot; : &quot;team_getAccountDetails&quot;,
  &quot;label&quot; : &quot;IPGetAccountDetails&quot;,
  &quot;message&quot; : { },
  &quot;postMessage&quot; : &quot;Done&quot;,
  &quot;postTransformBundle&quot; : &quot;&quot;,
  &quot;preTransformBundle&quot; : &quot;&quot;,
  &quot;pubsub&quot; : false,
  &quot;redirectNextLabel&quot; : &quot;Next&quot;,
  &quot;redirectNextWidth&quot; : 3,
  &quot;redirectPageName&quot; : &quot;&quot;,
  &quot;redirectPreviousLabel&quot; : &quot;Previous&quot;,
  &quot;redirectPreviousWidth&quot; : 3,
  &quot;redirectTemplateUrl&quot; : &quot;vlcAcknowledge.html&quot;,
  &quot;remoteOptions&quot; : {
    &quot;chainable&quot; : false,
    &quot;postTransformBundle&quot; : &quot;&quot;,
    &quot;preTransformBundle&quot; : &quot;&quot;,
    &quot;useFuture&quot; : false
  },
  &quot;remoteTimeout&quot; : 30000,
  &quot;responseJSONNode&quot; : &quot;&quot;,
  &quot;responseJSONPath&quot; : &quot;&quot;,
  &quot;sendJSONNode&quot; : &quot;&quot;,
  &quot;sendJSONPath&quot; : &quot;&quot;,
  &quot;show&quot; : null,
  &quot;showPersistentComponent&quot; : [ true, false ],
  &quot;ssm&quot; : false,
  &quot;svgIcon&quot; : &quot;&quot;,
  &quot;svgSprite&quot; : &quot;&quot;,
  &quot;useContinuation&quot; : false,
  &quot;validationRequired&quot; : &quot;Step&quot;,
  &quot;wpm&quot; : false
}</propertySetConfig>
        <sequenceNumber>1.0</sequenceNumber>
        <type>Integration Procedure Action</type>
    </omniProcessElements>
    <omniProcessElements>
        <isActive>true</isActive>
        <isOmniScriptEmbeddable>false</isOmniScriptEmbeddable>
        <level>0.0</level>
        <name>IPSaveAccountDetails</name>
        <omniProcessVersionNumber>0.0</omniProcessVersionNumber>
        <propertySetConfig>{
  &quot;HTMLTemplateId&quot; : &quot;&quot;,
  &quot;businessCategory&quot; : &quot;&quot;,
  &quot;businessEvent&quot; : &quot;&quot;,
  &quot;controlWidth&quot; : 12,
  &quot;enableActionMessage&quot; : false,
  &quot;enableDefaultAbort&quot; : false,
  &quot;errorMessage&quot; : {
    &quot;custom&quot; : [ ],
    &quot;default&quot; : null
  },
  &quot;extraPayload&quot; : { },
  &quot;failureAbortLabel&quot; : &quot;Abort&quot;,
  &quot;failureAbortMessage&quot; : &quot;Are you sure?&quot;,
  &quot;failureGoBackLabel&quot; : &quot;Go Back&quot;,
  &quot;failureNextLabel&quot; : &quot;Continue&quot;,
  &quot;inProgressMessage&quot; : &quot;In Progress&quot;,
  &quot;integrationProcedureKey&quot; : &quot;team_saveAccountDetails&quot;,
  &quot;label&quot; : &quot;IPSaveAccountDetails&quot;,
  &quot;message&quot; : { },
  &quot;postMessage&quot; : &quot;Done&quot;,
  &quot;postTransformBundle&quot; : &quot;&quot;,
  &quot;preTransformBundle&quot; : &quot;&quot;,
  &quot;pubsub&quot; : false,
  &quot;redirectNextLabel&quot; : &quot;Next&quot;,
  &quot;redirectNextWidth&quot; : 3,
  &quot;redirectPageName&quot; : &quot;&quot;,
  &quot;redirectPreviousLabel&quot; : &quot;Previous&quot;,
  &quot;redirectPreviousWidth&quot; : 3,
  &quot;redirectTemplateUrl&quot; : &quot;vlcAcknowledge.html&quot;,
  &quot;remoteOptions&quot; : {
    &quot;chainable&quot; : false,
    &quot;postTransformBundle&quot; : &quot;&quot;,
    &quot;preTransformBundle&quot; : &quot;&quot;,
    &quot;useFuture&quot; : false
  },
  &quot;remoteTimeout&quot; : 30000,
  &quot;responseJSONNode&quot; : &quot;&quot;,
  &quot;responseJSONPath&quot; : &quot;&quot;,
  &quot;sendJSONNode&quot; : &quot;&quot;,
  &quot;sendJSONPath&quot; : &quot;&quot;,
  &quot;show&quot; : null,
  &quot;showPersistentComponent&quot; : [ true, false ],
  &quot;ssm&quot; : false,
  &quot;svgIcon&quot; : &quot;&quot;,
  &quot;svgSprite&quot; : &quot;&quot;,
  &quot;useContinuation&quot; : false,
  &quot;validationRequired&quot; : &quot;Step&quot;,
  &quot;wpm&quot; : false
}</propertySetConfig>
        <sequenceNumber>10.0</sequenceNumber>
        <type>Integration Procedure Action</type>
    </omniProcessElements>
    <omniProcessElements>
        <childElements>
            <isActive>true</isActive>
            <isOmniScriptEmbeddable>false</isOmniScriptEmbeddable>
            <level>1.0</level>
            <name>Currency</name>
            <omniProcessVersionNumber>0.0</omniProcessVersionNumber>
            <propertySetConfig>{
  &quot;HTMLTemplateId&quot; : &quot;&quot;,
  &quot;accessibleInFutureSteps&quot; : false,
  &quot;allowNegative&quot; : false,
  &quot;conditionType&quot; : &quot;Hide if False&quot;,
  &quot;controlWidth&quot; : 12,
  &quot;debounceValue&quot; : 0,
  &quot;defaultValue&quot; : null,
  &quot;disOnTplt&quot; : false,
  &quot;displayCurrencyCode&quot; : false,
  &quot;help&quot; : false,
  &quot;helpText&quot; : &quot;&quot;,
  &quot;helpTextPos&quot; : &quot;&quot;,
  &quot;hide&quot; : false,
  &quot;hideGroupSep&quot; : false,
  &quot;inputWidth&quot; : 12,
  &quot;label&quot; : &quot;Currency&quot;,
  &quot;mask&quot; : null,
  &quot;max&quot; : null,
  &quot;min&quot; : null,
  &quot;placeholder&quot; : &quot;&quot;,
  &quot;readOnly&quot; : false,
  &quot;repeat&quot; : false,
  &quot;repeatClone&quot; : false,
  &quot;repeatLimit&quot; : null,
  &quot;required&quot; : false,
  &quot;show&quot; : null,
  &quot;showInputWidth&quot; : false
}</propertySetConfig>
            <sequenceNumber>9.0</sequenceNumber>
            <type>Currency</type>
        </childElements>
        <childElements>
            <isActive>true</isActive>
            <isOmniScriptEmbeddable>false</isOmniScriptEmbeddable>
            <level>1.0</level>
            <name>LineBreak1</name>
            <omniProcessVersionNumber>0.0</omniProcessVersionNumber>
            <propertySetConfig>{
  &quot;HTMLTemplateId&quot; : &quot;&quot;,
  &quot;label&quot; : &quot;LineBreak1&quot;,
  &quot;padding&quot; : 0,
  &quot;show&quot; : null
}</propertySetConfig>
            <sequenceNumber>4.0</sequenceNumber>
            <type>Line Break</type>
        </childElements>
        <childElements>
            <isActive>true</isActive>
            <isOmniScriptEmbeddable>false</isOmniScriptEmbeddable>
            <level>1.0</level>
            <name>LineBreak2</name>
            <omniProcessVersionNumber>0.0</omniProcessVersionNumber>
            <propertySetConfig>{
  &quot;HTMLTemplateId&quot; : &quot;&quot;,
  &quot;label&quot; : &quot;LineBreak2&quot;,
  &quot;padding&quot; : 0,
  &quot;show&quot; : null
}</propertySetConfig>
            <sequenceNumber>6.0</sequenceNumber>
            <type>Line Break</type>
        </childElements>
        <childElements>
            <isActive>true</isActive>
            <isOmniScriptEmbeddable>false</isOmniScriptEmbeddable>
            <level>1.0</level>
            <name>LineBreak4</name>
            <omniProcessVersionNumber>0.0</omniProcessVersionNumber>
            <propertySetConfig>{
  &quot;HTMLTemplateId&quot; : &quot;&quot;,
  &quot;label&quot; : &quot;LineBreak4&quot;,
  &quot;padding&quot; : 0,
  &quot;show&quot; : null
}</propertySetConfig>
            <sequenceNumber>8.0</sequenceNumber>
            <type>Line Break</type>
        </childElements>
        <childElements>
            <isActive>true</isActive>
            <isOmniScriptEmbeddable>false</isOmniScriptEmbeddable>
            <level>1.0</level>
            <name>Name</name>
            <omniProcessVersionNumber>0.0</omniProcessVersionNumber>
            <propertySetConfig>{
  &quot;HTMLTemplateId&quot; : &quot;&quot;,
  &quot;accessibleInFutureSteps&quot; : false,
  &quot;autocomplete&quot; : null,
  &quot;conditionType&quot; : &quot;Hide if False&quot;,
  &quot;controlWidth&quot; : 12,
  &quot;debounceValue&quot; : 0,
  &quot;defaultValue&quot; : null,
  &quot;disOnTplt&quot; : false,
  &quot;help&quot; : false,
  &quot;helpText&quot; : &quot;&quot;,
  &quot;helpTextPos&quot; : &quot;&quot;,
  &quot;hide&quot; : false,
  &quot;inputWidth&quot; : 12,
  &quot;label&quot; : &quot;Name&quot;,
  &quot;mask&quot; : &quot;&quot;,
  &quot;maxLength&quot; : 255,
  &quot;minLength&quot; : 0,
  &quot;pattern&quot; : &quot;&quot;,
  &quot;placeholder&quot; : &quot;PlaceHolder Inc&quot;,
  &quot;ptrnErrText&quot; : &quot;&quot;,
  &quot;readOnly&quot; : true,
  &quot;repeat&quot; : false,
  &quot;repeatClone&quot; : false,
  &quot;repeatLimit&quot; : null,
  &quot;required&quot; : false,
  &quot;show&quot; : null,
  &quot;showInputWidth&quot; : false
}</propertySetConfig>
            <sequenceNumber>3.0</sequenceNumber>
            <type>Text</type>
        </childElements>
        <childElements>
            <isActive>true</isActive>
            <isOmniScriptEmbeddable>false</isOmniScriptEmbeddable>
            <level>1.0</level>
            <name>Phone</name>
            <omniProcessVersionNumber>0.0</omniProcessVersionNumber>
            <propertySetConfig>{
  &quot;HTMLTemplateId&quot; : &quot;&quot;,
  &quot;accessibleInFutureSteps&quot; : false,
  &quot;autocomplete&quot; : null,
  &quot;conditionType&quot; : &quot;Hide if False&quot;,
  &quot;controlWidth&quot; : 12,
  &quot;debounceValue&quot; : 0,
  &quot;defaultValue&quot; : null,
  &quot;disOnTplt&quot; : false,
  &quot;help&quot; : false,
  &quot;helpText&quot; : &quot;&quot;,
  &quot;helpTextPos&quot; : &quot;&quot;,
  &quot;hide&quot; : false,
  &quot;inputWidth&quot; : 12,
  &quot;label&quot; : &quot;Phone&quot;,
  &quot;mask&quot; : &quot;&quot;,
  &quot;maxLength&quot; : 255,
  &quot;minLength&quot; : 0,
  &quot;pattern&quot; : &quot;&quot;,
  &quot;placeholder&quot; : &quot;&quot;,
  &quot;ptrnErrText&quot; : &quot;&quot;,
  &quot;readOnly&quot; : false,
  &quot;repeat&quot; : false,
  &quot;repeatClone&quot; : false,
  &quot;repeatLimit&quot; : null,
  &quot;required&quot; : true,
  &quot;show&quot; : null,
  &quot;showInputWidth&quot; : false
}</propertySetConfig>
            <sequenceNumber>5.0</sequenceNumber>
            <type>Telephone</type>
        </childElements>
        <childElements>
            <isActive>true</isActive>
            <isOmniScriptEmbeddable>false</isOmniScriptEmbeddable>
            <level>1.0</level>
            <name>Website</name>
            <omniProcessVersionNumber>0.0</omniProcessVersionNumber>
            <propertySetConfig>{
  &quot;HTMLTemplateId&quot; : &quot;&quot;,
  &quot;accessibleInFutureSteps&quot; : false,
  &quot;conditionType&quot; : &quot;Hide if False&quot;,
  &quot;controlWidth&quot; : 12,
  &quot;debounceValue&quot; : 0,
  &quot;defaultValue&quot; : null,
  &quot;disOnTplt&quot; : false,
  &quot;help&quot; : false,
  &quot;helpText&quot; : &quot;&quot;,
  &quot;helpTextPos&quot; : &quot;&quot;,
  &quot;hide&quot; : false,
  &quot;inputWidth&quot; : 12,
  &quot;label&quot; : &quot;Website&quot;,
  &quot;placeholder&quot; : &quot;&quot;,
  &quot;ptrnErrText&quot; : &quot;&quot;,
  &quot;readOnly&quot; : false,
  &quot;repeat&quot; : false,
  &quot;repeatClone&quot; : false,
  &quot;repeatLimit&quot; : null,
  &quot;required&quot; : false,
  &quot;show&quot; : null,
  &quot;showInputWidth&quot; : false
}</propertySetConfig>
            <sequenceNumber>7.0</sequenceNumber>
            <type>URL</type>
        </childElements>
        <isActive>true</isActive>
        <isOmniScriptEmbeddable>false</isOmniScriptEmbeddable>
        <level>0.0</level>
        <name>StepAccount</name>
        <omniProcessVersionNumber>0.0</omniProcessVersionNumber>
        <propertySetConfig>{
  &quot;HTMLTemplateId&quot; : &quot;&quot;,
  &quot;allowSaveForLater&quot; : true,
  &quot;businessCategory&quot; : &quot;&quot;,
  &quot;businessEvent&quot; : &quot;&quot;,
  &quot;cancelLabel&quot; : &quot;Cancel&quot;,
  &quot;cancelMessage&quot; : &quot;Are you sure?&quot;,
  &quot;chartLabel&quot; : null,
  &quot;completeLabel&quot; : &quot;Complete&quot;,
  &quot;completeMessage&quot; : &quot;Are you sure you want to complete the script?&quot;,
  &quot;conditionType&quot; : &quot;Hide if False&quot;,
  &quot;errorMessage&quot; : {
    &quot;custom&quot; : [ ],
    &quot;default&quot; : null
  },
  &quot;instruction&quot; : &quot;&quot;,
  &quot;instructionKey&quot; : &quot;&quot;,
  &quot;knowledgeOptions&quot; : {
    &quot;dataCategoryCriteria&quot; : &quot;&quot;,
    &quot;keyword&quot; : &quot;&quot;,
    &quot;language&quot; : &quot;English&quot;,
    &quot;publishStatus&quot; : &quot;Online&quot;,
    &quot;remoteTimeout&quot; : 30000,
    &quot;typeFilter&quot; : &quot;&quot;
  },
  &quot;label&quot; : &quot;StepAccount&quot;,
  &quot;message&quot; : { },
  &quot;nextLabel&quot; : &quot;Next&quot;,
  &quot;nextWidth&quot; : 3,
  &quot;previousLabel&quot; : &quot;Previous&quot;,
  &quot;previousWidth&quot; : 3,
  &quot;pubsub&quot; : false,
  &quot;remoteClass&quot; : &quot;&quot;,
  &quot;remoteMethod&quot; : &quot;&quot;,
  &quot;remoteOptions&quot; : { },
  &quot;remoteTimeout&quot; : 30000,
  &quot;saveLabel&quot; : &quot;Save for later&quot;,
  &quot;saveMessage&quot; : &quot;Are you sure you want to save it for later?&quot;,
  &quot;show&quot; : null,
  &quot;showPersistentComponent&quot; : [ true, false ],
  &quot;ssm&quot; : false,
  &quot;validationRequired&quot; : true,
  &quot;wpm&quot; : false
}</propertySetConfig>
        <sequenceNumber>2.0</sequenceNumber>
        <type>Step</type>
    </omniProcessElements>
    <omniProcessType>OmniScript</omniProcessType>
    <propertySetConfig>{
  &quot;allowCancel&quot; : true,
  &quot;allowSaveForLater&quot; : true,
  &quot;autoFocus&quot; : false,
  &quot;autoSaveOnStepNext&quot; : false,
  &quot;bLK&quot; : false,
  &quot;cancelRedirectPageName&quot; : &quot;OmniScriptCancelled&quot;,
  &quot;cancelRedirectTemplateUrl&quot; : &quot;vlcCancelled.html&quot;,
  &quot;cancelSource&quot; : &quot;%ContextId%&quot;,
  &quot;cancelType&quot; : &quot;SObject&quot;,
  &quot;consoleTabIcon&quot; : &quot;custom:custom18&quot;,
  &quot;consoleTabLabel&quot; : &quot;New&quot;,
  &quot;consoleTabTitle&quot; : null,
  &quot;currencyCode&quot; : &quot;&quot;,
  &quot;currentLanguage&quot; : &quot;en_US&quot;,
  &quot;disableUnloadWarn&quot; : true,
  &quot;elementTypeToHTMLTemplateMapping&quot; : { },
  &quot;enableKnowledge&quot; : false,
  &quot;errorMessage&quot; : {
    &quot;custom&quot; : [ ]
  },
  &quot;hideStepChart&quot; : true,
  &quot;knowledgeArticleTypeQueryFieldsMap&quot; : { },
  &quot;lkObjName&quot; : null,
  &quot;message&quot; : { },
  &quot;persistentComponent&quot; : [ {
    &quot;id&quot; : &quot;vlcCart&quot;,
    &quot;itemsKey&quot; : &quot;cartItems&quot;,
    &quot;label&quot; : &quot;&quot;,
    &quot;modalConfigurationSetting&quot; : {
      &quot;modalController&quot; : &quot;ModalProductCtrl&quot;,
      &quot;modalHTMLTemplateId&quot; : &quot;vlcProductConfig.html&quot;,
      &quot;modalSize&quot; : &quot;lg&quot;
    },
    &quot;postTransformBundle&quot; : &quot;&quot;,
    &quot;preTransformBundle&quot; : &quot;&quot;,
    &quot;remoteClass&quot; : &quot;&quot;,
    &quot;remoteMethod&quot; : &quot;&quot;,
    &quot;remoteOptions&quot; : {
      &quot;postTransformBundle&quot; : &quot;&quot;,
      &quot;preTransformBundle&quot; : &quot;&quot;
    },
    &quot;remoteTimeout&quot; : 30000,
    &quot;render&quot; : false,
    &quot;responseJSONNode&quot; : &quot;&quot;,
    &quot;responseJSONPath&quot; : &quot;&quot;,
    &quot;sendJSONNode&quot; : &quot;&quot;,
    &quot;sendJSONPath&quot; : &quot;&quot;
  }, {
    &quot;id&quot; : &quot;vlcKnowledge&quot;,
    &quot;itemsKey&quot; : &quot;knowledgeItems&quot;,
    &quot;label&quot; : &quot;&quot;,
    &quot;modalConfigurationSetting&quot; : {
      &quot;modalController&quot; : &quot;&quot;,
      &quot;modalHTMLTemplateId&quot; : &quot;&quot;,
      &quot;modalSize&quot; : &quot;lg&quot;
    },
    &quot;postTransformBundle&quot; : &quot;&quot;,
    &quot;preTransformBundle&quot; : &quot;&quot;,
    &quot;remoteClass&quot; : &quot;&quot;,
    &quot;remoteMethod&quot; : &quot;&quot;,
    &quot;remoteOptions&quot; : {
      &quot;postTransformBundle&quot; : &quot;&quot;,
      &quot;preTransformBundle&quot; : &quot;&quot;
    },
    &quot;remoteTimeout&quot; : 30000,
    &quot;render&quot; : false
  } ],
  &quot;pubsub&quot; : false,
  &quot;rtpSeed&quot; : false,
  &quot;saveContentEncoded&quot; : false,
  &quot;saveExpireInDays&quot; : null,
  &quot;saveForLaterRedirectPageName&quot; : &quot;sflRedirect&quot;,
  &quot;saveForLaterRedirectTemplateUrl&quot; : &quot;vlcSaveForLaterAcknowledge.html&quot;,
  &quot;saveNameTemplate&quot; : null,
  &quot;saveObjectId&quot; : &quot;%ContextId%&quot;,
  &quot;saveURLPatterns&quot; : { },
  &quot;seedDataJSON&quot; : { },
  &quot;showInputWidth&quot; : false,
  &quot;ssm&quot; : false,
  &quot;stepChartPlacement&quot; : &quot;right&quot;,
  &quot;stylesheet&quot; : {
    &quot;lightning&quot; : &quot;&quot;,
    &quot;lightningRtl&quot; : &quot;&quot;,
    &quot;newport&quot; : &quot;&quot;,
    &quot;newportRtl&quot; : &quot;&quot;
  },
  &quot;timeTracking&quot; : true,
  &quot;trackingCustomData&quot; : { },
  &quot;visualforcePagesAvailableInPreview&quot; : { },
  &quot;wpm&quot; : false
}</propertySetConfig>
    <subType>editAccount</subType>
    <type>team</type>
    <uniqueName>team_editAccount_English_2</uniqueName>
    <versionNumber>2.0</versionNumber>
    <webComponentKey>cb07cd0c-41f1-5f54-0cd3-47485c1cfb00</webComponentKey>
</OmniScript>
