/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class AddGrokEmbeddingFlow {
    global AddGrokEmbeddingFlow() {

    }
    @InvocableMethod(label='Centro: Add/Remove Grok Knowledge')
    global static List<Centro.AddGrokEmbeddingFlow.GrokResult> AddGrokEmbedding(List<Centro.AddGrokEmbeddingFlow.GrokSettings> settings) {
        return null;
    }
global class GrokResult {
    global GrokResult() {

    }
}
global class GrokSettings {
    @InvocableVariable(label='Content Text or Html' required=false)
    global String content;
    @InvocableVariable(label='Remove existing knowledge with this URL. Default false.' required=false)
    global Boolean remove;
    @InvocableVariable(label='Knowledge Topic Name' required=true)
    global String topicName;
    @InvocableVariable(label='Source URL or Record Id (update if exists)' required=true)
    global String url;
    global GrokSettings() {

    }
}
}
