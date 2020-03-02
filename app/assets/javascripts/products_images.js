$(document).on('turbolinks:load', function()
{  
  var image_ctn = 0;
  const buildInputArea = function(){
    var html = `<label class="sell-area__dropbox__another__img">
                    <i class="fa fa-camera camera-icon-2"></i>
                    <p class="sell-area__dropbox__img--text">ドラッグアンドドロップ<br>またはクリックしてファイルをアップロード</p>
                    <input class="photo-input-another" type="file" name="product[photos_attributes][5][photo]" 
                                       id="product_photos_attributes_5_photo">
                </label>`
  return html;
  }

  $('.sell-area__dropbox').on('click', `.preview__delete`, function(){
    var preview = $(this).parent().parent();
    var field = $(preview).children('input');
    $(preview).remove();
    $(field).remove();
    var input = $('input[type="file"]');
    input[0] = '';
    image_ctn -= 1;

    if (image_ctn <= 4) {
      console.log('remove')
      $('.sell-area__dropbox__another__img').remove();
    }
    return false;
  })

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
      var preview = `<div class="preview" id="preview${image_ctn}">
                       <div class="preview__img">
                         <img src="${src}" width="100" height="100">
                       </div>
                       <div class="preview__button">
                         <div class="preview__edit">編集する</div>
                         <div class="preview__delete">削除する</div>
                       </div>
                       <input type="file" name="product[photos_attributes][${image_ctn}][photo]" 
                                          id="product_photos_attributes_${image_ctn}_photo"
                     </div>`
        if (image_ctn < 5) {
        $('.sell-area__dropbox__img').prepend(preview);
        $('.sell-area__dropbox__img--text').remove();
        $('.photo-input').attr('name', `product[photos_attributes][${image_ctn}][photo]`);
        $('.photo-input').attr('id', `product_photos_attributes_${image_ctn}_photo`);
        if (image_ctn == 4) {
          $('.sell-area__dropbox').append(buildInputArea);
          $('i.fa.fa-camera.camera-icon-1').remove();
        }
      } else if (image_ctn > 4) {
        $('.sell-area__dropbox__another__img').prepend(preview);
        $('.sell-area__dropbox__img--text').remove();
        $('.photo-input-another').attr('name', `product[photos_attributes][${image_ctn}][photo]`);
        $('.photo-input-another').attr('id', `product_photos_attributes_${image_ctn}_photo`);
        if (image_ctn == 9) {
          $('i.fa.fa-camera.camera-icon-2').remove();
        }
      } else if (image_ctn > 10) {
          alert('これ以上は画像を投稿できません。');
          return false;
      }
      image_ctn += 1; 
      var input = $('input[type="file"]');
      input[0] = '';
      console.log(input);
      return
    }
    reader.readAsDataURL(file);
  });
})