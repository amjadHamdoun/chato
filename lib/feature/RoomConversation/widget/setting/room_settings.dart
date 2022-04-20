import 'package:chato/Globals.dart';
import 'package:chato/core/utils/color_manager.dart';
import 'package:chato/core/utils/styles_manager.dart';
import 'package:chato/feature/RoomConversation/widget/setting/show_owners_bottom_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../../../RoomConversation/widget/music/show_audio_player_bottom_sheet.dart';


class RoomSettings extends StatefulWidget {
  const RoomSettings({Key? key}) : super(key: key);

  @override
  _RoomSettingsState createState() => _RoomSettingsState();
}

class _RoomSettingsState extends State<RoomSettings> {
  bool hideState = false;
  bool lockState = false;
  TextEditingController pinCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

          body: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(
                vertical: 8.h,
                horizontal: 12.w
              ),
              child: Column(
                children: [




                     Row(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         IconButton(
                           onPressed: (){
                             Navigator.pop(context);
                           },
                           icon: Icon(
                             Icons.arrow_back_ios,
                             size: 19.w,
                               color: Theme.of(context).primaryColorDark
                           ),
                         ),
                         SizedBox(
                           width: 6.w,
                         ),
                         Text('اعدادات الروم',
                          style: TextStyle(
                            fontSize: 19.sp,
                            color: Theme.of(context).primaryColorDark
                          ),
                           textAlign: TextAlign.center,
                         ),
                       ],
                     ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text(
                        "Only for members".tr(),
                        style: getRegularStyle(
                            fontSize: 15.sp,
                            color: Global.darkMode
                                ? ColorManager.backGroundIcon
                                : ColorManager.textColor),
                      ),

                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                                width: 1,
                                color: Global.darkMode
                                    ? ColorManager.hintText
                                    : ColorManager.textColor)),
                        child: FlutterSwitch(
                          toggleSize: 20.h,
                            padding: 0,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/change_room_image.svg",
                            height: 25.h,
                            width: 25.w,
                            color: ColorManager.primaryColor,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            "change room image".tr(),
                            style: getRegularStyle(
                                fontSize: 14.sp,
                                color: Global.darkMode
                                    ? ColorManager.backGroundIcon
                                    : ColorManager.textColor),
                          ),
                        ],
                      ),


                     IconButton(onPressed: (){},
                         icon: Icon(
                           Icons.arrow_forward_ios,
                           size: 22.w,
                           color: ColorManager.primaryColor,
                         )),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/change_background.svg",
                            height: 25.h,
                            width: 25.w,
                            color: ColorManager.primaryColor,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            "change room background".tr(),
                            style: getRegularStyle(
                                fontSize: 14.sp,
                                color: Global.darkMode
                                    ? ColorManager.backGroundIcon
                                    : ColorManager.textColor),
                          ),
                        ],
                      ),


                      IconButton(onPressed: (){},
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            size: 22.w,
                            color: ColorManager.primaryColor,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  InkWell(
                    onTap: (){

                      showOwnersBottomSheet(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/owner.svg",
                              height: 25.h,
                              width: 25.w,
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text(
                              "owners".tr(),
                              style: getRegularStyle(
                                  fontSize: 15.sp,
                                  color: Theme.of(context).hintColor),
                            ),
                          ],
                        ),

                        Padding(
                          padding:  EdgeInsets.symmetric(
                            horizontal: 20.w
                          ),
                          child: Text(
                            "0",
                            style: getRegularStyle(
                                fontSize: 15.sp,
                                color: Theme.of(context).hintColor),
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/supervisors.svg",
                            height: 25.h,
                            width: 25.w,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            "supervisors".tr(),
                            style: getRegularStyle(
                                fontSize: 15.sp,
                                color: Theme.of(context).hintColor),
                          ),
                        ],
                      ),

                      Padding(
                        padding:  EdgeInsets.symmetric(
                            horizontal: 20.w
                        ),
                        child: Text(
                          "0",
                          style: getRegularStyle(
                              fontSize: 15.sp,
                              color: Theme.of(context).hintColor),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/profile.svg",
                            height: 25.h,
                            width: 25.w,
                            color: ColorManager.primaryColor,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            "members".tr(),
                            style: getRegularStyle(
                                fontSize: 15.sp,
                                color: Theme.of(context).hintColor),
                          ),
                        ],
                      ),

                      Padding(
                        padding:  EdgeInsets.symmetric(
                            horizontal: 20.w
                        ),
                        child: Text(
                          "0",
                          style: getRegularStyle(
                              fontSize: 15.sp,
                              color: Theme.of(context).hintColor),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/blocked.svg",
                            height: 25.h,
                            width: 25.w,
                            color: ColorManager.primaryColor,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            "blocked".tr(),
                            style: getRegularStyle(
                                fontSize: 15.sp,
                                color: Theme.of(context).hintColor),
                          ),
                        ],
                      ),

                      Padding(
                        padding:  EdgeInsets.symmetric(
                            horizontal: 20.w
                        ),
                        child: Text(
                          "0",
                          style: getRegularStyle(
                              fontSize: 15.sp,
                              color: Theme.of(context).hintColor),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/blocked.svg",
                            height: 25.h,
                            width: 25.w,
                            color: ColorManager.primaryColor,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            "permanently banned".tr(),
                            style: getRegularStyle(
                                fontSize: 15.sp,
                                color: Theme.of(context).hintColor),
                          ),
                        ],
                      ),

                      Padding(
                        padding:  EdgeInsets.symmetric(
                            horizontal: 20.w
                        ),
                        child: Text(
                          "0",
                          style: getRegularStyle(
                              fontSize: 15.sp,
                              color: Theme.of(context).hintColor),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/archive.svg",
                            height: 25.h,
                            width: 25.w,
                            color: ColorManager.primaryColor,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            "room archive".tr(),
                            style: getRegularStyle(
                                fontSize: 14.sp,
                                color: Global.darkMode
                                    ? ColorManager.backGroundIcon
                                    : ColorManager.textColor),
                          ),
                        ],
                      ),


                      IconButton(onPressed: (){},
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            size: 22.w,
                            color: ColorManager.primaryColor,
                          )),
                    ],
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
