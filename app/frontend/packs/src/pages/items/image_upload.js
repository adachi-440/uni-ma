export default class ItemsImageUpload {
  constructor() {
  }

  run() {
    ItemsImageUpload.imageUpload()
    ItemsImageUpload.editImageUpload()
    ItemsImageUpload.imageDelete()
    ItemsImageUpload.fileDragAndDrop()
    // ItemsImageUpload.onClickInputZone()
  }

  static imageUpload() {
    $(document).on("click", ".js-image-upload", function () {
      //$liに追加するためのプレビュー画面のHTML
      const preview = $(
        `<div class="js-image-preview__wapper"><img class="preview" style="width: 114px;max-height: 150px"></div><div class="js-image-preview_btn"><button class="js-image-preview_btn_edit">編集</button><button class="js-image-preview_btn_delete">削除</button></div>`
      );
      //次の画像を読み込むためのinput。処理の最後にappendで追加する。
      const append_input = $(
        `<li class="input-zone"><label class="js-upload-label"><div class="js-upload-label__text"><i class="fa fa-camera" aria-hidden="true"></i>アップロード<div class="input-area"><input class="hidden js-image-upload" type="file"></div></div></label></li>`
      );
      const $ul = $("#js-previews");
      const $li = $(this).parents("li");
      const $label = $(this).parents(".js-upload-label");
      const $inputs = $ul.find(".js-image-upload");
      //inputに画像を読み込んだら、"プレビューの追加"と"新しいli追加"処理が動く
      $(".js-image-upload").on("change", function (e) {
        //inputで選択した画像を読み込む
        let reader = new FileReader();

        // プレビューに追加させるために、inputから画像ファイルを読み込む。
        reader.readAsDataURL(e.target.files[0]);

        //画像ファイルが読み込んだら、処理が実行される。
        reader.onload = function (e) {
          //previewをappendで追加する前に、プレビューできるようにinputで選択した画像を<img>に'src'で付与させる
          $(preview).find(".preview").attr("src", e.target.result);
        };

        //inputの画像を付与した,previewを$liに追加。
        $li.append(preview);

        //プレビュー完了後は、inputを非表示にさせる。これによりプレビューだけが残る。
        $label.css("display", "none");
        $li.removeClass("input-zone");
        $li.addClass("js-image-preview");
        const $lis = $ul.find(".js-image-preview");

        $("#js-previews li").css({
          width: `114px`,
          height: `150px`
        });
        //"ul"に新しい"li(inputボタン)"を追加させる。
        if ($lis.length <= 4) {
          $ul.append(append_input);
          $("#js-previews li:last-child").css({
            width: `calc(100% - (20% * ${$lis.length}))`,
          });
        } else if ($lis.length == 5) {
          $li.addClass("js-image-preview");
          $ul.append(append_input);
          $("#js-previews li:last-child").css({
            display: `none`,
          });
        }

        //inputの最後の"data-image"を取得して、input nameの番号を更新させてる。
        $inputs.each(function (num, input) {
          //nameの番号を更新するために、現在の番号を除去
          $(input).removeAttr("name");
          $(input).attr({
            name: "item[images_attributes][" + num + "][name]",
            id: "item_images_attributes_" + num + "_name",
          });
        });
      });
    });
  }

  static editImageUpload() {
    $(document).on('turbolinks:load', function () {
      // 下記はedit用です。できれば別ファイルで作成することを推奨。バグの元
      const append_input = $(`<li class="input-zone"><label class="js-upload-label"><div class="upload-label__text"><i class="fa fa-camera" aria-hidden="true"></i>アップロード<div class="input-area"><input class="hidden js-image-upload" type="file"></div></div></label></li>`)
      const $ul = $('#js-previews')
      const $lis = $ul.find('.js-image-preview');
      const $input = $ul.find('.input-zone');
      if ($input.length == 0) {
        if ($lis.length <= 4) {
          $ul.append(append_input)
          $('#previews .input').css({
            'width': `calc(100% - (20% * ${$lis.length}))`
          })
        } else if ($lis.length == 5) {
          $ul.append(append_input)
          $('#previews .input').css({
            'width': `100%`
          })
        } else if ($lis.length <= 9) {
          $ul.append(append_input)
          $('#previews .input').css({
            'width': `calc(100% - (20% * (${$lis.length} - 5 )))`
          })
        }
      }
    })
  }

  static imageDelete() {
    $(document).on('click','.js-image-preview_btn_delete',function(){
      const append_input = $(`<li class="input-zone"><label class="js-upload-label"><div class="upload-label__text"><i class="fa fa-camera" aria-hidden="true"></i>アップロード<div class="input-area"><input class="hidden js-image-upload" type="file"></div></div></label></li>`)
      let $ul = $('#js-previews')
      let $lis = $ul.find('.image-preview')
      const $input = $ul.find('.input-zone')
      const $li = $(this).parents('.js-image-preview')


      //"li"ごと削除して、previewとinputを削除させる。
      $li.remove();

      // inputボタンのサイズを更新する、または追加させる
      // まずはプレビューの数を数える。
      $lis = $ul.find('.js-image-preview');
      const $label = $ul.find('.input-zone');
      if($lis.length <= 4 ){
        // inputのサイズを変更
        $('#js-previews li:last-child').css({
          display: `inline-block`,
          'width': `calc(100% - (20% * ${$lis.length}))`
        })
      }
      else if($lis.length == 5 ){
        // inputのサイズを変更
        $('#js-previews li:last-child').css({
          'width': `100%`
        })
      }
    });
  }

  static fileDragAndDrop() {
    //$liに追加するためのプレビュー画面のHTML
    const preview = $(
      `<div class="js-image-preview__wapper"><img class="preview" style="width: 114px;max-height: 150px"></div><div class="js-image-preview_btn"><button class="js-image-preview_btn_edit">編集</button><button class="js-image-preview_btn_delete">削除</button></div>`
    );
    //次の画像を読み込むためのinput。処理の最後にappendで追加する。
    const append_input = $(
      `<li class="input-zone"><label class="js-upload-label"><div class="js-upload-label__text"><i class="fa fa-camera" aria-hidden="true"></i>アップロード<div class="input-area"><input class="hidden js-image-upload" type="file"></div></div></label></li>`
    );
    const $ul = $("#js-previews");
    const $li = $(this).parents("li");
    const $label = $(this).parents(".js-upload-label");
    const $inputs = $ul.find(".js-image-upload");


    $('.input-zone').on('dragenter dragover', function (event) {
      event.stopPropagation()
      event.preventDefault()
      $('.input-zone').css('border', '1px solid #333') // 枠を実線にする
    })

    $('.input-zone').on('dragleave', function (event) {
      event.stopPropagation();
      event.preventDefault();
      $('.input-zone').css('border', '1px dashed #aaa');  // 枠を点線に戻す
    });

    $('.input-zone').on('drop', function (e) {
      e.preventDefault();
      //inputで選択した画像を読み込む
      let reader = new FileReader();

      // プレビューに追加させるために、inputから画像ファイルを読み込む。
      reader.readAsDataURL($('.js-image-upload').files[0]);

      //画像ファイルが読み込んだら、処理が実行される。
      reader.onload = function (e) {
        //previewをappendで追加する前に、プレビューできるようにinputで選択した画像を<img>に'src'で付与させる
        $(preview).find(".preview").attr("src", e.target.result);
      };

      //inputの画像を付与した,previewを$liに追加。
      $li.append(preview);

      //プレビュー完了後は、inputを非表示にさせる。これによりプレビューだけが残る。
      $label.css("display", "none");
      $li.removeClass("input-zone");
      $li.addClass("js-image-preview");
      const $lis = $ul.find(".js-image-preview");

      $("#js-previews li").css({
        width: `114px`,
        height: `150px`
      });
      //"ul"に新しい"li(inputボタン)"を追加させる。
      if ($lis.length <= 4) {
        $ul.append(append_input);
        $("#js-previews li:last-child").css({
          width: `calc(100% - (20% * ${$lis.length}))`,
        });
      } else if ($lis.length == 5) {
        $li.addClass("js-image-preview");
        $ul.append(append_input);
        $("#js-previews li:last-child").css({
          display: `none`,
        });
      }

      //inputの最後の"data-image"を取得して、input nameの番号を更新させてる。
      $inputs.each(function (num, input) {
        //nameの番号を更新するために、現在の番号を除去
        $(input).removeAttr("name");
        $(input).attr({
          name: "item[images_attributes][" + num + "][name]",
          id: "item_images_attributes_" + num + "_name",
      });
    });

    })

  }

  // static onClickInputZone() {
  //   $(document).on('click', '.input-zone', function () {
  //     console.log('test')
  //     $('.js-image-upload').click()
  //   })
  // }
}

