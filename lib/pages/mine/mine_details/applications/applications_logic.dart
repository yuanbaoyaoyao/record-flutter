import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'applications_state.dart';

class ApplicationsLogic extends GetxController {
  final ApplicationsState state = ApplicationsState();

  late final TextEditingController textTypeEditingController;

  late final TextEditingController textModelEditingController;

  late final TextEditingController textNumberEditingController;

  late final TextEditingController textAddressEditingController;

  late final TextEditingController textDescriptionEditingController;

  final ImagePicker imagePicker = ImagePicker();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    textTypeEditingController = TextEditingController();

    textModelEditingController = TextEditingController();

    textNumberEditingController = TextEditingController();

    textAddressEditingController = TextEditingController();

    textDescriptionEditingController = TextEditingController();
  }

  Future handleGetImage(BuildContext context) async {
    late XFile? image;
    if (state.isGallery == true) {
      image = await imagePicker.pickImage(source: ImageSource.gallery);
      state.isGallery = false;
    }else if(state.isCamera == true){
      image = await imagePicker.pickImage(source: ImageSource.camera);
      state.isGallery = false;
    }
    if (image != null) {
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textTypeEditingController.dispose();

    textModelEditingController.dispose();

    textNumberEditingController.dispose();

    textAddressEditingController.dispose();

    textDescriptionEditingController.dispose();
  }
}
