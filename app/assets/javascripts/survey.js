$('input#survey_scores_score_item').keyup(function() {
	var mysum = 0; 
	(parseInt($("h3", this).each(function() {
		mysum += Number($(this).val())
	})))
});

$('input#survey_scores_score_item').keyup(function() {
	var mysum = 0; 
	(parseInt($('input#survey_scores_score_item', 'h3').each(function() {
		mysum += Number($(this).val())
	})))
console.log(mysum)});

$('input#survey_scores_score_item').keyup(function() {
	var mysum = 0; 
	(parseInt($( 'input#survey_scores_score_item', 'h3').each(function() { 
		mysum += Number($(this).val())
	}))); 
	$('div.item_score_total', 'h3').text(mysum); 
});

$('input#survey_scores_score_item').keyup(function() {
	var mysum = 0; 
	(parseInt($( 'input#survey_scores_score_item, div.my_group').each(function() { 
		mysum += Number($(this).val())
	}))); 
	$('div.item_score_total', 'h3').text(mysum); 
});

//works
$('input#survey_scores_score_item').keyup(function() {
	var mysum = 0; 
alert(mysum)
});


$('input#survey_scores_score_item').keyup(function() {
	var mysum = 0; 
alert(mysum)
});

$('div.my_group').each(function(){this.show});



$.each($('.my_group').children().show(), function(key, value) {
	console.log(key + ": " + value);
});




$.each($('.my_group'), function() {
	this.each($('.item_enclosure.row'), function(key, value)
	{console.log(key + ": " + value)}
)}); //TypeError: Object #<HTMLDivElement> has no method 'each'





$.each($('.my_group').find('input#survey_scores_score_item').text, function(key, value) {console.log(key + ": " + value)});