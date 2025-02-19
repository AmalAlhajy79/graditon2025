import 'package:flutter/material.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';

import '../../../../../../core/consts/app_colors.dart';

class FieldContainerProfile extends StatelessWidget {
  // const FieldContainerProfile({Key? key}) : super(key: key);
  String title;
  String value;
  double? height;
  double? weight;
  Color? colorContainer;
  FontWeight? fontWeight;
  double? fontSize;
  Color? colorTextStyle;

  FieldContainerProfile(
      {required this.title,
      required this.value,
      this.height,
      this.weight,
      this.colorContainer,
      this.fontWeight,
      this.fontSize,
      this.colorTextStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height != null ? height : 12.w, //11.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colorContainer != null
            ? colorContainer
            : AppColors.field_Profile_grey.withAlpha(
                50), //AppColors.field_Profile_grey.withAlpha(50) //.grey.withAlpha(40),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 12,
          ),
          Text(
            " $title : $value", //"Phone Number : +963-987654321",
            style: TextStyle(
              fontWeight: fontWeight != null ? fontWeight : FontWeight.bold,
              //FontWeight.bold,
              fontSize: fontSize != null ? fontSize : 12,
              //12,
              color: colorTextStyle != null
                  ? colorTextStyle
                  : Colors.black87, //Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
