$(function() {
$(".pagination a").click(function(e){e.preventDefault();
	var tp_id = $(this).attr('href').split('?page=')[1]; 
	$('form').append("<input type='hidden' name='score[survey_id]' value='"+ tp_id +"'>");
	$('form').submit();
})});

$(function() {

  function showGetResult() {
  var result = null;
  $.ajax({
	url: '/inspections/' + $('div.run-score-data').data("iid") + '.json',
	dataType: 'json',
	async: false,
	success: function(data) {
		result = data;
	}
	});
return result;
}


  $(".item_act").click(function(){;
  	var act_id = parseInt($(this).attr('class').split('act-')[1]);
  	$('form#edit_item_' + act_id).submit();
  	$('div.act-' + act_id).css("background-color", "rgb(190, 193, 201)");
  	
  });




});