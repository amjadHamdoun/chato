import 'package:chato/Globals.dart';
import 'package:chato/core/utils/color_manager.dart';
import 'package:chato/core/utils/font_manager.dart';
import 'package:chato/core/utils/styles_manager.dart';
import 'package:chato/core/utils/svg_manager.dart';
import 'package:chato/core/utils/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var checkBoxValue = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 210.h,
            width: double.infinity,
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset(
                          SvgManger.register3,
                          width: 150.w,
                          height: 160.h,
                        )
                      ],
                    ),
                  ],
                ),
                Image.asset(
                  SvgManger.register2,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  height: 165.h,
                ),
                Image.asset(
                  SvgManger.register1,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  height: 140.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset(
                          SvgManger.register4,
                          width: 150.w,
                          height: 170.h,
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Create Account".tr(),
            style: getLightStyle(
                color: Global.darkMode
                    ? ColorManager.backgroundColor
                    : ColorManager.primaryColor,
                fontSize: 26.sp),
          ),
          Text(
            "join to chato world".tr(),
            style: getLightStyle(
                color: ColorManager.hintText, fontSize: FontSize.s17),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: AppPadding.p16.w, horizontal: AppPadding.p20.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Name".tr(),
                      style: TextStyle(
                          color: Global.darkMode
                              ? ColorManager.backgroundColor
                              : ColorManager.textColor,
                          fontSize: 15.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 4.h),
                  height: 45.h,
                  child: TextFormField(
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp("[a-zA-Z.-_]")),
                      ],
                    decoration: InputDecoration(
                        hintText: "First Name".tr(),
                        hintStyle: TextStyle(
                            color: ColorManager.hintText, fontSize: 14.sp),
                        icon: Icon(
                          Icons.person_outline_outlined,
                          size: 18.w,
                          color: ColorManager.hintText,
                        ),
                        disabledBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorManager.hintText)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Global.darkMode
                                    ? ColorManager.backgroundColor
                                    : ColorManager.textColor)),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorManager.hintText))),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 4.h),
                  height: 45.h,
                  child: TextFormField(
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp("[a-zA-Z.-_]")),
                    ],
                    decoration: InputDecoration(
                      hintText: "Last Name".tr(),
                      hintStyle: TextStyle(
                        color: ColorManager.hintText,
                        fontSize: 14.sp,
                      ),
                      icon: Icon(
                        Icons.person_outline_outlined,
                        size: 18.w,
                        color: ColorManager.hintText,
                      ),
                      disabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: ColorManager.hintText)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Global.darkMode
                                  ? ColorManager.backgroundColor
                                  : ColorManager.textColor)),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: ColorManager.hintText)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    Text(
                      "Information".tr(),
                      style: TextStyle(
                          color: Global.darkMode
                              ? ColorManager.backgroundColor
                              : ColorManager.textColor,
                          fontSize: 15.sp),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 4.h),
                  height: 45.h,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Email".tr(),
                      hintStyle: TextStyle(
                        color: ColorManager.hintText,
                        fontSize: 14.sp,
                      ),
                      icon: Icon(
                        Icons.email_outlined,
                        size: 18.w,
                        color: ColorManager.hintText,
                      ),
                      disabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: ColorManager.hintText)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Global.darkMode
                                  ? ColorManager.backgroundColor
                                  : ColorManager.textColor)),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: ColorManager.hintText)),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 4.h),
                  height: 45.h,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Phone Number".tr(),
                      hintStyle: TextStyle(
                        color: ColorManager.hintText,
                        fontSize: 14.sp,
                      ),
                      icon: Icon(
                        Icons.phone_outlined,
                        size: 18.w,
                        color: ColorManager.hintText,
                      ),
                      disabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: ColorManager.hintText)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Global.darkMode
                                  ? ColorManager.backgroundColor
                                  : ColorManager.textColor)),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: ColorManager.hintText)),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 4.h),
                  height: 45.h,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Password".tr(),
                      hintStyle: TextStyle(
                        color: ColorManager.hintText,
                        fontSize: 14.sp,
                      ),
                      icon: Icon(
                        Icons.lock_outline,
                        size: 18.w,
                        color: ColorManager.hintText,
                      ),
                      disabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: ColorManager.hintText)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Global.darkMode
                                  ? ColorManager.backgroundColor
                                  : ColorManager.textColor)),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: ColorManager.hintText)),
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                Row(
                  children: [
                    Container(
                      height: 19.h,
                      width: 19.w,
                      child: Checkbox(
                          side: BorderSide(
                          width: 0.5,
                            color: Global.darkMode
                                ? ColorManager.backgroundColor
                                : ColorManager.textColor,
                          ),
                          value: checkBoxValue,
                          activeColor: ColorManager.primaryColor,
                          onChanged: (newValue) {
                            setState(() {
                              checkBoxValue = newValue!;
                            });
                          }),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "I agree to all".tr(),
                      style: getRegularStyle(
                          color: Global.darkMode
                              ? ColorManager.backgroundColor
                              : ColorManager.textColor,
                          fontSize: FontSize.s14),
                    ),
                    InkWell(
                        onTap: () {},
                        child: Text(
                          " terms of use".tr(),
                          style: getRegularStyle(
                              color: ColorManager.primaryColor,
                              fontSize: FontSize.s14),
                        ))
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                    height: 45.h,
                    width: 335.w,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Create Account".tr(),
                        style: getRegularStyle(
                            color: ColorManager.lightTextColor,
                            fontSize: 15.sp),
                      ),
                    )),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "do you have an account?".tr(),
                      style: getRegularStyle(
                          color: Global.darkMode
                              ? ColorManager.hintText
                              : ColorManager.textColor,
                          fontSize: FontSize.s14),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginScreen()),
                          );
                        },
                        child: Text(
                          "   login".tr(),
                          style: getRegularStyle(
                              color: Global.darkMode
                                  ? ColorManager.backgroundColor
                                  : ColorManager.primaryColor,
                              fontSize: FontSize.s14),
                        ))
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    )));
  }
}
