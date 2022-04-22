import 'package:chato/core/utils/color_manager.dart';
import 'package:chato/core/utils/font_manager.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateRoom extends StatefulWidget {
  const CreateRoom({Key? key}) : super(key: key);

  @override
  _CreateRoomState createState() => _CreateRoomState();
}

class _CreateRoomState extends State<CreateRoom> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
              child: Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Column(
        children: [
          Text(
              "Create Conversation Room".tr(),
              style: TextStyle(
                  fontSize: 22.sp,
                  color: ColorManager.primaryColor,
                  fontWeight: FontWeight.bold),
          ),
          SizedBox(
              height: 10.h,
          ),
          Row(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 100.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(90),
                              bottomLeft: Radius.circular(90)),
                          border: Border.all(
                              color: ColorManager.primaryColor, width: 1)),
                      height: 150.h,
                      width: 80.w,
                    )
                  ],
                ),
                Expanded(child: SizedBox()),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(75)),
                          border: Border.all(
                              color: ColorManager.primaryColor, width: 1)),
                      height: 150.h,
                      width: 150.w,
                    )
                  ],
                ),
              ],
          ),
          SizedBox(
              height: 20.h,
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        "Room Name".tr(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          color: ColorManager.primaryColor,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50.h,
                    child: TextField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ColorManager.primaryColor),
                          borderRadius: BorderRadius.circular(45),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ColorManager.primaryColor),
                          borderRadius: BorderRadius.circular(45),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "You don't have enough balance".tr(),
                    style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      color: ColorManager.primaryColor,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 200.h,),
                  Container(
                    padding: EdgeInsets.all(4),
                    height: 100.h,
                  width: 100.w,
                    decoration: BoxDecoration(
                      color: ColorManager.backgroundColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: ColorManager.primaryColor
                      )
                    ),
                    child: Container(alignment: Alignment.center,height: 90.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        color: ColorManager.primaryColor
                      ),child: Text("Create".tr(),style: TextStyle(
                        color: ColorManager.backgroundColor,
                        fontSize: FontSize.s20,
                        fontWeight: FontWeight.bold
                      ),),),
                  )
                ],
              ),
          )
        ],
      ),
    ),
            )));
  }
}
