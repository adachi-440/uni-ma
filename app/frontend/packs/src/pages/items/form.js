export default class ItemsForm {
  constructor() {
  }

  run() {
    ItemsForm.onSelectedSubCategory()
    ItemsForm.onClickFillInLectureInfo()
  }

  static onSelectedSubCategory() {
    $(document).on('change', '.js-sub-category-select', (event) => {
      const $departmentCategory = $('.js-department-category-select')
      const value = $('.js-sub-category-select').val()
      $departmentCategory.prop('disabled', true)
      $departmentCategory.children().remove()
      if (value != null && value != '選択してください') {

        $.ajax({
          url: '/items/department_category_search',
          type: 'GET',
          timeout: 1000,
          dataType: 'json',
          data: {
            item_sub_category_id : value
          }
        })
          .done((data) => {
            this.subCategoryAjaxSuccessAction(data)
            $departmentCategory.prop('disabled', false)
          })
          .fail((data) => {
            console.log(data)
            // todo エラーメッセージの作成
          })
          .always((data) => {
          })
      }
    })
  }

  static subCategoryAjaxSuccessAction(data) {
    $('.js-department-category-select').append(
      $("<option>")
        .val('')
        .text('選択してください')
    )
    $.each(data, function (key, value) {
      $('.js-department-category-select').append(
        $("<option>")
          .val(value.id)
          .text(value.label)
      )
    })
  }

  static onClickFillInLectureInfo() {
    $(document).on('change', '.js-fill-in-lecture-info', (event) => {
      const $lectureForm = $('.js-lecture-form')
      if($(event.target).prop('checked')){
        $lectureForm.show()
      }else{
        $lectureForm.hide()
      }
    })
  }
}
