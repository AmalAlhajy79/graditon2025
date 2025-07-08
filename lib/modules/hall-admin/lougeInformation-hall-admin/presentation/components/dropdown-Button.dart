import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';

import '../controller/lougeInformation-hall-admin/lougeInformation-hall-admin-controller.dart';

class TypeEventsHallDropdown extends GetView<HallControllerrr> {
  final List<String> options = [
    'wedding',
    'graduation',
    'birthday',
    'engagement',
    'funeral',
  ];

  // 🔧 الدالة المساعدة لتنسيق الاسم
  String formatEventName(String value) {
    return value
        .replaceAll('_', ' ')
        .split(' ')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PopupMenuButton<String>(
          onSelected: (value) {
            controller.toggleValueTypeEventsHall(value);
          },
          itemBuilder: (BuildContext context) {
            return options.map((String option) {
              return PopupMenuItem<String>(
                value: option,
                padding: EdgeInsets.only(left: 2.w, right: 1),
                child: Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(formatEventName(option)),  // 👈 عرض منسق
                      Checkbox(
                        value: controller.isSelectedTypeEventsHall(option),
                        onChanged: (bool? value) {
                          controller.toggleValueTypeEventsHall(option);
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
            height: 12.w,
            width: 86.w,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.black54, width: 1)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 2.w),
                  child: Text('Choose the type of events in the hall'),
                ),
                Icon(Icons.arrow_drop_down, size: 25),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

//////////////////////
// class TypeEventsHallDropdown extends GetView<HallControllerrr> {
//  // final TypeEventsHallDropdownController controller = Get.put(TypeEventsHallDropdownController());
//   final List<String> options = [
//     'wedding',
//     'graduation',
//     'birthday',
//     'reading_the_birth_of_prophet',
//     'newbaby',
//     'gender_reveal',
//     'receiving_pilgrims',
//     'vacation_with_the_quran',
//     'tie_the_knot',
//     'dressing_the_room',
//     'consolation'
//   ];
//
//   // final List<String> options = [
//   //   'Wedding',
//   //   'Gradation',
//   //   'Birthday',
//   //   'Reading the birth of of prophet',
//   //   'Newbaby',
//   //   'Gender reveal',
//   //   'Receiving pilgrims',
//   //   'Vacation with the Quran',
//   //   'Tie the knot',
//   //   'Dressing the room',
//   //   'consolation'
//   // ];
//   String formatEventName(String value) {
//     return value
//         .replaceAll('_', ' ')                   // استبدل "_" بـ " "
//         .split(' ')                             // قسم على حسب المسافات
//         .map((word) => word[0].toUpperCase() + word.substring(1))  // كبر أول حرف
//         .join(' ');                             // رجعهم مع بعض
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         PopupMenuButton<String>(
//           onSelected: (value) {
//             controller.toggleValueTypeEventsHall(value);
//           },
//
//           itemBuilder: (BuildContext context) {
//             return options.map((String option) {
//               return PopupMenuItem<String>(
//                 value: option,
//                 padding: EdgeInsets.only(left: 2.w,right: 1),
//                 child: Obx(() {
//                   // Wrap the Checkbox in Obx
//                   return Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(formatEventName(option)),
//                       Checkbox(
//                         value: controller.isSelectedTypeEventsHall(option),
//                         onChanged: (bool? value) {
//                           controller.toggleValueTypeEventsHall(option);
//                         },
//                         checkColor: Colors.white,
//                         activeColor: Colors.green,
//                       ),
//                     ],
//                   );
//                 }),
//               );
//             }).toList();
//           },
//           child: Container(
//             // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//             // decoration: BoxDecoration(
//             //   border: Border.all(color: Colors.grey),
//             //   borderRadius: BorderRadius.circular(8),
//             // ),
//             height: 12.w,
//             width: 86.w,
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 border: Border(
//                     bottom: BorderSide(color: Colors.black54, width: 1))),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(left: 2.w),
//                   child: Text('chose the type of events in the hall'),
//                 ),
//                 Icon(Icons.arrow_drop_down, size: 25),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
