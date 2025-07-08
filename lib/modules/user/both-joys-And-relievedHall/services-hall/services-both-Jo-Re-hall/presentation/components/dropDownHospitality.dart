import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';

import '../controller/services-both-Jo-Re/services-both-Jo-Re-hall-Controller.dart';

class HospitalityRelivedBothDropdown extends StatelessWidget {

  final DropdownHospitalityRelivedBothController controller =
  Get.put(DropdownHospitalityRelivedBothController());
  final BothJoysReHallController bothJoysReHallController =
  Get.put(BothJoysReHallController());

  @override
  Widget build(BuildContext context) {
    // استخرج الأوصاف من بيانات الكونترولر
    final List<String> options = bothJoysReHallController.condolencesServices
        .where((service) => service.name == 'condolence_hospitality_services')
        .map<String>((service) => service.description?.toString() ?? '')
        .toList();

    return PopupMenuButton<String>(
      onSelected: (value) {
        controller.toggleValue(value);
      },
      itemBuilder: (BuildContext context) {
        return options.map((String option) {
          return PopupMenuItem<String>(
            value: option,
            child: Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(option),
                  //هنا بس بدي عدل عليها بحيث احذف التشيك بوكس و خلي بالتفاصيل الاضافية يكتب شو بده ضيافة
                  Checkbox(
                    value: controller.isSelected(option),
                    onChanged: (bool? value) {
                      controller.toggleValue(option);
                      bothJoysReHallController.selectedHospitalityDetail.value = option;
                    },
                    checkColor: Colors.white,
                    activeColor: Colors.green,
                  ),
                ],
              );
            }),
          );
        }).toList();
      },
      child: Container(
        height: 8.w,
        width: 7.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 1.8),
        ),
        child: Icon(
          Icons.arrow_drop_down_outlined,
          size: 6.w,
        ),
      ),
    );
  }
}

class DropdownHospitalityRelivedBothController extends GetxController {
  var selectedValues = <String>{}.obs;

  void toggleValue(String value) {
    if (selectedValues.contains(value)) {
      selectedValues.remove(value);
    } else {
      selectedValues.add(value);
    }
  }

  bool isSelected(String value) {
    return selectedValues.contains(value);
  }

  bool hasSelectedValues() {
    return selectedValues.isNotEmpty;
  }
}

// class HospitalityRelivedBothDropdown extends StatelessWidget {
//   final DropdownHospitalityRelivedBothController controller = Get.put(DropdownHospitalityRelivedBothController());
//   BothJoysReHallController bothJoysReHallController=Get.put(BothJoysReHallController());
//   final List<String> options = ['Cumin and lemon', 'Bitter coffee', 'Date'];
//
//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuButton<String>(
//       onSelected: (value) {
//         controller.toggleValue(value);
//       },
//       itemBuilder: (BuildContext context) {
//         return options.map((String option) {
//           return PopupMenuItem<String>(
//             value: option,
//             child: Obx(() { // Wrap the Checkbox in Obx
//               return Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(option),
//                   Checkbox(
//                     value: controller.isSelected(option),
//                     onChanged: (bool? value) {
//                       controller.toggleValue(option);
//                       bothJoysReHallController.selectedHospitalityDetail.value=option;
//                     },
//                     checkColor: Colors.white,
//                     activeColor: Colors.green,
//                   ),
//                 ],
//               );
//             }),
//           );
//         }).toList();
//       },
//       child:
//       Container(
//         height: 8.w,
//         width: 7.w,
//         decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             border: Border(
//               left: BorderSide(width: 1.8),
//               right: BorderSide(width: 1.8),
//               top: BorderSide(width: 1.8),
//               bottom: BorderSide(width: 1.8),
//             )),
//         child: Icon(
//           Icons.arrow_drop_down_outlined,
//           size: 6.w,
//         ),
//       ),
//     );
//   }
// }
