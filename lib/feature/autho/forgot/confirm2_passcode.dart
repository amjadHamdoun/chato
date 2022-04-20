import 'package:chato/Globals.dart';
import 'package:chato/core/utils/color_manager.dart';
import 'package:chato/core/utils/font_manager.dart';
import 'package:chato/core/utils/styles_manager.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class Confirm2Screen extends StatefulWidget {
  const Confirm2Screen({Key? key}) : super(key: key);

  @override
  _Confirm2ScreenState createState() => _Confirm2ScreenState();
}

class _Confirm2ScreenState extends State<Confirm2Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 150.h,),
              Text(
                "Enter New Password".tr(),
                style: getRegularStyle(
                  color:Global.darkMode?ColorManager.backgroundColor: ColorManager.textColor,
                  fontSize: 21.sp,
                ),
              ),
              SizedBox(height: 40.h,),
              SizedBox(height: 45.h,
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding:EdgeInsets.only(top: 5.h,right: 10.w,left: 10.w) ,
                      hintStyle: getRegularStyle(color: ColorManager.hintText,fontSize:FontSize.s14 ),
                      hintText: "Password".tr(),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: ColorManager.hintText
                          )
                      )
                      ,border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:const BorderSide(
                          color: ColorManager.hintText
                      )

                  )
                  ),
                ),
              ),
              SizedBox(height: 80.h,),
              SizedBox(
                  height: 45.h,
                  width: 335.w,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Confirm".tr(),
                      style: getRegularStyle(
                          color: ColorManager.lightTextColor,
                          fontSize: 15.sp),
                    ),
                  )),
            ],
          ),
        ),
      ),
    ));
  }
}
