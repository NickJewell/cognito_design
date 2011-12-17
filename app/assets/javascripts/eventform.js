

$(function() {
	var $sld = $(this);
	var $sld_val = $sld.find("#dbDuration").val();
	var $isld_val = parseInt($sld_val);
	if ($isld_val = "") { $isld_val = 15 } else { $isld_val = parseInt($sld_val);};
	if (isNaN($isld_val)) {$isld_val = 15} else { $isld_val = parseInt($sld_val);};
	$( "#slider").slider(
							{ value: $isld_val,
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
								
	
	
	$( "#accordion" ).accordion({
											collapsible: true,
											autoHeight: false, 
											active: false
								 });
	$( "#accordion2" ).accordion({
											collapsible: true,
											autoHeight: false, 
											active: false
								});							

});

function setbg(color)
{
	document.getElementById("styled").style.background-color
}