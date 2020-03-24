$(document).on('turbolinks:load', function(){
  $(function(){
    // カテゴリーセレクトボックスのオプションを作成
    function appendOption(category){
      var html = `<option value="${category.id}">${category.value}</option>`;
      return html;
    }
    // 子カテゴリーの表示作成
    function appendChildrenBox(insertHTML){
      var childSelectHtml = '';
      childSelectHtml = `<div class="sell-area__details__sub-category">
                          <div class="sell-area__details__sub-category__select">
                            <select class="sell-area__details__sub-category__default" name="product[category_id]" id="child_category">
                              <option value="">---</option>
                              ${insertHTML}
                            <select>
                          </div>
                        </div>`;
      $('.category__append').append(childSelectHtml);
    }
    // 孫カテゴリーの表示作成
    function appendGrandchildrenBox(insertHTML){
      var grandchildSelectHtml = '';
      grandchildSelectHtml = `<div class="sell-area__details__subsub-category">
                                <div class="sell-area__details__subsub-category__select">
                                  <select class="sell-area__details__subsub-category__default" name="product[category_id]" id="grandchild_category">
                                    <option value="">---</option>
                                    ${insertHTML}
                                  <select>
                                </div>
                              </div>`;
      $('.category__append').append(grandchildSelectHtml);
    }
    // 親カテゴリー選択後のイベント
    $("#product_category_id").on("change", function() {
      var parentCategory = document.getElementById("product_category_id")
        .value; //選択された親カテゴリーの名前を取得
      if (parentCategory != "") {
        //親カテゴリーが初期値でないことを確認
        console.log("OK子")
        $.ajax({
          url: '/products/get_category_children',
          type: 'GET',
          data: { parent_id: parentCategory },
          dataType: "json"
        })
          .done(function(children) {
            $(".sell-area__details__sub-category").remove(); //親が変更された時、子以下を削除するする
            $(".sell-area__details__subsub-category").remove();
            $(".sell-area__details__size").remove();
            var insertHTML = "";
            children.forEach(function(child) {
              insertHTML += appendOption(child);
            });
            appendChildrenBox(insertHTML);
          })
          .fail(function() {
            alert("カテゴリー取得に失敗しました");
          });
      } else {
        $(".sell-area__details__sub-category").remove(); //親カテゴリーが初期値になった時、子以下を削除するする
        $(".sell-area__details__subsub-category").remove();
        $(".sell-area__details__size").remove();
      }
    });

    // 子カテゴリー選択後のイベント
    $(document).on("change", "#child_category", function() {
      var childId = $("#child_category").val(); //選択された子カテゴリーのidを取得
      if (childId != "") {
        //子カテゴリーが初期値でないことを確認
        console.log("OK孫")
        $.ajax({
          url: '/products/get_category_grandchildren',
          type: 'GET',
          data: { child_id: childId },
          dataType: "json"
        })
          .done(function(grandchildren) {
            if (grandchildren.length != 0) {
              $(".sell-area__details__subsub-category").remove(); //子が変更された時、孫以下を削除する
              $(".sell-area__details__size").remove();
              var insertHTML = "";
              grandchildren.forEach(function(grandchild) {
                insertHTML += appendOption(grandchild);
              });
              appendGrandchildrenBox(insertHTML);
            }
          })
          .fail(function() {
            alert("カテゴリー取得に失敗しました");
          });
      } else {
        $(".sell-area__details__subsub-category").remove(); //子カテゴリーが初期値になった時、孫以下を削除する
        $(".sell-area__details__size").remove();
      }
    });
  });

   // サイズ選択欄追加

   function appendSizeOption(size){
    var html = `<option value="${size.id}">${size.value}</option>`;
    return html;
  }
  // サイズ選択フォーム作成
  function appendSizeBox(insertHTML) {
    var sizeHtml = "";
    sizeHtml = `<div class="sell-area__details__size">
                 サイズ
                  <span class="form-require">必須</span>
                    <div class="sell-area__details__size__select">
                      <select class="sell-area__details__status__default" name="product[size_id]" id="product_size_id">
                        <option value="">---</option>
                        ${insertHTML}
                      <select>
                    </div>
                </div>`;
    $('.category__append').append(sizeHtml);
  }

  // 孫カテゴリー選択後のイベント
  $(document).on("change", "#grandchild_category", function() {
    var sizeId = $("#grandchild_category").val(); //選択された孫カテゴリーのidを取得
    if (sizeId != "") {
      console.log("OKサイズ")
      $.ajax({
        url: '/products/get_size',
        type: 'GET',
        data: { size_id: sizeId },
        dataType: "json"
      })
        .done(function(sizes) {
          if (sizes.length != 0) {
            $(".sell-area__details__size").remove(); //サイズが変更された時、孫以下を削除する
            var insertHTML = "";
            sizes.forEach(function(size) {
              insertHTML += appendSizeOption(size);
            });
            appendSizeBox(insertHTML);
          }
        })
        .fail(function() {
          alert("サイズ取得に失敗しました");
        });
    } else {
      $(".sell-area__details__size").remove();
    }
  });

  // 配送方法セレクトボックスのオプションを作成
  function appendDeliveryMethodOption(deliverymethod){
    var html = `<option value="${deliverymethod.id}">${deliverymethod.value}</option>`;
    return html;
  }
  // 配送方法選択フォーム作成
  function appendDeliveryMethodBox(insertHTML) {
    var deliveryMethodHtml = "";
    deliveryMethodHtml = `<div class="sell-area__delivery__way" id="delivery__method">
                           配送の方法
                            <span class="form-require">必須</span>
                              <div class="sell-area__delivery__way__select">
                                <select class="sell-area__delivery__way__default" name="product[delivery_method_id]" id="product_delivery_method_id">
                                  <option value="">---</option>
                                  ${insertHTML}
                                </select>
                              </div>
                          <div>`;
    $(".delivery__way__append").append(deliveryMethodHtml);
  }

  // 配送料の負担選択後、発送方法欄を表出する処理
  $(document).on("change", "#product_delivery_expense_id", function() {
    var deliveryExpenseId = $("#product_delivery_expense_id").val();
    if (deliveryExpenseId != "") {
      console.log("OK")
      $.ajax({
        url: '/products/get_delivery_method',
        type: 'GET',
        data: { delivery_expense_id: deliveryExpenseId },
        dataType: 'json'
      })
      .done(function(deliveryMethods){
        if (deliveryMethods.length != 0) {
          $('.sell-area__delivery__way').remove(); 
          var insertHTML = '';
          deliveryMethods.forEach(function(deliveryMethod){
          insertHTML += appendDeliveryMethodOption(deliveryMethod);
          });
          appendDeliveryMethodBox(insertHTML);
        }
      })
      .fail(function() {
        alert("配送方法取得に失敗しました");
      });
    } else {
      $(".sell-area__delivery__way").remove();
    }
  });
});
