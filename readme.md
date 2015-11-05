# Demos for "Expand Your ColdFusion App Power with Amazon Web Services"

There are three requirements for getting these demos working. I know that sounds like a lot, but we're dealing with a series of external services in these demos, and each must be set up correctly. (And I haven't learned CloudFormation well enough to set everything up in a single CloudFormation script.)

1. Add the AWS SDK .jar and related files to your CF install.
2. Set up your own AWS credentials and add them to awsCredentials.cfc.
3. Set up your own copies of the required resources in SNS, Lambda, and DynamoDB.

### Requirement One: The AWS SDK .jar and Related Files

The demos in this repo require that you have the following .jar files in your /coldfusion/lib/ directory:

- aws-java-sdk-1.10.30 or later
- jackson-annotations
- jackson-core
- jackson-databind
- joda-time

All of these files can be downloaded from [https://aws.amazon.com/sdk-for-java/](https://aws.amazon.com/sdk-for-java/) Files other than the actual SDK .jar itself can be found in the /third-party directory within the SDK download.

### Requirement Two: Your Own AWS Credentials

You have to create your own AWS account and provide both the AccessKey and SecretKey in model/awsCredentials.cfc.

The account for which you are providing credentials must also have permissions for the following services:

- SNS
- Lambda
- CloudWatch (for Lambda logging)
- DynamoDB

For more infomration about IAM accounts, roles, and permissions, please review the [IAM guide](http://docs.aws.amazon.com/IAM/latest/UserGuide/introduction.html).

### Requirement Three: Your Own AWS Resources

You need to set up the following resources within AWS for these demos to work:

1. SNS - create a topic to which messsages can be sent. The ARN of this topic must be added to the top of sns.cfm.
2. Lambda - create a Lambda function using the code in lambdaJSFunctions/lambda-returnDataToCaller.js. The name of the function must be added to the top of lambda.cfm.
3. DynamoDB - create a DynamoDB table with a Hash Key of "userID" (String) and a Range Key of "epochTime" (Number). The table name must be added to the top of dynamodb.cfm.

Remember, the AWS docs are pretty great. Use the [Java API Reference](http://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/index.html) often, as it'll tell you almost everything you need to know for working with a particular AWS service.

Enjoy!