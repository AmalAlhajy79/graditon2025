import 'package:flutter/material.dart';
import 'package:hall_gradition/core/consts/app_colors.dart';
import 'package:hall_gradition/core/core_components/button.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';

import '../../../../../../core/core_components/navBar-user-hall.dart';


class SendUserComplaintScreen extends StatelessWidget {
  static const name = '/SendUserComplaintScreen';

  // static final page = GetPage(
  //     name: name,
  //     page: () => ViewHallPolicyScreen(),
  //     binding: ViewHallPolicyBinding());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('complaint',
            style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 19,
                fontWeight: FontWeight.w500)),
        centerTitle: true,
        backgroundColor: AppColors.zayteFateh2,
      ),
      body: Container(
        color: AppColors.zayteFateh2,
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  height: 80.w,
                  width: 100.w,
                  child: Image.asset("assets/images/complaint.png",
                      fit: BoxFit.values.first),
                ),
                Container(
                  height: 64.w,
                  width: 90.w,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      border: Border(right: BorderSide(width: 1),left:  BorderSide(width: 1))
                    //  borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                   color: Colors.white70,
                    child: ListView(
                      children: [
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                //  borderRadius: BorderRadius.circular(10),
                              ),

                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Write what you complaint..',
                                  filled: true,
                                  fillColor: AppColors.gerysuggest,
                                  hintStyle: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                  contentPadding: EdgeInsets.only(
                                      top: 3.w,
                                      left: 4.w,
                                      right: 8.w,
                                      bottom: 20.w),
                                  enabledBorder: OutlineInputBorder(
                                    // borderRadius: BorderRadius.circular(30.0), // حواف دائرية
                                    borderSide: BorderSide(
                                        color:
                                            Colors.transparent), // لا يظهر الخط
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    // borderRadius: BorderRadius.circular(30.0), // حواف دائرية
                                    borderSide: BorderSide(
                                        color:
                                            Colors.transparent), // لا يظهر الخط
                                  ),
                                  border: OutlineInputBorder(
                                    //  borderRadius: BorderRadius.circular(30.0), // حواف دائرية
                                    borderSide: BorderSide(
                                        color:
                                            Colors.transparent), // لا يظهر الخط
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.only(
                                top: 4.w,
                              ),
                              child: ButtonScreen(
                                title: 'Send',
                                onTap: () {},
                                fontSize: 17,
                                colorContainer: AppColors.zayteGamiq,
                                borderRadius: BorderRadius.zero,
                                height: 10.w,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            EdgeInsets.only(left: 5.w, right: 5.w, bottom: 2.w, top: 3.2.w),
        child: UserNavigBarHallDetails(),
      ),
      backgroundColor: AppColors.zayteFateh2,
    );
  }
}
