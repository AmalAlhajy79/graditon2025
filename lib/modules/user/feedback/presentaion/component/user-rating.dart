import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';

import '../controller/user-SendFeedbackRat-controller.dart';

class RatingUserContainer extends StatefulWidget {
  @override
  _RatingContainerState createState() => _RatingContainerState();
}

class _RatingContainerState extends State<RatingUserContainer> {
  double rating = 0;
  FeedbackController controller=Get.put(FeedbackController());
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RatingBar.builder(
          initialRating: rating,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 30,
          itemPadding: EdgeInsets.symmetric(horizontal:1 ),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.orange.shade300,
          ),
          onRatingUpdate: (rating) {
            setState(() {
              rating = rating;
           controller.rating_user=rating.toInt();
              print('controller.rating_user.............');
              print(controller.rating_user);

            });
          },
        ),
      ],
    );
  }
}
