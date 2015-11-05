<cfset snsMessageSent = 0 />

<cfif structKeyExists(URL, "sendMessage")>
	<cfscript>
		topicARN = "YOUR TOPIC ARN GOES HERE";
		subject = "Adobe CF Summit 2015 Demo";
		message = "Hello there!" & chr(13) & chr(13) & "The current time is " & DateTimeFormat(Now(), "Full") & ".";

		sns = CreateObject('component', 'cfsummit2015.model.awsServiceFactory').init().createServiceObject('sns');
		publishRequest = CreateObject('java', 'com.amazonaws.services.sns.model.PublishRequest').init(topicARN, message,subject);

		sns.publish(publishRequest);

		snsMessageSent = 1;
	</cfscript>
</cfif>

<cfcontent reset="true" />

<!doctype html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>Adobe ColdFusion Summit 2015: AWS Service Demos</title>
		<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" href="assets/styles.css?v=1.0">
	</head>

	<body>
		<div align="center">
			<div id="mainBox">
				<h3>AWS Service Demos:</h3>
				<h1>Simple Notification Service (SNS)</h1>

				<cfif snsMessageSent>
					<p><b>A SNS notification was sent!</b></p>
				</cfif>
				<p><a href="sns.cfm?sendMessage=1">Send a test SNS notification</a></p>
				<p align="right" ><a href="index.cfm" class="homeButton">Home</a></p>
			</div>
		</div>

	</body>
</html>