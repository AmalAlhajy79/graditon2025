import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/consts/app_colors.dart';
import 'package:hall_gradition/core/core_components/textUtiles.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';
import '../../../../../../core/core_components/app_scaffold.dart';
import '../../../../../core/core_components/navigationBar.dart';
import '../../../../../core/core_components/rating.dart';
import '../controller/home-hall-admin/home-hall-admin-binding.dart';

class HomeHallAdminScreen extends StatelessWidget {
  // const WaitHallAdminScreen({Key? key}) : super(key: key);

  static const name = '/HomeHallAdminScreen';
  static final page = GetPage(
      name: name,
      page: () => HomeHallAdminScreen(),
      binding: HomeHallAdminBinding());

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return AppScaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(left: 1.w, top: 6.w, right: 1.w, bottom: 5.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextUtiles(
                    title: "Al-Shame Place",
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  )
                ],
              ),
            ),
            Container(
              child: Stack(
                //alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 2.w, right: 2.w),
                    child: Container(
                      height: 70.w,
                      width: mq.width,
                      decoration: BoxDecoration(
                        color: AppColors.col6,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 20.w),
                        child: Container(
                          //height: 50.w,
                          width: mq.width,
                          child: Image.asset("assets/images/hall1.jpg",
                              fit: BoxFit.fitWidth),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 44.w, left: 2.w, right: 2.w),
                    child: Container(
                      height: 96.w,
                      width: mq.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8.w),
                            topLeft: Radius.circular(8.w),
                          ),
                          color: Colors.white,
                          border: Border(
                            right: BorderSide(
                              width: 0.5,
                              color: Colors.grey,
                            ),
                            left: BorderSide(
                              width: 0.5,
                              color: Colors.grey,
                            ),
                          )),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 4.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 4.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.notifications_none_outlined,
                                        color: Colors.black,
                                        size: 20,
                                      ),
                                      TextUtiles(
                                          title: " Subscribe",
                                          fontWeight: FontWeight.w400),
                                    ],
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color(0xEF08C00C).withAlpha(100)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 4.w),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.place_outlined,
                                  size: 22,
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                TextUtiles(
                                    title: "Syria, Damascus, Mezzeh",
                                    fontSize: 12,
                                    colorTextStyle: Colors.black87.withAlpha(170)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2.5.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 4.w),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.people_alt_rounded,
                                  size: 21,
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                TextUtiles(
                                    title: "300 person",
                                    fontSize: 12,
                                    colorTextStyle: Colors.black87.withAlpha(170)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2.5.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 4.w),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.phone_outlined,
                                  size: 21,
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                TextUtiles(
                                    title: "0987654321",
                                    fontSize: 12,
                                    colorTextStyle:
                                        Colors.black87.withAlpha(170)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2.5.w,
                          ),
                          Padding(
                              padding:
                                  EdgeInsets.only(right: 25.w, left: 4.3.w),
                              child: RatingContainer()),
                          SizedBox(
                            height: 2.7.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 25.w, left: 4.w),
                            child: Row(
                              children: [
                                Container(
                                  height: 8.w,
                                  width: 28.w,
                                  child: Center(
                                    child: TextUtiles(
                                        title: "Lounge photos :",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(2.w),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1, // مدى انتشار الظل
                                        blurRadius: 4, // مدى تمويه الظل
                                        offset: Offset(
                                            0, 3), // الإزاحة (يمين، أسفل)
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 3.5.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 3.w),
                            child: Container(
                              height: 36.w,
                              width: mq.width,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2, // مدى انتشار الظل
                                    blurRadius: 5, // مدى تمويه الظل
                                    offset:
                                        Offset(0, 3), // الإزاحة (يمين، أسفل)
                                  ),
                                ],
                              ),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 2.w), // مسافة بين الصور
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(1),
                                      child: Image.asset(
                                        "assets/images/hallPicture1.jpg",
                                        fit: BoxFit.cover,
                                        width: 42.w, // عرض كل صورة
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
     bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
