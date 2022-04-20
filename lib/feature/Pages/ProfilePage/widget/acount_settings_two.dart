import 'package:chato/Globals.dart';
import 'package:chato/core/utils/color_manager.dart';
import 'package:chato/core/utils/styles_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../../../RoomConversation/widget/music/show_audio_player_bottom_sheet.dart';
import 'widgets.dart';

class AccountSettingsTwo extends StatefulWidget {
  const AccountSettingsTwo({Key? key}) : super(key: key);

  @override
  _AccountSettingsTwoState createState() => _AccountSettingsTwoState();
}

class _AccountSettingsTwoState extends State<AccountSettingsTwo> {
  bool hideState = false;
  bool lockState = false;
  TextEditingController pinCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            children: [
              Container(
                height: 76.h,
                width: 76.w,
                child: Image.asset(
                  "assets/images/alghadab.png",
                  fit: BoxFit.cover,
                ),
                decoration: const BoxDecoration(shape: BoxShape.circle),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "الغضب السوري",
                style: getMediumStyle(
                    fontSize: 16.sp,
                    color: Global.darkMode
                        ? ColorManager.backgroundColor
                        : ColorManager.textColor),
              ),
              Text(
                "الحمدلله رب العالمين",
                style:
                    getMediumStyle(color: ColorManager.hintText, fontSize: 13.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: ColorManager.backGroundIcon,
                        borderRadius: BorderRadius.circular(10)),
                    child: SvgPicture.asset(
                      "assets/icons/1_state.svg",
                      height: 25.h,
                      width: 25.w,
                    ),
                    height: 40.h,
                    width: 40.w,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    "State".tr(),
                    style: getRegularStyle(
                        fontSize: 14.sp,
                        color: Global.darkMode
                            ? ColorManager.backGroundIcon
                            : ColorManager.textColor),
                  )
                ],
              ),
              Divider(height: 20.h, thickness: 1,
                  color: ColorManager.hintText),
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: ColorManager.backGroundIcon,
                        borderRadius: BorderRadius.circular(10)),
                    child: SvgPicture.asset(
                      "assets/icons/4_lockdddddddddddddddd60px.svg",
                      height: 25.h,
                      width: 25.w,
                    ),
                    height: 40.h,
                    width: 40.w,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    "special lock".tr(),
                    style: getRegularStyle(
                        fontSize: 14.sp,
                        color: Global.darkMode
                            ? ColorManager.backGroundIcon
                            : ColorManager.textColor),
                  ),
                  const Expanded(child: SizedBox()),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                            width: 1,
                            color: Global.darkMode
                                ? ColorManager.hintText
                                : ColorManager.textColor)),
                    child: FlutterSwitch(
                        toggleColor: ColorManager.primaryColor,
                        activeColor: ColorManager.backgroundColor,
                        inactiveColor: ColorManager.backgroundColor,
                        height: 20.h,
                        width: 50.w,
                        value: lockState,
                        onToggle: (val) {
                          setState(() {
                            lockState = val;
                          });
                        }),
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
               Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: ColorManager.backGroundIcon,
                        borderRadius: BorderRadius.circular(10)),
                    child: SvgPicture.asset(
                      "assets/icons/6_hideAccount.svg",
                      height: 25.h,
                      width: 25.w,
                    ),
                    height: 40.h,
                    width: 40.w,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    "hide account".tr(),
                    style: getRegularStyle(
                        fontSize: 14.sp,
                        color: Global.darkMode
                            ? ColorManager.backGroundIcon
                            : ColorManager.textColor),
                  ),
                  const Expanded(child: SizedBox()),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                            width: 1,
                            color: Global.darkMode
                                ? ColorManager.hintText
                                : ColorManager.textColor)),
                    child: FlutterSwitch(
                        toggleColor: ColorManager.primaryColor,
                        activeColor: ColorManager.backgroundColor,
                        inactiveColor: ColorManager.backgroundColor,
                        height: 20.h,
                        width: 50.w,
                        value: hideState,
                        onToggle: (val) {
                          setState(() {
                            hideState = val;
                          });
                        }),
                  )
                ],
              ),
              Divider(height: 20.h, thickness: 1, color: ColorManager.hintText),
              InkWell(
                onTap: () {
                  showMenuBottomSheetEmailThree(
                    context,pinCode
                  );
                },
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: ColorManager.backGroundIcon,
                          borderRadius: BorderRadius.circular(10)),
                      child: SvgPicture.asset(
                        "assets/icons/5_mail_account_48px.svg",
                        height: 25.h,
                        width: 25.w,
                      ),
                      height: 40.h,
                      width: 40.w,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      "email".tr(),
                      style: getRegularStyle(
                          fontSize: 14.sp,
                          color: Global.darkMode
                              ? ColorManager.backGroundIcon
                              : ColorManager.textColor),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                onTap: (){
                   showAudioPlayerBottomSheet(context,false);
                },
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: ColorManager.backGroundIcon,
                          borderRadius: BorderRadius.circular(10)),
                      child: SvgPicture.asset(
                        "assets/icons/2_birthday_48px.svg",
                        height: 25.h,
                        width: 25.w,
                      ),
                      height: 40.h,
                      width: 40.w,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      "birthdays".tr(),
                      style: getRegularStyle(
                          fontSize: 14.sp,
                          color: Global.darkMode
                              ? ColorManager.backGroundIcon
                              : ColorManager.textColor),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: ColorManager.backGroundIcon,
                        borderRadius: BorderRadius.circular(10)),
                    child: SvgPicture.asset(
                      "assets/icons/9_user_location_48px.svg",
                      height: 25.h,
                      width: 25.w,
                    ),
                    height: 40.h,
                    width: 40.w,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    "city".tr(),
                    style: getRegularStyle(
                        fontSize: 14.sp,
                        color: Global.darkMode
                            ? ColorManager.backGroundIcon
                            : ColorManager.textColor),
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: ColorManager.backGroundIcon,
                        borderRadius: BorderRadius.circular(10)),
                    child: SvgPicture.asset(
                      "assets/icons/7_toilet_100px.svg",
                      height: 25.h,
                      width: 25.w,
                    ),
                    height: 40.h,
                    width: 40.w,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    "gender".tr(),
                    style: getRegularStyle(
                        fontSize: 14.sp,
                        color: Global.darkMode
                            ? ColorManager.backGroundIcon
                            : ColorManager.textColor),
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: ColorManager.backGroundIcon,
                        borderRadius: BorderRadius.circular(10)),
                    child: SvgPicture.asset(
                      "assets/icons/3_key_48px.svg",
                      height: 25.h,
                      width: 25.w,
                    ),
                    height: 40.h,
                    width: 40.w,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    "change password".tr(),
                    style: getRegularStyle(
                        fontSize: 14.sp,
                        color: Global.darkMode
                            ? ColorManager.backGroundIcon
                            : ColorManager.textColor),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: ColorManager.backGroundIcon,
                          borderRadius: BorderRadius.circular(10)),
                      child: SvgPicture.asset(
                        "assets/icons/8_unfriend_100px.svg",
                        height: 25.h,
                        width: 25.w,
                      ),
                      height: 40.h,
                      width: 40.w,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      "Banned accounts".tr(),
                      style: getRegularStyle(
                          fontSize: 14.sp,
                          color: Global.darkMode
                              ? ColorManager.backGroundIcon
                              : ColorManager.textColor),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
