import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/home-user-controller.dart';

class Rating_Container extends StatelessWidget {
  final double rating;
  Rating_Container({required this.rating});

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: rating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 18,
      itemPadding: EdgeInsets.symmetric(horizontal: 1),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.orange.shade300,
      ),
      onRatingUpdate: (rating) {
        // Optional action
      },
    );
  }
}

// class Rating_Container extends StatefulWidget {
//   @override
//   _RatingContainerState createState() => _RatingContainerState();
// }
//
// class _RatingContainerState extends State<Rating_Container> {
//
//   HomeUserController controller=Get.put(HomeUserController());
//   double _rating = 0;
//   @override
//   Widget build(BuildContext context) {
//     print(controller.viewUserRating.toDouble());
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//        // Obx(() =>
//             RatingBar.builder(
//           initialRating:controller.viewUserRating!=null?controller.viewUserRating.toDouble():_rating,// _rating,
//           minRating: 1,
//           direction: Axis.horizontal,
//           allowHalfRating: true,
//           itemCount: 5,
//           itemSize: 18,
//           itemPadding: EdgeInsets.symmetric(horizontal:1 ),
//           itemBuilder: (context, _) => Icon(
//             Icons.star,
//             color: Colors.orange.shade300,
//           ),
//           onRatingUpdate: (rating) {
//             // setState(() {
//             //   _rating =controller.viewUserRating;// rating;
//             // });
//           },
//         )
//         //),
//
//       ],
//     );
//   }
// }
