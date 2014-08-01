<!---
	This is the parent controller file that all your controllers should extend.
	You can add functions to this file to make them globally available in all your controllers.
	Do not delete this file.
--->
<cfcomponent extends="Wheels">

	<cffunction name="setReturn">
		
		<cfif not isDefined("params.ajax")>
		 <cfif params.action is "index" or params.action is "list">
			 <cfset session.listingURL = $GetCurrentURL()>
		 </cfif>	
		 <cfset session.originalURL = $GetCurrentURL()>
		</cfif>

	</cffunction>

	<cffunction name="returnBack">
		 <cfset var backURL = session.originalURL>
		 <cfset session.originalURL = "">
		 
		 <cfif Len(backURL) GT 0>
			<cflocation url="#backURL#" addtoken="false">
		 <cfelse>
		 	<cfset redirectTo(argumentCollection=arguments)>
		 </cfif>

	</cffunction>

	<cffunction name="$GetCurrentURL" output="No" access="public">
	   <cfset var theURL = getPageContext().getRequest().GetRequestUrl()>
	   <cfif len( CGI.query_string )><cfset theURL = theURL & "?" & CGI.query_string></cfif>

	<cfif cgi.http_host is "localhost:8080" OR cgi.http_host is "localhost:8888">
	<cfelse>
	   <cftry>
	   	<cfset theURL = replace(theUrl,"/rewrite.cfm","","one")>
	   <cfcatch></cfcatch>
	   </cftry>
	</cfif>
	   
	   <cfreturn theURL>
	</cffunction>
	
	<cffunction name="linkTo">
		<cfloop collection="#arguments#" item = "i">
			<cfif findNoCase("DATA_",i)>
				<cfset	structInsert(arguments,replace(i,"DATA_","DATA-"),arguments[#i#])>
				<cfset structDelete(arguments,i)>
			</cfif>
		</cfloop>
		<cfreturn super.linkto(argumentCollection=arguments)>
	</cffunction>

<cffunction name="ckeditor">
	<cfreturn '<script type="text/javascript" src="/files/plugins/richtext/ckeditor/ckeditor.js">
	</script>'>
</cffunction>

<cffunction name="getThisDay">
	<cfset var loc=structNew()>
	<cfset loc.startdate = application.wheels.startdate>
	<cfset loc.thisDate = now()>
		<cfset loc.thisDay = dateDiff("d",loc.startdate,loc.thisdate) + 1>
	<cfreturn loc.thisDay>
</cffunction>

<cffunction name="isOffice">
	<cftry>
		<cfif session.33days.auth is "office">
			<cfreturn true>
		</cfif>
	<cfcatch></cfcatch>
	</cftry>

	<cfif isDefined("params.office")>
		<cfset session.33days.auth = "office">
		<cfreturn true>
	<cfelse>
		<cfset renderText("You do not have permission to view this page")>	
	</cfif>	
</cffunction>
	
</cfcomponent>