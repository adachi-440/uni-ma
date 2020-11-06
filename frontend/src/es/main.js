import MainRegistrationsAjax from './pages/main_registartions/form';

[
  MainRegistrationsAjax
].forEach((klass) => {
  let instance = new klass()
  instance.run()
})
