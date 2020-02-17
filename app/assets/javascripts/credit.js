// $(document).on('turbolinks:load', function() {
//   var form = $("#charge-form");
//   Payjp.setPublicKey('pk_test_98ab1743ba3dd92e8304a1c3'); //(自身の公開鍵)

//   $("#charge-form").on("click", "#submit-button", function(e) {
//     e.preventDefault();
//     form.find("input[type=submit]").prop("disabled", true);
//     var card = {
//         number: parseInt($("#payment_card_no").val()),
//         cvc: parseInt($("#cvc_code").val()),
//         exp_month: parseInt($("#card_expire_mm").val()),
//         exp_year: parseInt($("#card_expire_yy").val())
//     };
//     Payjp.createToken(card, function(status, response) {
//       if (stauts == 200) {
//         $(".number").removeAttr("name");
//         $(".cvc").removeAttr("name");
//         $(".exp_month").removeAttr("name");
//         $(".exp_year").removeAttr("name");

//         var token = response.id;
//         $("#charge-form").append($('<input type="hidden" name="payjp_token" class="payjp-token" />').val(token));
//         $("#charge-form").get(0).submit();

//       }
//       else {
//         alert("error")
//         form.find('button').prop('disabled', false);
//       }
//     });
//   });
// });


// -# ↓↓↓ submitボタンを押された時にトークンを作成する処理
document.addEventListener(
"DOMContentLoaded", (e) => {
  Payjp.setPublicKey("pk_test_98ab1743ba3dd92e8304a1c3");
  const btn = document.getElementById('token_submit'); //IDがtoken_submitの場合に取得されます
  btn.addEventListener("click", (e) => {//ボタンが押されたときに作動します
    e.preventDefault();//ボタンを一旦無効化します

    //カード情報生成
    const card = {
      number: document.getElementById("card_number").value,
      cvc: document.getElementById("cvc").value,
      exp_month: document.getElementById("exp_month").value,
      exp_year: document.getElementById("exp_year").value
    }; //入力されたデータを取得します。

    //トークン生成
    Payjp.createToken(card, (status, response) => {
      if (status === 200) { //成功した場合
        $("#card_number").removeAttr("name");
        $("#cvc").removeAttr("name");
        $("#exp_month").removeAttr("name");
        $("#exp_year").removeAttr("name"); //カード情報を自分のサーバにpostせず削除します
        $("#card_token").append(
          $('<input type="hidden" name="payjp-token">').val(response.id)
        ); //トークンを送信できるように隠しタグを生成
        document.inputForm.submit();
        alert("登録が完了しました"); //確認用
      } else {
        alert("カード情報が正しくありません。"); //確認用
      }
    });
  });
},false);