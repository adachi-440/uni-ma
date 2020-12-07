import MainRegistrationsForm from './pages/main_registartions/form';
import ItemsForm from "./pages/items/form";
import ItemsImageUpload from "./pages/items/image_upload";
import CommonForm from "./commons/form";

[
  MainRegistrationsForm,
  ItemsForm,
  ItemsImageUpload,
  CommonForm
].forEach((klass) => {
  let instance = new klass()
  instance.run()
})
