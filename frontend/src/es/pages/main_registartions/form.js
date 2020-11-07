import Croppie from 'croppie/croppie';
export default class MainRegistrationsAjax {
  constructor() {
  }

  run() {
    MainRegistrationsAjax.onSelectedUniversity()
    MainRegistrationsAjax.onSelectedDepartment()
    MainRegistrationsAjax.onLoadPage()
    // MainRegistrationsAjax.previewProfileImage()
  }

  static onSelectedUniversity() {
    $(document).on('change', '.js-university-select', (event) => {
      const $departmentForm = $('.js-department-form')
      const $facultyForm = $('.js-faculty-form')
      const value = $('.js-university-select option:selected').text()
      if (value != null && value != '選択してください') {

        $facultyForm.hide()
        $('.js-department-select').children().remove()
        $('.js-faculty-select').children().remove()

        $.ajax({
          url: '/users/main_registrations/department_search',
          type: 'GET',
          timeout: 1000,
          dataType: 'json',
          data: {
            university_name: value
          }
        })
          .done((data) => {
            this.universityAjaxSuccessAction(data)
          })
          .fail((data) => {
            console.log(data)
            // todo エラーメッセージの作成
          })
          .always((data) => {
            $departmentForm.show()
          })
        $departmentForm.show()
      } else {
        $departmentForm.hide()
        $('.js-department-select').children().remove()
        $('.js-faculty-select').children().remove()
      }
    })
  }

  static onSelectedDepartment() {
    $(document).on('change', '.js-department-select', (event) => {
      const $target = $('.js-faculty-form')
      const university_value = $('.js-university-select option:selected').text()
      const department_value = $('.js-department-select option:selected').text()
      if (university_value != null && department_value != null && department_value != '選択してください') {
        $('.js-faculty-select').children().remove()
        $.ajax({
          url: '/users/main_registrations/faculty_search',
          type: 'GET',
          timeout: 1000,
          dataType: 'json',
          data: {
            university_name: university_value,
            department_name: department_value
          }
        })
          .done((data) => {
            this.departmentAjaxSuccessAction(data)
          })
          .fail((data) => {
            console.log(data)
            // todo エラーメッセージの作成
          })
          .always((data) => {
            $target.show()
          })
        $target.show()
      } else {
        $target.hide()
        $('.js-faculty-select').children().remove()
      }
    })
  }

  static universityAjaxSuccessAction(data) {
    $('.js-department-select').append(
      $("<option>")
        .val('')
        .text('選択してください')
    )
    $.each(data, function (key, value) {
      $('.js-department-select').append(
        $("<option>")
          .val(key)
          .text(key)
      )
    })
  }

  static departmentAjaxSuccessAction(data) {
    $('.js-faculty-select').append(
      $("<option>")
        .val('')
        .text('選択してください')
    )
    $.each(data, function (key, value) {
      $('.js-faculty-select').append(
        $("<option>")
          .val(key)
          .text(key)
      )
    })
  }

  static onLoadPage() {
    $(window).on('load', function () {
      const $departmentForm = $('.js-department-form')
      const $facultyForm = $('.js-faculty-form')
      const $departmentValue = $('.js-department-select option:selected').text()
      const $facultyValue = $('.js-faculty-select option:selected').text()
      if ($departmentValue !== '' && $departmentValue !== '選択してください') {
        $departmentForm.show()
      }

      if ($facultyValue !== '' && $facultyValue !== '選択してください') {
        $facultyForm.show()
      }
    })
  }

  // static previewProfileImage() {
  //   document.addEventListener('DOMContentLoaded', function() {
  //     let file = null // 選択されるファイル
  //     const reader = new FileReader()
  //
  //     const element = document.getElementById('js-profile-canvas')
  //     const croppie = new Croppie(element, {
  //       viewport: {
  //         width: 150,
  //         height: 150,
  //         type: 'circle'
  //       },
  //       boundary: {
  //         width: 500,
  //         height: 500
  //       },
  //       showZoomer: true,
  //       enableResize: false,
  //       enableOrientation: true,
  //       mouseWheelZoom: 'ctrl',
  //     })
  //
  //     $(document).on('click', '.js-image-upload', function (){
  //       croppie.result('blob').then(function(blob) {
  //         let formData = new FormData();
  //         formData.append('file', blob, 'filename')
  //         console.log([...formData.entries()])
  //         $.ajax({
  //           url: '/users/main_registrations/upload_profile_image',
  //           type: 'POST',
  //           timeout: 1000,
  //           dataType: 'json',
  //           processData: false,
  //           data: {
  //             profile_image: formData
  //           }
  //         })
  //           .done((data) => {
  //             alert('送信に成功しました')
  //           })
  //           .fail((data) => {
  //             console.log(data)
  //             // todo エラーメッセージの作成
  //           })
  //           .always((data) => {
  //             $('#croppieModal').hide()
  //           })
  //       })
  //     })
  //
  //     $(document).on('change', '#js-image-input', function () {
  //       file = $(this).prop('files')[0];
  //       if (typeof file === "undefined") {
  //         return;
  //       }
  //
  //       if (file.type.match(/^image\/(jpeg|png)$/) === null) {
  //         // jpegとpng以外の場合はクリアして終了
  //         const fileArea = document.getElementById("file-input");
  //         fileArea.innerHTML = fileArea.innerHTML;
  //         return;
  //       }
  //
  //       reader.onload = function (event) {
  //         croppie.bind({
  //           url: event.target.result,// base64
  //           orientation: 1
  //         })
  //       }
  //       reader.readAsDataURL(file);
  //     })
  //   })
  // }
}