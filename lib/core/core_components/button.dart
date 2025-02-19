import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';

import '../consts/app_colors.dart';

class ButtonScreen extends StatelessWidget {
  String title;
  double? height;
  double? weight;
  Color? colorContainer;
  FontWeight? fontWeight;
  double? fontSize;
  Color? colorTextStyle;
  BorderRadius? borderRadius;
  Decoration? decoration;
  Function() onTap;


  ButtonScreen(
      {required this.title,
        this.height,
        this.weight,
        this.colorContainer,
        this.fontWeight,
        this.fontSize,
        this.colorTextStyle,
        this.borderRadius,
        this.decoration,
        required this.onTap
        });
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap:onTap != null ? onTap :(){},
      child: Container(
        height:height != null ? height : 12.w,
        width:weight != null ? weight : 86.w,
        decoration: decoration != null
            ? decoration
            : BoxDecoration(
            color:colorContainer != null
                ? colorContainer
                : AppColors.col6,
            borderRadius:borderRadius != null ? borderRadius :
            BorderRadius.all( Radius.circular(14))),
        child: Padding(
          padding: EdgeInsets.only(left: 1.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Text(
                    "$title",
                    style: TextStyle(
                        color: colorTextStyle != null
                            ? colorTextStyle
                            : AppColors.white,
                        fontWeight:fontWeight != null ? fontWeight : FontWeight.bold,
                        fontSize:fontSize != null ? fontSize: 4.w),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
