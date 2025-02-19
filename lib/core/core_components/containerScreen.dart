import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hall_gradition/core/consts/app_colors.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';

class ContainerScreen extends StatelessWidget {

  String title;
  double? height;
  double? weight;
  Color? colorContainer;
  FontWeight? fontWeight;
  double? fontSize;
  Color? colorTextStyle;
  Border? border;
 final SizedBox? sizedBox;
 final Padding? padding;

  ContainerScreen(
      {required this.title,
        this.height,
        this.weight,
        this.colorContainer,
        this.fontWeight,
        this.fontSize,
        this.colorTextStyle,
        this.border,
        this.sizedBox,
        this.padding
      });

  @override
  Widget build(BuildContext context) {
    return  Container(
      height:height != null ? height : 12.w,
      width:weight != null ? weight : 86.w,
      decoration: BoxDecoration(
          color:colorContainer != null
              ? colorContainer
              : AppColors.white,
          border:border != null ? border :Border(bottom: BorderSide(color: AppColors.col6,width: 1))
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 1.w),
        child: Row(
          children: [
            Padding(
              padding:
              EdgeInsets.only(left: 2.5.w, top: 1.w),
              child: Text(
                "$title",
                style: TextStyle(
                    color:colorTextStyle != null
                        ? colorTextStyle
                        : Colors.black87,
                    fontWeight:fontWeight != null ? fontWeight : FontWeight.w400,
                    fontSize:fontSize != null ? fontSize: 3.1.w),
              ),
            ),
            sizedBox ?? SizedBox(width: 28.w),
           padding ?? Padding(
              padding:
              EdgeInsets.only(bottom: 15.w, top: 1.w),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_drop_down,
                  size: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
