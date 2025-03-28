import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../../../core/core_components/textUtiles.dart';
import '../controller/services-both-Jo-Re/services-both-Jo-Re-hall-Controller.dart';

class TextAndCheckBoxScreen extends StatelessWidget {
  String title;
  bool value;
  double? fontSize;
  Function (bool?) onChanged;
  TextAndCheckBoxScreen(
      {required this.title,
      required this.value,
        this.fontSize,
        required this.onChanged
      });

  @override
  Widget build(BuildContext context) {
    BothJoysReHallController controller=BothJoysReHallController();
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtiles(
            title: title,
            fontWeight: FontWeight.w500,
            fontSize:fontSize!=null?fontSize: 18,
            colorTextStyle: Colors.black87,
          ),
          Checkbox(
              value:value,
              onChanged:onChanged,
                  checkColor: Colors.white,
                  activeColor:Colors.green,
            ),
        ],
      );
  }
}
