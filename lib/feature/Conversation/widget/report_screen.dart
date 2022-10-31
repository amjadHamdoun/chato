import 'dart:io';

import 'package:chato/core/utils/color_manager.dart';
import 'package:chato/feature/Conversation/bloc/conversation_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../Globals.dart';
import '../../../core/utils/font_manager.dart';
import '../../../core/utils/styles_manager.dart';
import '../bloc/conversation_bloc.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key, required this.bloc}) : super(key: key);
  final ConversationBloc bloc;

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {

  final ImagePicker _picker = ImagePicker();
  late final XFile? photo;
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String imageName = 'upload Image';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConversationBloc, ConversationState>(
      bloc: widget.bloc,
      listener: (context, state) {
        if (state.isReportSuccess!) {
          Fluttertoast.showToast(
              msg: state.reportModel.data!,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: ColorManager.primaryColor,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: ModalProgressHUD(
            inAsyncCall: state.isReportLoading!,
            child: Scaffold(
              body: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                        vertical: 20.h, horizontal: 20.w),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        Text(
                        'Incident Report'.tr(),
                    style: TextStyle(fontSize: 24.sp),
                  ),
                  Divider(
                    thickness: 1.h,
                    color: ColorManager.hintText,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    height: 50.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: ColorManager.hintText)),
                    child: Row(
                      children: [
                      Icon(
                      Icons.photo_size_select_actual_outlined,
                      color: ColorManager.primaryColor,
                      size: 25.sp,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    InkWell(
                        onTap: () async {
                          photo = await _picker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            imageName = photo!.name;
                          });
                        },
                        child: SizedBox(
                        width: 100.w,
                        height: 40.h,
                        child: Text(
                        imageName.tr(),
                    style: TextStyle(
                        color: ColorManager.hintText, fontSize: 18.sp),
                    overflow: TextOverflow.clip,
                    softWrap: false,

                  ),
                ),
              ),
              Spacer(),
              InkWell(
                  onTap: () async {
                    photo = await _picker.pickImage(
                        source: ImageSource.gallery);
                    setState(() {
                      imageName = photo!.name;
                    });
                  },
                  child: Icon(
                    Icons.add_a_photo_outlined,
                    size: 24.sp,
                    color: ColorManager.hintText,
                  ))
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 4.h),
            height: 50.h,
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return tr('Enter Id');
                }
                return null;
              },
              keyboardType: TextInputType.number,
              style: TextStyle(
                  fontSize: FontSize.s16,
                  color: Global.darkMode
                      ? ColorManager.backgroundColor
                      : ColorManager.textColor),
              controller: nameController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                    top: 5.h, bottom: 10.h, right: 5, left: 5),
                hintText: "room or user id".tr(),
                hintStyle: TextStyle(
                  color: ColorManager.hintText,
                  fontSize: 16.sp,
                ),
                icon: Icon(
                  Icons.person,
                  size: 18.w,
                  color: ColorManager.primaryColor,
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Global.darkMode
                            ? ColorManager.backgroundColor
                            : ColorManager.textColor)),
                enabledBorder: const OutlineInputBorder(
                    borderSide:
                    BorderSide(color: ColorManager.hintText)),
                disabledBorder: const OutlineInputBorder(
                  borderSide:
                  BorderSide(color: ColorManager.hintText),
                ),
              ),
            ),
          ), //id TextFiled
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            height: 200.h,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.edit,
                  color: ColorManager.primaryColor,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Container(
                  width: 300.w,
                  margin: EdgeInsets.symmetric(vertical: 4.h),
                  height: 200.h,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return tr('Enter a description');
                      }
                      return null;
                    },
                    maxLines: 10,
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: Global.darkMode
                            ? ColorManager.backgroundColor
                            : ColorManager.textColor),
                    controller: descriptionController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          top: 5.h, bottom: 10.h, right: 5, left: 5),
                      hintText:
                      "describe incident(eg ,who,what,when,where)"
                          .tr(),
                      hintStyle: TextStyle(
                        color: ColorManager.hintText,
                        fontSize: 16.sp,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Global.darkMode
                                  ? ColorManager.backgroundColor
                                  : ColorManager.textColor)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorManager.hintText)),
                      disabledBorder: const OutlineInputBorder(
                        borderSide:
                        BorderSide(color: ColorManager.hintText),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ), //desc TextFiled
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
              height: 45.h,
              width: 135.w,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() && photo != null) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    widget.bloc.onReportEvent(des: descriptionController.text,
                        id: int.parse('${nameController.text}'),
                        photo: photo!.path);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: const Text('incomplete data')
                              .tr()),
                    );
                  }
                },
                child: Text(
                  "send".tr(),
                  style: getRegularStyle(
                      color: ColorManager.lightTextColor,
                      fontSize: 15.sp),
                ),
              )),
          ],
        ),
        ),
        ),
        ),
        ),
        ));
      },
    );
  }
}
