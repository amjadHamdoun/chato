import 'package:chato/Globals.dart';
import 'package:chato/core/utils/color_manager.dart';
import 'package:chato/core/utils/font_manager.dart';
import 'package:chato/core/utils/styles_manager.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../login/login_screen.dart';



class ConfirmScreenSecond extends StatefulWidget {
  const ConfirmScreenSecond({Key? key}) : super(key: key);

  @override
  _ConfirmScreenSecondState createState() => _ConfirmScreenSecondState();
}

class _ConfirmScreenSecondState extends State<ConfirmScreenSecond> {
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
                    onPressed: () {

                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                          const LoginScreen()), (Route<dynamic> route) => false);
                    },
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
