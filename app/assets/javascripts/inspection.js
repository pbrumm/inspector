$(function() {
  
// $(".pagination a").click(function(e){e.preventDefault();
//   var tp_id = $(this).attr('href').split('?page=')[1]; 
//   $('form').submit();
// })

// function showGetResult() {
//   var result = null;
//   $.ajax({
//     url: '/inspections/' + $('div.run-score-data').data("iid") + '.json',
//     dataType: 'json',
//     async: false,
//     success: function(data) {
//       result = data;
//     }
//   });
//   return result;
// }


  $("div.item_act:not(.saved)").click(function(ev){
    var form = $(ev.currentTarget).parents("form")
    form.find('div.item_act').addClass("saved")
    form.submit();
    
    return false
  });

});