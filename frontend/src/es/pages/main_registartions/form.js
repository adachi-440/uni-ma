export default class MainRegistrationsAjax {
  constructor() {
  }

  run(){
    MainRegistrationsAjax.onSelectedUniversity()
    MainRegistrationsAjax.onSelectedDepartment()
  }

  static onSelectedUniversity() {
    $(document).on('change', '.js-university-select', (event) => {
      const $target = $('.js-department-form')
      const value = $('.js-university-select option:selected').text()
      if (value != null && value != '選択してください') {

        $('.js-department-select').children().remove()

        $.ajax({
          url:'/users/main_registrations/department_search',
          type: 'GET',
          timeout: 1000,
          dataType: 'json',
          data: {
            university_name: value
          }
        })
          .done( (data) => {
            this.universityAjaxSuccessAction(data)
          })
          .fail( (data) => {
            console.log(data)
            // todo エラーメッセージの作成
          })
          .always( (data) => {
            $target.show()
          })
        $target.show()
      }else{
        $target.hide()
        $('.js-department-select').children().remove()
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
          url:'/users/main_registrations/faculty_search',
          type: 'GET',
          timeout: 1000,
          dataType: 'json',
          data: {
            university_name: university_value,
            department_name: department_value
          }
        })
          .done( (data) => {
            this.departmentAjaxSuccessAction(data)
          })
          .fail( (data) => {
            console.log(data)
            // todo エラーメッセージの作成
          })
          .always( (data) => {
            $target.show()
          })
        $target.show()
      }else{
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
    $.each( data, function( key, value ){
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
    $.each( data, function( key, value ){
      $('.js-faculty-select').append(
        $("<option>")
          .val(key)
          .text(key)
      )
    })
  }
}
