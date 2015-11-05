/*
AWS Service Factory

This component creates AWS service objects based on the parameter passed in.

Author: Brian Klaas (bklaas@jhu.edu)
(c) 2015, The Johns Hopkins Bloomberg School of Public Health Center for Teaching and Learning

*/

component output="false" hint="A utility for creating AWS Service objects." {

	/**
	*	@description Component initialization
	*/
	public any function init() {
		var credentialsConfig = CreateObject('component','awsCredentials').init();
		variables.awsCredentials = CreateObject('java','com.amazonaws.auth.BasicAWSCredentials').init(credentialsConfig.accessKey, credentialsConfig.secretKey);
		return this;
	}

	/**
	*	@description Creates a service object based on the service name provided
	*	@requiredArguments
	*		- serviceName = Name of the service we want to use. Currently supports SNS, Lambda, and DynamoDB.
	*/
	public any function createServiceObject(required string serviceName) {
		var serviceObject = 0;
		switch(lcase(arguments.serviceName)){
			case 'sns':
				serviceObject = CreateObject('java', 'com.amazonaws.services.sns.AmazonSNSClient').init(variables.awsCredentials);
				break;
			case 'lambda':
				serviceObject = CreateObject('java', 'com.amazonaws.services.lambda.AWSLambdaClient').init(variables.awsCredentials);
				break;
			case 'dynamodb':
				serviceObject = CreateObject('java', 'com.amazonaws.services.dynamodbv2.AmazonDynamoDBClient').init(variables.awsCredentials);
				break;

			default:
				throw(message="Unsupported service requested", detail="You have requested an AWS service (#arguments.serviceName#) which is not supported at this time.");
				break;
		}
		return serviceObject;
	}

}