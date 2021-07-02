component {

	this.name="apprunner";
	this.applicationTimeout = CreateTimeSpan(10, 0, 0, 0); //10 days
	this.sessionManagement=false;
	this.clientManagement=false;
	this.setClientCookies=false;

	function onApplicationStart() {
        if(!structKeyExists(application,"start")){
            application.start = 0;
        }else{
            application.start++;
        }
        application.version = "v7";

        var aws = new com.aws();
        var response = aws.secretsmanager.getSecretValue( 'DynamoID' );
        var secretValue = response.data.SecretString;

		application.counter = 0;
        application.cloud_credentials = {
            "vendorName" : "AWS",
            "region" : "ap-northeast-1",
            "accessKeyId" : listFirst(secretValue,":"),//server.system.environment.TestACCESS_KEY, 
            "secretAccessKey" : listLast(secretValue,":")//server.system.environment.TestSECRET_KEY
        };

		return true;
	}

    boolean function onRequestStart(string targetPage) {
        application.counter++;
        if(structKeyExists(url,"version")){
            writeDump(application.counter);
            writeDump(application.version);
            writeDump(application.start)
            abort;
        }
        
        return true;
   }

}