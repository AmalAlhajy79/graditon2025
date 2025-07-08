import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';

import '../../modules/user/feedback/presentaion/controller/user-SendFeedbackRat-controller.dart';

class RatingContainer extends StatefulWidget {
  @override
  _RatingContainerState createState() => _RatingContainerState();
}

class _RatingContainerState extends State<RatingContainer> {

  FeedbackController controller=Get.put(FeedbackController());
  double _rating = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RatingBar.builder(
          initialRating:controller.viewUserRating!=null?controller.viewUserRating.toDouble():_rating,// _rating,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
        itemSize: 18,
         itemPadding: EdgeInsets.symmetric(horizontal:1 ),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.orange.shade300,
          ),
          onRatingUpdate: (rating) {
            // setState(() {
            //   _rating =controller.viewUserRating;// rating;
            // });
          },
        ),
      ],
    );
  }
}
