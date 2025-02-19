import 'package:flutter/cupertino.dart';
import 'package:hall_gradition/core/consts/app_colors.dart';

class TextUtiles extends StatelessWidget {
  String title;
  FontWeight? fontWeight;
  double? fontSize;
  Color? colorTextStyle;

  TextUtiles({
    required this.title,
    this.fontWeight,
    this.fontSize,
    this.colorTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "$title",
      style: TextStyle(
          fontSize: fontSize != null ? fontSize : 14,
          fontWeight: fontWeight != null ? fontWeight : FontWeight.bold,
          color:colorTextStyle != null ? colorTextStyle: AppColors.black
      ),
    );
  }
}
