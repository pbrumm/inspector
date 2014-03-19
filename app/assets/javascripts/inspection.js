$(".pagination a").click(function(e){e.preventDefault();
	var tp_id = $(this).attr('href').split('?page=')[1]; 
	$('form').append("< input type='hidden' name='page' value='"+ tp_id +"'>");
	$('form').submit();
});