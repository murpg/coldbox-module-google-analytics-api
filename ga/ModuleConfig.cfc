component {
	
	// Module Properties
	this.title 				= "ga";
	this.author 			= "George Murphy";
	this.webURL 			= "http://www.websbygeorge.com";
	this.description 		= "ColdBox 4.0 Google Analytics API Module";
	this.version			= "1.0";
	// If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
	this.viewParentLookup 	= false;
	// If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
	this.layoutParentLookup = false;
	// Module Entry Point
	this.entryPoint			= "ga";
	
	function configure(){
		
		// parent settings
		parentSettings = {
		
		};
	
		// module settings - stored in modules.name.settings
		settings = {
            scope = "https://www.googleapis.com/auth/analytics.readonly",
            client_id = "*************.apps.googleusercontent.com", //This is your Google Client ID from when you create your oAuth 2.0 at Google Project
            client_secret = "*****", // This is your Client Secret from when you create your oAuth 2.0
            redirect_uri = "http://127.0.0.1:52217/index.cfm/ga/home/index",
            state = "optional"
		};
		
		// Layout Settings
		layoutSettings = {
			defaultLayout = "ga.cfm"
		};
		
		// datasources
		datasources = {
		
		};
		
		// web services
		webservices = {
		
		};
		
		// SES Routes
		routes = [
			{pattern="/", handler="home",action="index"},
            {pattern="/home/index", handler="home",action="index"},
            {pattern="/home/test", handler="home",action="test"},
            {pattern="/home/siteSelect", handler="home",action="siteSelect"},
            {pattern="/home/dateRange", handler="home",action="dateRange"},
			{pattern="/:handler/:action?"}
		];		
		
		// Custom Declared Points
		interceptorSettings = {
			customInterceptionPoints = ""
		};
		
		// Custom Declared Interceptors
		interceptors = [			
			// Transactional Hibernation annotations
/*	 		{class="coldbox.system.orm.hibernate.transactionaspect",
			 properties = {metadatacachereload=false}			
			}*/
		];
		

         binder.map("googleService@ga").to( "#moduleMapping#.models.googleService" );
         binder.mapDirectory("#moduleMapping#.models");
	}
	
	
	function onLoad(){
         controller.getWireBox().getInstance('googleService@ga');
	}
	
	
	function onUnload(){
	 // controller.getWireBox().getInstance('googleService@ga');
	}
	
}