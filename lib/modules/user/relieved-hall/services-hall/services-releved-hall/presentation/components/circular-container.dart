import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hall_gradition/core/consts/app_colors.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';

class CircularContainerScreen extends StatelessWidget {
  String title;
  double? height;
  double? weight;
  Color? colorContainer;
  FontWeight? fontWeight;
  double? fontSize;
  Color? colorTextStyle;
  Border? border;
  BorderRadius? borderRadius;
  CircularContainerScreen(
      {required this.title,
        this.height,
        this.weight,
        this.colorContainer,
        this.fontWeight,
        this.fontSize,
        this.colorTextStyle,
        this.border,
        this.borderRadius
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height != null ? height : 12.w,
      width: weight != null ? weight : 86.w,
      decoration: BoxDecoration(
          color: colorContainer != null ? colorContainer : Colors.grey.withAlpha(60),
          borderRadius:borderRadius!=null?borderRadius: BorderRadius.zero,
          border: border != null
              ? border
              : Border(bottom: BorderSide(color: Colors.black54, width: 1))
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "$title",
              style: TextStyle(
                  color: colorTextStyle != null
                      ? colorTextStyle
                      : Colors.black87,
                  fontWeight:
                  fontWeight != null ? fontWeight : FontWeight.w400,
                  fontSize: fontSize != null ? fontSize : 3.3.w),
            ),
          ),
        ],
      ),
    );
  }
}
