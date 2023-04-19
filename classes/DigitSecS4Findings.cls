public with sharing class DigitSecS4Findings {
	
    public String exploit {get;set;}
	public String scanId {get;set;} 
	public String severity {get;set;} 
	public String screenshots {get;set;} 
	public String remediationguidance {get;set;} 
	public Boolean isnew {get;set;} 
	public String status {get;set;} 
	public String traces {get;set;} 
	public String x_id {get;set;} // in json: _id
	public String orgId {get;set;} 
	public Integer line {get;set;} 
	public Integer col {get;set;} 
	public String filename {get;set;} 
	public String issuetype {get;set;} 
	public String founddate {get;set;} 
	public String updateddate {get;set;} 
	public Integer severityid {get;set;} 
	public String issue {get;set;} 
	public String description {get;set;} 
	public String codesnippets {get;set;} 
	public String assigned {get;set;} 
	public String hash {get;set;} 
	public Integer x_v {get;set;} // in json: __v

	public DigitSecS4Findings(JSONParser parser) {
		while (parser.nextToken() != System.JSONToken.END_OBJECT) {
			if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
				String text = parser.getText();
				if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
					if (text == 'scanId') {
						scanId = parser.getText();
                    } else if (text == 'exploit') {
						exploit = parser.getText();
					} else if (text == 'severity') {
						severity = parser.getText();
					} else if (text == 'screenshots') {
						screenshots = parser.getText();
					} else if (text == 'remediationguidance') {
						remediationguidance = parser.getText();
					} else if (text == 'isnew') {
						isnew = parser.getBooleanValue();
					} else if (text == 'status') {
						status = parser.getText();
					} else if (text == 'traces') {
						traces = parser.getText();
					} else if (text == '_id') {
						x_id = parser.getText();
					} else if (text == 'orgId') {
						orgId = parser.getText();
					} else if (text == 'line') {
						line = parser.getIntegerValue();
					} else if (text == 'col') {
						col = parser.getIntegerValue();
					} else if (text == 'filename') {
						filename = parser.getText();
					} else if (text == 'issuetype') {
						issuetype = parser.getText();
					} else if (text == 'founddate') {
						founddate = parser.getText();
					} else if (text == 'updateddate') {
						updateddate = parser.getText();
					} else if (text == 'severityid') {
						severityid = parser.getIntegerValue();
					} else if (text == 'issue') {
						issue = parser.getText();
					} else if (text == 'description') {
						description = parser.getText();
					} else if (text == 'codesnippets') {
						codesnippets = parser.getText();
					} else if (text == 'assigned') {
						assigned = parser.getText();
					} else if (text == 'hash') {
						hash = parser.getText();
					} else if (text == 'history') {
						//history = arrayOfScreenshots(parser);
					} else if (text == 'comments') {
						//comments = arrayOfScreenshots(parser);
					} else if (text == '__v') {
						x_v = parser.getIntegerValue();
					} else if (text == 'codeSnippet') {
						codesnippets = parser.getText();
					} 
                    else {
						System.debug(LoggingLevel.WARN, 'DigitSecS4Findings consuming unrecognized property: '+text);
					}
				}
			}
		}
	}
	
	
	public static DigitSecS4Findings parse(String json) {
		System.JSONParser parser = System.JSON.createParser(json);
		return new DigitSecS4Findings(parser);
	}
	



}