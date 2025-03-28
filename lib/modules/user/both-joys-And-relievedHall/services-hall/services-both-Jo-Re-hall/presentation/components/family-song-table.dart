import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hall_gradition/core/ui_sizer/app_sizer.dart';

import '../controller/services-both-Jo-Re/services-both-Jo-Re-hall-Controller.dart';

class FamilySongTable extends StatelessWidget {
  final BothJoysReHallController controller = Get.find();
  final List<String> familyMembers = ['أحمد', 'منى', 'سامي', 'سارة'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          return SingleChildScrollView(
            child: Container(
          width: 83.w,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(2),
              ),
              child: DataTable(
                columns: [
                  DataColumn(
                      label: Text('Song name',
                          style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13),)),
                  DataColumn(
                      label: Text('dance with',
                          style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13)),
                  ),
                ],
                rows: controller.rows.map((row) {
                  return DataRow(
                      cells: [
                    DataCell(
                      TextField(
                        onChanged: (value) {
                          row['song'] = value;
                        },
                        decoration: InputDecoration(
                          hintText: '',
                        ),
                      ),
                    ),
                    DataCell(
                      DropdownButton<String>(
                        value: row['name']!.isNotEmpty ? row['name'] : null,
                        hint: Text('select one people',
                            style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15)),
                        items: familyMembers.map((String member) {
                          return DropdownMenuItem<String>(
                            value: member,
                            child: Text(member),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          row['name'] = newValue ?? '';
                          controller.rows.refresh();
                        },
                      ),
                    ),
                  ]);
                }).toList(),
                border: TableBorder(
                  horizontalInside: BorderSide(color: Colors.black, width: 1),
                  verticalInside: BorderSide(color: Colors.black, width: 1),
                  // left: BorderSide(color: Colors.grey, width: 0.5),
                  // right: BorderSide(color: Colors.grey, width: 0.5),
                  top: BorderSide(color: Colors.black, width: 0.7),
                  bottom: BorderSide(color: Colors.black, width: 0.7),
                ),
                headingRowColor: MaterialStateColor.resolveWith((states) => Colors.grey.shade200),
              ),
            ),
          );
        }),
        SizedBox(height: 2.4.w,),
        Padding(
          padding: EdgeInsets.only(left: 1.w, right: 1.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  controller.removeRow();
                },
                child: Container(
                  height: 7.w,
                  width: 6.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border(
                        left: BorderSide(width: 1.8),
                        right: BorderSide(width: 1.8),
                        top: BorderSide(width: 1.8),
                        bottom: BorderSide(width: 1.8),
                      )),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 3.w),
                    child: Icon(
                      Icons.minimize_rounded,
                      size: 4.w,
                    ),
                  ),
                ),
              ),
             SizedBox(width: 10.w),
              InkWell(
                onTap: () {
                  controller.addRow();
                },
                child: Container(
                  height: 7.w,
                  width: 6.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border(
                        left: BorderSide(width: 1.8),
                        right: BorderSide(width: 1.8),
                        top: BorderSide(width: 1.8),
                        bottom: BorderSide(width: 1.8),
                      )),
                  child: Icon(
                    Icons.add,
                    size: 4.w,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
