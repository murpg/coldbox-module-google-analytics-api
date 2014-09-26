<cfoutput>
<div class="container">   
<div class="hero-unit">
	<h1>Web Stats</h1>
	<p>Google Analytics OAuth2 with ColdFusion and ColdFusion Charts</p>
    <cfif isDefined("session.profilesArray")>
        <p class="float_right"><a class="btn btn-danger" href="#event.buildLink('ga.home.index')#?logout=true">Logout</a></p>
			<cfif ArrayLen(session.profilesArray) gt 0 >
    		<form class="form-horizontal" name="siteSelect" method="post" action="#event.buildLink('ga.home.index')#">
    		 <div class="control-group">
                <label class="control-label" for="profileId">Select Site</label>
                <div class="controls">
                <select name="profileId" id="profileId">
                	<cfloop array="#session.profilesArray#" index="profile">
                    	<option value="#profile.profileId#,#profile.title#">#profile.profileId#-#profile.title#</option>
                     </cfloop>
                </select>
                </div>
              </div>
              <div class="form-actions">
         		<button class="btn btn-primary" type="submit" id="submitSite">Submit</button>
         	  </div>
    		</form>
            <cfelse>
                  <p class='alert alert-error' style="width:70%">You Don't have Any WebSite Data.</p>
            </cfif>
	<cfelse>
		<cfif isDefined("URL.code") AND URL.code EQ "access_denied">
		 	<p class='alert alert-error'>Google authorization failed.</p>
        <cfelseif isDefined("session.ga_accessToken") AND session.ga_accessToken CONTAINS "Authorization Failed">
			<div class='alert alert-error'><p><strong>#session.ga_accessToken#</strong></p><p>Google authorization failed.</p></div>
		</cfif>
        <p><a class="btn btn-primary" href="#prc.loginURL#">Login with Google account that has access to analytics</a></p>
        
  </cfif>
</div>       
</div> 
</cfoutput>