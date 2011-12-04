$(function () {
  $('#event_tags').tokenInput('/events/tags.json', { 
	crossDomain: false, 
	prePopulate:       $("#event_tags").data("pre"),
    preventDuplicates: true,
    noResultsText:     "No results, needs to be created.",
    animateDropdown:   true,
	theme: "facebook"
	});
});