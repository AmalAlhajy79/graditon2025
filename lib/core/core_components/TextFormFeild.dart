import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';

import '../../../../../core/consts/app_colors.dart';
class TextFieldWhite extends StatelessWidget {
  String title;
  String? hint;
  double? height;
  double? weight;
  Color? colorContainer;
  FontWeight? fontWeight;
  double? fontSize;
  Color? colorTextStyle;
  FontWeight? hintfontWeight;
  double? hintfontSize;
  Color? hintcolorTextStyle;
  Icon? icon;
  Icon? suffixIcon;
  TextEditingController? controller;

  TextFieldWhite(
      {required this.title,
        this.height,
        this.weight,
        this.colorContainer,
        this.fontWeight,
        this.fontSize,
        this.colorTextStyle,
      this.icon,
        this.hint,
        this.hintcolorTextStyle,
        this.hintfontSize,
        this.hintfontWeight,
        this.controller,
        this.suffixIcon
      });
  @override
  Widget build(BuildContext context) {
    return Container(
        height:height != null ? height : 12.w,
        width:weight != null ? weight : 86.w,
        decoration: BoxDecoration(
          color:colorContainer != null
              ? colorContainer
              : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child:
        TextField(
        //  obscureText: true, // لإخفاء كلمة المرور
          controller: controller,
          decoration: InputDecoration(
            labelText: "$title",
            prefixIcon:icon != null
                ? icon
                :Text(""),
            suffixIcon:suffixIcon!=null?suffixIcon:Text("") ,
            hintStyle:  TextStyle(
              color: hintcolorTextStyle != null
                  ? hintcolorTextStyle
                  : Colors.grey,
              fontWeight:hintfontWeight != null ? hintfontWeight : FontWeight.w400,
              fontSize:hintfontSize != null ? hintfontSize : 3.4.w),
            labelStyle: TextStyle(
                color: colorTextStyle != null
                    ? colorTextStyle
                    : Colors.grey.shade600,
                fontWeight:fontWeight != null ? fontWeight : FontWeight.w400,
                fontSize:fontSize != null ? fontSize : 3.4.w),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14), // زوايا دائرية
              borderSide: BorderSide(color:Colors.black54, width: 1.0), // لون بني
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14), // زوايا دائرية عند التركيز
              borderSide: BorderSide(color:  Colors.black54, width: 1.0), // لون بني
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14), // زوايا دائرية عند التفعيل
              borderSide: BorderSide(color: Colors.black54, width: 1.0), // لون بني
            ),
          ),
        ),
      );
  }
}

