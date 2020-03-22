$('#soldout_product').on('click', function() {
  alert("購入されています");
});

$('#buy_product').click(function(){
  if(!confirm('本当に購入しますか？')){
      /* キャンセルの時の処理 */
      return false;
  }
});

