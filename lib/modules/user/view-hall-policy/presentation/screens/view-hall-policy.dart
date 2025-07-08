import 'package:flutter/material.dart';
import 'package:hall_gradition/core/consts/app_colors.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';

import '../../../../../core/core_components/navBar-user-hall.dart';

// void main() {
//   runApp( MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home:ViewHallPolicyScreen(),
//     );
//   }
// }


class ViewHallPolicyScreen extends StatelessWidget {
  static const name = '/ViewHallPolicyScreen';
  // static final page = GetPage(
  //     name: name,
  //     page: () => ViewHallPolicyScreen(),
  //     binding: ViewHallPolicyBinding());
  final List<String> policySections = [
    'Please arrive at least five minutes before your reservation time.',
    'Bringing food and drinks from outside the lounge is not allowed.',
    'Please respect the privacy of others inside the lounge.',
    'The user is responsible for any damage to the equipment or the lounge.',
    'Please arrive at least five minutes before your reservation time.',
    'Bringing food and drinks from outside the lounge is not allowed.',
    'Please respect the privacy of others inside the lounge.',
    'The user is responsible for any damage to the equipment or the lounge.',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('privacy policy', style: TextStyle(fontFamily: 'Arial',fontSize: 19,fontWeight: FontWeight.w500)),
        centerTitle: true,
        backgroundColor:AppColors.zayteFateh,
      ),
      body: Container(
        color: AppColors.zayteFateh,
        child: Padding(
          padding:  EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      height: 123.w,
                      child: ListView(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: policySections.map((section) {
                              return
                                Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('● ', style: TextStyle(fontSize: 8)),
                                    Expanded(
                                      child: Text(
                                        section,
                                        style: TextStyle(fontSize: 16),
                                        textAlign: TextAlign.left, // هذا لضبط المحاذاة من اليسار
                                        textDirection: TextDirection.ltr, // هذا لجعل تدفق النص من اليسار لليمين
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
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
      ),
      bottomNavigationBar:   Padding(
        padding: EdgeInsets.only(
            left: 5.w, right: 5.w, bottom: 2.w, top: 3.2.w),
        child: UserNavigBarHallDetails(),
      ),backgroundColor: AppColors.zayteFateh,
    );

  }
}
