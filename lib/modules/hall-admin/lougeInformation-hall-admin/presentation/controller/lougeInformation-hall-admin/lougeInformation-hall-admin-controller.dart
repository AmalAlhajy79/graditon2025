import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/consts/api_const.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../../../../home-hall-admin/presentation/screens/home-hall-admin-screen.dart';
import '../../screens/wait_HallAdmin_screen.dart';

class HallControllerrr extends GetxController {
  var isLoading = false.obs;

  List<XFile> selectedImages = [];
  // داخل HallController
  final formKey = GlobalKey<FormState>();

  final hallNameController = TextEditingController();
  final hallPlaceController = TextEditingController();
  final hallCapacityController = TextEditingController();
  final contactNumberController = TextEditingController();

  var hallImage = ''.obs;
  var imagePaths = <String>[].obs;

  var selectedType = ''.obs;
  var selectedEvents = <String>[].obs;

  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      hallImage.value = picked.path;
    }
  }

  Future<void> pickImages() async {
    final picked = await ImagePicker().pickMultiImage();
    if (picked.isNotEmpty) {
      selectedImages = picked;
      imagePaths.assignAll(picked.map((e) => e.path).toList());
    }
  }

  void createHall() async {
    if (!formKey.currentState!.validate()) return;

    if (hallImage.value.isEmpty) {
      Get.snackbar("خطأ", "يرجى اختيار صورة للقاعة");
      return;
    }

    if (selectedType.value.isEmpty || selectedEvents.isEmpty) {
      Get.snackbar("خطأ", "يرجى اختيار نوع القاعة والمناسبات");
      return;
    }

    await uploadDataWithImages(
      hallImage.value,
      selectedImages,
    );
  }



  Future<void> uploadDataWithImages(String hallImagePath, List<XFile> images) async {
    isLoading.value = true;

    var request = http.MultipartRequest(
      'POST',
      Uri.parse(ApiConst.loungeInformationHallAdmin),
    );
    request.headers['Accept'] =
    'application/json';
    request.headers['Authorization'] =
    'Bearer 17|kg3FsRlI96QHFSZvAQpzJztpThJp7fRrR7h08FRT84279c56';

    // صورة رئيسية
    request.files.add(
        await http.MultipartFile.fromPath('hall_image', hallImagePath));

    // // الصور الإضافية
    for (int i = 0; i < images.length; i++) {
      request.files.add(
        await http.MultipartFile.fromPath('images[$i]', images[i].path),
      );
    }
    // print(hallNameController.text);
    // print(hallCapacityController.text);
    // print(hallPlaceController.text);
    // print(contactNumberController.text);
    // print(selectedType.value);
    // print(selectedEvents);
    // print(hallImage.value);
    // print(images);
    // البيانات المرسلة
    request.fields.addAll({
      'name': hallNameController.text.trim(),
      'capacity': hallCapacityController.text.trim(),
      'location': hallPlaceController.text.trim(),
      'contact': contactNumberController.text.trim(),
      'type': selectedType.value.trim(),
    });

    // إزالة التكرار وتحويل القيم إلى حروف صغيرة
    List<String> uniqueEvents = selectedEvents.map((event) => event.toLowerCase()).toSet().toList();

    for (int i = 0; i < uniqueEvents.length; i++) {
      request.fields['events[$i]'] = uniqueEvents[i];
    }


// إرسال الصور الإضافية
    for (int i = 0; i < images.length; i++) {
      request.files.add(
        await http.MultipartFile.fromPath('images[$i]', images[i].path),
      );
    }

// طباعة الرد النصي
    var response = await request.send();
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("true........");

      Get.snackbar('نجاح', 'تم رفع البيانات بنجاح');
      Get.toNamed(WaitHallAdminScreen.name);
    } else {
      print("error........");
      Get.snackbar('خطأ', 'فشل في رفع البيانات');
    }
  }
  // Dropdown lounge type
  var selectedValues = <String>{}.obs;

  void toggleValue(String value) {
    if (selectedValues.contains(value)) {
      selectedValues.remove(value);
    } else {
      selectedValues.add(value);
      selectedType.value = value;
    }
  }

  bool isSelected(String value) {
    return selectedValues.contains(value);
  }

  bool hasSelectedValues() {
    return selectedValues.isNotEmpty;
  }

  // TypeEventsHall
  void toggleValueTypeEventsHall(String value) {
    if (selectedEvents.contains(value)) {
      selectedEvents.remove(value);
    } else {
      selectedEvents.add(value); // إضافة القيمة مباشرة إلى events
    }
  }

  bool isSelectedTypeEventsHall(String value) {
    return selectedEvents.contains(value);
  }

  bool hasSelectedValuesTypeEventsHall() {
    return selectedEvents.isNotEmpty;
  }

}
