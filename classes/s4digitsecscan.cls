public with sharing class s4digitsecscan {
    public Integer Critical {get;set;} 
		public Integer High {get;set;} 
		public Integer Medium {get;set;} 
		public Integer Low {get;set;} 
		public Integer Info {get;set;} 
		public String status {get;set;} 
		public Boolean autoscan {get;set;} 
		public Boolean Findings_new {get;set;} 
		public String scan_type {get;set;} 
		public String repo_id {get;set;} 
		public String repo_name {get;set;} 
		public Boolean isSecurityGatePassed {get;set;} 
		public String scanid {get;set;} 
		public String Org_Id {get;set;} 
		public String Created_date {get;set;} 
		public String Initiated_Scan_date {get;set;} 

		public S4digitsecscan(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'Critical') {
							Critical = parser.getIntegerValue();
						} else if (text == 'High') {
							High = parser.getIntegerValue();
						} else if (text == 'Medium') {
							Medium = parser.getIntegerValue();
						} else if (text == 'Low') {
							Low = parser.getIntegerValue();
						} else if (text == 'Info') {
							Info = parser.getIntegerValue();
						} else if (text == 'status') {
							status = parser.getText();
						} else if (text == 'autoscan') {
							autoscan = parser.getBooleanValue();
						} else if (text == 'Findings_new') {
							Findings_new = parser.getBooleanValue();
						} else if (text == 'scan_type') {
							scan_type = parser.getText();
						} else if (text == 'repo_id') {
							repo_id = parser.getText();
						} else if (text == 'repo_name') {
							repo_name = parser.getText();
						} else if (text == 'isSecurityGatePassed') {
							isSecurityGatePassed = parser.getBooleanValue();
						} else if (text == 'scanid') {
							scanid = parser.getText();
						} else if (text == 'Org_Id') {
							Org_Id = parser.getText();
						} else if (text == 'Created_date') {
							Created_date = parser.getText();
						} else if (text == 'Initiated_Scan_date') {
							Initiated_Scan_date = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'S4digitsecscan consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	
	
	public static S4digitsecscan parse(String json) {
		System.JSONParser parser = System.JSON.createParser(json);
		return new S4digitsecscan(parser);
	}
	
	public static void consumeObject(System.JSONParser parser) {
		Integer depth = 0;
		do {
			System.JSONToken curr = parser.getCurrentToken();
			if (curr == System.JSONToken.START_OBJECT || 
				curr == System.JSONToken.START_ARRAY) {
				depth++;
			} else if (curr == System.JSONToken.END_OBJECT ||
				curr == System.JSONToken.END_ARRAY) {
				depth--;
			}
		} while (depth > 0 && parser.nextToken() != null);
	}
}