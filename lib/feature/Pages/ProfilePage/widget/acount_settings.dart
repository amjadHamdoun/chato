import 'package:cached_network_image/cached_network_image.dart';
import 'package:chato/Globals.dart';
import 'package:chato/core/utils/color_manager.dart';
import 'package:chato/core/utils/styles_manager.dart';
import 'package:chato/feature/Pages/ProfilePage/bloc/prof_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../../../RoomConversation/widget/music/show_audio_player_bottom_sheet.dart';
import '../bloc/prof_bloc.dart';
import 'widgets.dart';
import 'dart:io';



class AccountSettingsScreen extends StatefulWidget {
  final ProfBloc bloc;
  const AccountSettingsScreen({Key? key,required this.bloc}) : super(key: key);

  @override
  _AccountSettingsScreenState createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  bool hideState = false;
  bool lockState = false;
  TextEditingController pinCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfBloc,ProfState>(
      bloc: widget.bloc,
      listener: (context, state) {

      },
      builder: (context, state) {
        return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          state.img!=null?
                          Container(
                            height: 76.w,
                            width: 76.w,
                            decoration:
                             BoxDecoration(shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: FileImage(state.img!),
                                fit: BoxFit.fill
                              )


                            ),


                          ):
                          state.profileModel!.data!.img!=null?
                          CachedNetworkImage(
                            imageUrl:
                            state.profileModel!.data!.img??
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPhbjHLqSOfjV7iIm-hqjGzYoz3MWRxE98ng&usqp=CAU",
                            imageBuilder: (context, imageProvider) => Container(
                              height: 76.w,
                              width: 76.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.fill,

                                ),
                              ),
                            ),
                            placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                          ):
                          Container(
                            height: 76.w,
                            width: 76.w,
                            decoration:
                            const BoxDecoration(shape: BoxShape.circle,


                            ),
                            child:

                            Image.asset(

                              "assets/images/alghadab.png",
                              fit: BoxFit.fill,
                            ),

                          ),
                          Positioned(
                            left: -5,
                            bottom: -3,
                            child: InkWell(
                              onTap: () async {
                                FilePickerResult? result = await
                                FilePicker.platform.pickFiles(
                                  type: FileType.image,
                                );

                                if (result != null) {
                                  File file = File(result.files.single.path!);
                                  widget.bloc.onChangeImageEvent(file);
                                }
                                else {
                                  // User canceled the picker
                                }
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: ColorManager.primaryColor,
                                    shape: BoxShape.circle
                                ),
                                child: Padding(
                                  padding:  const EdgeInsets.all(6.0),
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    size: 16.w,
                                    color: ColorManager.backgroundColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        state.profileModel!.data!.name!,
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
                              "assets/icons/4_lock.svg",
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
                                "assets/icons/5_mail_account.svg",
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
                                "assets/icons/2_birthday.svg",
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
                              "assets/icons/9_user_location.svg",
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
                              "assets/icons/7_gender.svg",
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
                              "assets/icons/3_key.svg",
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
                                "assets/icons/8_banned_acount.svg",
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
      },

    );
  }
}
