import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/consts/app_colors.dart';
import 'package:hall_gradition/core/core_components/textUtiles.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';

import '../../../../../core/core_components/navBar-user-hall.dart';
import '../controller/user-inquiry-binding.dart';
import '../controller/user-inquiry-controller.dart';

//merge send and view

class ChatUserScreen extends GetView<ChatUserController> {
  static const name = '/ChatUserScreen';
  static final page = GetPage(
      name: name, page: () => ChatUserScreen(), binding: ChatUserBinding());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: TextUtiles(title: 'Chat',fontSize: 19),
      // ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                height: 10.w,
                // color: AppColors.white,
                child: TextUtiles(title: 'Chat', fontSize: 19),
              ),
              Container(
                height: 33.w,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 1)),
                  color: AppColors.zayteFateh,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 4.w, top: 2.w),
                      child: Row(
                        children: [
                          Container(
                              width: 20.w,
                              height: 6.8.w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.w)),
                              child: Center(
                                  child: TextUtiles(
                                title: 'Other',
                                fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    colorTextStyle: Colors.black54,
                              ))),
                        ],
                      ),
                    ),
                    Container(
                      height: 22.w,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 1.w),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {controller.launchWhatsApp();},
                                    child: Container(
                                      height: 8.5.w,
                                      width: 8.5.w,
                                      child: ClipRRect(
                                        child: Image.asset(
                                            "assets/images/whatsapp.jpg",
                                            fit: BoxFit.fill),
                                        borderRadius:
                                            BorderRadius.circular(13.w),

                                        // clipBehavior: Clip.antiAlias,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3.w,
                                  ),
                                  TextUtiles(title: 'WhatsApp', fontSize: 9),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 3.7.w,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {controller.launchTelegram();},
                                    icon: Icon(
                                      Icons.telegram,
                                      color: Colors.blue,
                                      size: 9.4.w,
                                    )),
                                TextUtiles(title: 'Telegram', fontSize: 9),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 87.w,
                width: 95.w,
                child:  Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (controller.inquiries.isEmpty) {
                    return const Center(child: Text('No queries'));
                  }

                  return ListView.builder(
                    itemCount: controller.inquiries.length,
                    itemBuilder: (context, index) {
                      final conversation = controller.inquiries[index];

                      return Column(
                        crossAxisAlignment: conversation.type == 'inquiry'
                            ? CrossAxisAlignment.start
                            : CrossAxisAlignment.end, // العرض حسب نوع الرسالة
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: conversation.type == 'inquiry' ? AppColors.zayteGamiq :  Colors.grey.withAlpha(110),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                                bottomLeft: conversation.type == 'response' ? Radius.circular(12) : Radius.zero,
                                bottomRight: conversation.type == 'inquiry' ? Radius.circular(12) : Radius.zero,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  conversation.message,
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: conversation.type == 'inquiry' ? Colors.white:Colors.black87),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  controller.formatDateTime(DateTime.parse(conversation.createdAt)),
                                  style:  TextStyle(fontSize: 9, color:conversation.type == 'inquiry' ? Colors.white70:Colors.green ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }),
                // Obx(() {
                //   if (controller.isLoading.value) {
                //     return const Center(child: CircularProgressIndicator());
                //   }
                //
                //   if (controller.inquiries.isEmpty) {
                //     return const Center(child: Text('لا توجد استفسارات'));
                //   }
                //
                //   return ListView.builder(
                //     itemCount: controller.inquiries.length,
                //     itemBuilder: (context, index) {
                //       final conversation = controller.inquiries[index].conversation[index];
                //
                //       return Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           // عرض المحادثة (سواء كانت استفسار أو رد)
                //           conversation.type == 'inquiry'
                //          // conversation.ty == 'inquiry'
                //           // عرض الاستفسار على اليسار
                //               ? Container(
                //             margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                //             padding: const EdgeInsets.all(12),
                //             decoration: BoxDecoration(
                //               color: AppColors.zayteGamiq,
                //               borderRadius: BorderRadius.only(
                //                 topLeft: Radius.circular(12),
                //                 topRight: Radius.circular(12),
                //                 bottomRight: Radius.circular(12),
                //               ),
                //             ),
                //             child: Column(
                //               children: [
                //                 Text(
                //                   conversation.message,
                //                   style: const TextStyle(
                //                     fontSize: 14,
                //                     fontWeight: FontWeight.w500,
                //                     color: Colors.white,
                //                   ),
                //                 ),
                //                 SizedBox(height: 4),
                //                 Text(
                //                   controller.formatDateTime(DateTime.parse(conversation.createdAt)),
                //                   style: const TextStyle(
                //                     fontSize: 9,
                //                     color: Colors.blue,
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           )
                //           // عرض الردود على اليمين
                //               : Row(
                //             mainAxisAlignment: MainAxisAlignment.end,
                //             children: [
                //               Container(
                //                 constraints: BoxConstraints(
                //                   maxWidth: MediaQuery.of(context).size.width * 0.7,
                //                 ),
                //                 margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                //                 padding: const EdgeInsets.all(12),
                //                 decoration: BoxDecoration(
                //                   color: Colors.grey.shade300,
                //                   borderRadius: const BorderRadius.only(
                //                     topLeft: Radius.circular(12),
                //                     topRight: Radius.circular(12),
                //                     bottomLeft: Radius.circular(12),
                //                   ),
                //                 ),
                //                 child: Column(
                //                   children: [
                //                     Text(
                //                       conversation.message,
                //                       style: const TextStyle(
                //                         fontSize: 14,
                //                         color: Colors.black,
                //                       ),
                //                     ),
                //                     SizedBox(height: 4),
                //                     Text(
                //                       controller.formatDateTime(DateTime.parse(conversation.createdAt)),
                //                       style: const TextStyle(
                //                         fontSize: 9,
                //                         color: Colors.pink,
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ],
                //       );
                //     },
                //   );
                // }),
              ),

              Padding(
                padding: EdgeInsets.only(left: 3.w, right: 2.w, top: 3.w),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller.message_Controller,
                        decoration: InputDecoration(
                          hintText: 'Write your message now..',
                          hintStyle:
                              TextStyle(fontSize: 12, color: Colors.grey),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        if (controller.message_Controller.text.isNotEmpty) {
                          controller.fetchInquiries();
                          controller.sendUserInquiry();
                          controller.fetchInquiries();
                          controller.fetchInquiries();
                          //controller.sendMessage(messageController.text);
                          controller.message_Controller.clear();
                        }
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 5.w, right: 5.w, bottom: 1.w, top: 3.w),
                child: UserNavigBarHallDetails(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
