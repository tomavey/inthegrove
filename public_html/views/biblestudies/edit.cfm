<div class="container">
<h1>Editing a bible study</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("biblestudies")#
	
			#startFormTag(action="update", key=params.key)#
		
			#includePartial("form")#	

			#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>
</div>