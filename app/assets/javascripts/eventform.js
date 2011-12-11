$(function() {
	$( "#slider").slider(
							{ value: 15,
							  min:   15,
							  max:   180,
							  step:  15,
							  slide: function( event, ui )
								{
								  $( "#duration").val(ui.value);	
								}
							});
	
	$( "#duration" ).val( $( "#slider").slider("value") );
							
	$( "#tabs").tabs();
	
	$(".nexttab").click(function(){
									var selected = $("#tabs").tabs("option", "selected");
									$("#tabs").tabs("option", "selected", selected + 1);
								  });
	
	$(".prevtab").click(function(){
									var selected = $("#tabs").tabs("option", "selected");
									$("#tabs").tabs("option", "selected", selected - 1);
								  });							
	
	$( "#datepicker").datepicker({
									minDate: -20, 
									maxDate: "+1M +10D",
									dateFormat: 'dd/mm/yy'
								 });
});

function setbg(color)
{
	document.getElementById("styled").style.background-color
}