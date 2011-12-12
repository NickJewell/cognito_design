$(function() {
		$(".datepicker").datetimepicker({
		                showOn : "both",
		                changeMonth : true,
		                changeYear : true,
		                minDate: -20, 
						maxDate: "+1M +10D",
						dateFormat: 'dd/mm/yy'
		            })
	});
