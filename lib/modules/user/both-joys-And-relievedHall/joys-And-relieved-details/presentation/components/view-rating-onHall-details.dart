import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../home-user/presentation/controller/home-user-controller.dart';


class Rating_ViewOneHall_Container extends StatefulWidget {
  @override
  _RatingContainerState createState() => _RatingContainerState();
}

class _RatingContainerState extends State<Rating_ViewOneHall_Container> {

  HomeUserController controller=Get.put(HomeUserController());
  double _rating = 0;
  @override
  Widget build(BuildContext context) {
    final ratingValue = controller.avg_Ratting_OneHall;
    print(ratingValue != null ? ratingValue.toDouble() : 0.0);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RatingBar.builder(
          initialRating: ratingValue != null ? ratingValue.toDouble() : 0.0,
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
            // يمكن تخزين التقييم الجديد هنا لو أردت
          },
        ),
      ],
    );
  }

// @override
  // Widget build(BuildContext context) {
  //   print(controller.avg_Ratting_OneHall.toDouble());
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     children: [
  //       // Obx(() =>
  //       RatingBar.builder(
  //         initialRating:controller.avg_Ratting_OneHall!=null?controller.avg_Ratting_OneHall.toDouble():_rating,// _rating,
  //         minRating: 1,
  //         direction: Axis.horizontal,
  //         allowHalfRating: true,
  //         itemCount: 5,
  //         itemSize: 18,
  //         itemPadding: EdgeInsets.symmetric(horizontal:1 ),
  //         itemBuilder: (context, _) => Icon(
  //           Icons.star,
  //           color: Colors.orange.shade300,
  //         ),
  //         onRatingUpdate: (rating) {
  //           // setState(() {
  //           //   _rating =controller.viewUserRating;// rating;
  //           // });
  //         },
  //       )
  //       //),
  //
  //     ],
  //   );
  // }
}
