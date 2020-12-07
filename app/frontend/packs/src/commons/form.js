import Select2 from 'select2/dist/js/select2'
export default class CommonForm {
  constructor() {
  }

  run() {
    CommonForm.select2();
  }

  static select2() {
    document.addEventListener("DOMContentLoaded", () => {
      $(".js-select2").select2({
        theme: 'bootstrap',
        width: '100%'
      })
    })
  }
}