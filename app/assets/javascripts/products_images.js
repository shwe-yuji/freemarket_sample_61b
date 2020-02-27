$(document).on('turbolinks:load', function(){
  const buildInputArea = function(){
    var html = `<div class="sell-area__dropbox__another">
                  <label class="sell-area__dropbox__another__img">
                    <i class="fa fa-camera camera-icon-2"></i>
                    <p class="sell-area__dropbox__img--text">ドラッグアンドドロップ<br>またはクリックしてファイルをアップロード</p>
                    <input type="file" name="product[photos_attributes][0][photo]" id="product_photos_attributes_0_photo">
                  </label>
                </div>`
  return html;
  }
  
  var image_ctn = 0;

  $('.sell-area__dropbox').on('change', 'input[type="file"]', function(e){
    e.preventDefault();
    var file = $(this).prop('files')[0];
    var reader = new FileReader();

    if(file.type.indexOf("image") < 0){
      alert("画像ファイルを指定してください。");
      return false;
    }

    reader.onload = function(){
      var src = reader.result
      var preview = `<div class="preview">
                    <div class="preview__img">
                      <img src="${src}" width="100" height="100">
                    </div>
                    <div class="preview__link">
                      <a href="#">編集する</a>
                      <a href="#">削除する</a>
                    </div>
                 </div>`
      image_ctn += 1;
      console.log(image_ctn);
      if (image_ctn < 6) {
        $('.sell-area__dropbox').prepend(preview);
        $('.sell-area__dropbox__img--text').remove();
        if (image_ctn == 5) {
          $('.sell-area__dropbox').append(buildInputArea);
          $('i.fa.fa-camera.camera-icon-1').remove();
        }
      } else if (image_ctn > 5) {
        $('.sell-area__dropbox__another').prepend(preview);
        $('.sell-area__dropbox__img--text').remove();
        if (image_ctn == 10) {
          $('i.fa.fa-camera.camera-icon-2').remove();
        }
      } else if (image_ctn > 11) {
          alert('これ以上は画像を投稿できません。');
      } 
    }
    reader.readAsDataURL(file);
  });
})