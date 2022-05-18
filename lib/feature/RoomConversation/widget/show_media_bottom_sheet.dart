
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../bloc/room_conversation_bloc.dart';

void showMediaBottomSheet({
 required BuildContext ctx,
  required RoomConversationBloc bloc,
  required int roomId
}) {

  showModalBottomSheet(
      elevation: 10,
      backgroundColor: Theme.of(ctx).scaffoldBackgroundColor,
      context: ctx,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.w),
          topRight: Radius.circular(30.w),
        ),

      ),

      builder: (ctx) => Container(

        width: 1.sw,
        height: 300.h,

        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(height: 20.h,),
            SizedBox(
              width: 75.w,

              child: const Divider(

                thickness: 4.5,
              ),
            ),
            SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    FilePickerResult? result = await
                    FilePicker.platform.pickFiles(
                      type: FileType.media,

                    );

                    if (result != null) {
                      File file = File(result.files.single.path!);
                    //  widget.bloc.onChangeImageEvent(file);
                      bloc.onSendMessageEvent('', roomId, file);
                    }
                    else {
                      // User canceled the picker
                    }
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/icons/gallery.svg'),
                      SizedBox(height: 10.h,),
                      Text('Gallery',style: TextStyle(
                        color: Theme.of(ctx).disabledColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600
                      ),).tr()

                    ],
                  ),
                ),
                SizedBox(width: 30.w,),
                InkWell(
                  onTap: (){},
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/icons/camera.svg'),
                      SizedBox(height: 10.h,),
                      Text('Camera',style: TextStyle(
                          color: Theme.of(ctx).disabledColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600
                      ),).tr()

                    ],
                  ),
                ),
                SizedBox(width: 30.w,),
                InkWell(
                  onTap: (){},
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/icons/doc.svg'),
                      SizedBox(height: 10.h,),
                      Text('Document',style: TextStyle(
                          color: Theme.of(ctx).disabledColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600
                      ),).tr()

                    ],
                  ),
                ),

              ],
            ),
            SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){},
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/icons/contact.svg'),
                      SizedBox(height: 10.h,),
                      Text('Contact',style: TextStyle(
                          color: Theme.of(ctx).disabledColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600
                      ),).tr()

                    ],
                  ),
                ),
                SizedBox(width: 30.w,),
                InkWell(
                  onTap: (){},
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/icons/location.svg'),
                      SizedBox(height: 10.h,),
                      Text('Location',style: TextStyle(
                          color: Theme.of(ctx).disabledColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600
                      ),).tr()

                    ],
                  ),
                ),
                SizedBox(width: 30.w,),
                InkWell(
                  onTap: (){},
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/icons/sound_clip.svg'),
                      SizedBox(height: 10.h,),
                      Text('Sound Clip',style: TextStyle(
                          color: Theme.of(ctx).disabledColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600
                      ),).tr()

                    ],
                  ),
                ),

              ],
            ),

          ],
        ),
      ));
}