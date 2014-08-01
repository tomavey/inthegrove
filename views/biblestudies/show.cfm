<script type="text/javascript">
$(function(){
// Bind the swipeHandler callback function to the swipe event on div.box
$( "div#swipeable" ).on( "swiperight", swipeHandlerRight );
// Callback function references the event target and adds the 'swipe' class to it
function swipeHandlerRight( event ){
window.location = '<cfoutput>#urlFor(route="guide", key=params.key - 1)#</cfoutput>';
}
});
$(function(){
// Bind the swipeHandler callback function to the swipe event on div.box
$( "div#swipeable" ).on( "swipeleft", swipeHandlerLeft );
// Callback function references the event target and adds the 'swipe' class to it
function swipeHandlerLeft( event ){
window.location = '<cfoutput>#urlFor(route="guide", key=params.key + 1)#</cfoutput>';
}
});
</script>

<div class="container" id="swipeable">
<cfoutput>

					<p id="week">Week ###biblestudies.weeks.week# - <span>#biblestudies.weeks.subject#</span>; Weekly memory verse = #biblestudies.weeks.verse# #linkto(text="See overview of Week ###biblestudies.weeks.week#", route="week", key=biblestudies.weeks.week)#<br/>
					Day: #biblestudies.day#
					</p>

					<h3 id="subject">#biblestudies.subject#</h3>
				
					<p id="content">#biblestudies.content#</p>

</cfoutput>
</div>