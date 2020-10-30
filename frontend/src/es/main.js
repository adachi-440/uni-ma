import MainRegistrationsAjax from './pages/main_registartions/form';
import $ from 'jquery';

[
  MainRegistrationsAjax
].forEach((klass) => {
  let instance = new klass()
  instance.run()
})
