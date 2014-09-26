/**
* the home page
*/
component extends="baseHandler"{
		property name="googleService" inject="id:googleService@ga";	
	
		function index(event,rc,prc){
        	oauthSettings = getModuleSettings('ga');
          	//googleService.logout();
            if( (isDefined("URL.logout") and URL.logout EQ "true") OR (isDefined("session.ga_accessTokenExpiry") AND DateCompare(session.ga_accessTokenExpiry,Now()) LT 0) )
            {
            	googleService.logout();
            }
             if(isDefined("URL.code") AND URL.code NEQ "access_denied"){
             
             	googleService.googleOauth2Login(URL.code);
             }
           if(isDefined("form.profileId")){
                    session.profileId = ListGetAt(form.profileId, 1);
                    session.site = ListGetAt(form.profileId, 2);
                    setNextEvent(event="ga.home.test");
                 
            }
        	if( isDefined("session.ga_accessToken") AND session.ga_accessToken DOES NOT CONTAIN "Authorization Failed"){
            		googleService.parseProfiles();
           }
           prc.loginURL = "https://accounts.google.com/o/oauth2/auth?scope=" & oauthSettings["scope"] 
                   & "&redirect_uri=" & oauthSettings["redirect_uri"]
                   & "&response_type=code&client_id=" & oauthSettings["client_id"]
                   & "&access_type=online";
          
            event.setView(view='home/index',layout="ga");    
		}
        
        function test(event,rc,prc){
        	if( (isDefined("URL.logout") and URL.logout EQ "true") OR (isDefined("session.ga_accessTokenExpiry") AND DateCompare(session.ga_accessTokenExpiry,Now()) LT 0) )
            {
            	googleService.logout();
            }
            
            if(NOT isDefined("session.ga_accessToken") OR session.ga_accessToken CONTAINS "Authorization Failed"){
            	
                setNextEvent(event="ga.home..index");
            }
	
				googleService.ReStartinit();
				prc.daysInRange = DateDiff("d",session.startdate,session.enddate) + 1 ;
                event.setLayout("layouts.test");
             event.setView(view='home/test',layout="ga");    
           
        }
        
         function siteSelect(event,rc,prc){
          var errormsg = "invalid";
        
        	if(isDefined("form.profileId")){
                    session.profileId = ListGetAt(form.profileId, 1);
                    session.site = ListGetAt(form.profileId, 2);
                    StructDelete(session,"getNewData");
            }     
            return SerializeJSON(errormsg);
        }
		
        function dateRange(event,rc,prc){
        	var errormsg = "none";
            
           var start_date = CreateDate(Mid(form.startdate,1,4),Mid(form.startdate,6,2),Mid(form.startdate,9,2));
           var end_date = CreateDate(Mid(form.enddate,1,4),Mid(form.enddate,6,2),Mid(form.enddate,9,2));
            
            if( DateCompare(start_date,end_date) GT 0){
               errormsg = "invalid";
            }else{

                    session.startdate = DateFormat(start_date, "yyyy-mm-dd");
                    session.enddate = DateFormat(end_date,"yyyy-mm-dd");
                    StructDelete(session,"getNewData");
                    
                    StructDelete(session,"visitsSnapshotArray") ;
                    StructDelete(session,"visitorLoyaltyArray");
                    StructDelete(session,"visitsChartArray");
                    StructDelete(session,"countryChartArray");
                    StructDelete(session,"topPagesArray");
            
            }
            return SerializeJSON(errormsg);
        }
}
