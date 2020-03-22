$(document).on('turbolinks:load', function(){ 
//   var check_condition = []
//   var check_delivery_expence = []
//   var check_status = []
    
  $('.detail-search__box').on('change', '#price', function(){
    console.log("OK");
    var price_range = $('#price').val().split(" ");
    console.log(price_range);
    $('#min_price').val(price_range[0]);
    $('#max_price').val(price_range[2]);
  })

//   $('.detail-search__box').on('click', '#condition_all', function(){
//     $('#condition_id_1').prop('checked', true);
//       check_condition.push('1');
//     $('#condition_id_2').prop('checked', true);
//       check_condition.push('2');
//     $('#condition_id_3').prop('checked', true);
//       check_condition.push('3');
//     $('#condition_id_4').prop('checked', true);
//       check_condition.push('4');
//     $('#condition_id_5').prop('checked', true);
//       check_condition.push('5');
//     $('#condition_id_6').prop('checked', true);
//       check_condition.push('6');
//     $('#condition_id_7').prop('checked', true);
//       check_condition.push('7');
//     console.log(check_condition);
//   })

//   $('.detail-search__box').on('click', '#delivery_expence_all', function(){
//     $('#delivery_expence_id_1').prop('checked', true);
//     $('#delivery_expence_id_2').prop('checked', true);
//   })

//   $('.detail-search__box').on('click', '#status_all', function(){
//     $('#status_id_1').prop('checked', true);
//     $('#status_id_2').prop('checked', true);
//     $('#status_id_3').prop('checked', true);
//     $('#status_id_4').prop('checked', true);
//   })

  $('.detail-search__box').on('click', '.detail-search__box__form__submit-area--reset', function(){
    return false;
  })
})
