component {
	
	this.name = 'CFSummit2015_AWS_Demos';
	this.applicationTimeout = CreateTimeSpan(0, 0, 5, 0);
	this.sessionManagement = false;

    function onApplicationStart(){
        application.awsServiceFactory = createObject("component", "model.awsServiceFactory").init();
        return true;
    }

}