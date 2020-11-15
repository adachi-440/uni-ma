import MainRegistrationsForm from './pages/main_registartions/form';
import ItemsForm from "./pages/items/form";
import ItemsImageUpload from "./pages/items/image_upload";
[
  MainRegistrationsForm,
  ItemsForm,
  ItemsImageUpload
].forEach((klass) => {
  let instance = new klass()
  instance.run()
})
