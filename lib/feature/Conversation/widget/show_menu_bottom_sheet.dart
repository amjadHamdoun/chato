

import 'package:chato/core/utils/color_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../User/user.dart';

void showMenuBottomSheet({
  required BuildContext ctx,
  required int userTwoId
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
        side: const BorderSide(
          color: ColorManager.darkBackgroundColor,
          width: 2
        ),
      ),

      builder: (ctx) => Container(

        width: 1.sw,
        height: 300.h,

        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(height: 40.h,),
            SizedBox(
              width: 0.5.sw,
              child: ElevatedButton(
                  child: Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: ColorManager.primaryColor
                      )
                  ).tr(),
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(ColorManager.primaryColor),
                      backgroundColor: MaterialStateProperty.all<Color>(ColorManager.backgroundColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                              side: const BorderSide(color: ColorManager.primaryColor)
                          )
                      ),
                    padding:MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(
                      vertical: 15.h
                    ))
                  ),
                  onPressed: () {
                    Navigator.push(ctx,
                        MaterialPageRoute(builder: (context) =>
                            UserScreen(id: userTwoId,) ,));
                  }
              ),
            ),
            SizedBox(height: 20.h,),
            SizedBox(
              width: 0.5.sw,
              child: ElevatedButton(
                  child: Text(
                      "block",
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: ColorManager.primaryColor
                      )
                  ).tr(),
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(ColorManager.primaryColor),
                      backgroundColor: MaterialStateProperty.all<Color>(ColorManager.backgroundColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                              side: const BorderSide(color: ColorManager.primaryColor)
                          )
                      ),
                      padding:MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(
                          vertical: 15.h
                      ))
                  ),
                  onPressed: () {}
              ),
            ),
            SizedBox(height: 20.h,),
            SizedBox(
              width: 0.5.sw,
              child: ElevatedButton(
                  child: Text(
                      "Cancel",
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: ColorManager.primaryColor
                      )
                  ).tr(),
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(ColorManager.primaryColor),
                      backgroundColor: MaterialStateProperty.all<Color>(ColorManager.backgroundColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                              side: const BorderSide(color: ColorManager.primaryColor)
                          )
                      ),
                      padding:MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(
                          vertical: 15.h
                      ))
                  ),
                  onPressed: () {
                    Navigator.pop(ctx);
                  }
              ),
            ),

          ],
        ),
      ));
}