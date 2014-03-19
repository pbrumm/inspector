$(".pagination a").click(function(e){e.preventDefault();
	var tp_id = $(this).attr('href').split('?page=')[1]; 
	console.log(tp_id)
});