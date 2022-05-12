
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/color_manager.dart';
import '../Pages/HomePage/widget/friendship_requests.dart';

class BuyFeaturedUserScreen extends StatefulWidget {
  const BuyFeaturedUserScreen({Key? key}) : super(key: key);

  @override
  _BuyFeaturedUserScreenState createState() => _BuyFeaturedUserScreenState();
}

class _BuyFeaturedUserScreenState extends State<BuyFeaturedUserScreen> {
  @override
  Widget build(BuildContext context) {
    int featuresNumber=7;

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.darkBackgroundColor,
        body: SizedBox(
          height: 1.sh,

          child: Column(
            children: [
              //Image Profile
             Container(
               color: ColorManager.darkBackgroundColor,
               child: Column(
                 children: [
                   SizedBox(
                     height: 20.h,
                   ),
                   Padding(
                       padding:  EdgeInsets.symmetric(
                           horizontal: 6.w
                       ),
                       child: Row(
                         children: [
                           Expanded(
                             child: Text('الملك',
                               style: TextStyle(
                                   fontSize: 23.sp,
                                   fontFamily: 'Roboto',
                                   fontWeight: FontWeight.w600,
                                   color: ColorManager.backgroundColor
                               ),
                               overflow: TextOverflow.ellipsis,
                               textAlign: TextAlign.center,
                             ),
                           ),
                         ],
                       )
                   ),

                   Container(
                     height: 180.h,
                     width: 180.h,
                     decoration: const BoxDecoration(
                       shape: BoxShape.circle,
                       image: DecorationImage(
                         image: AssetImage('assets/images/king_featured.png'),
                         fit: BoxFit.cover,

                       ),
                     ),
                   ),


                   Padding(
                       padding:  EdgeInsets.symmetric(
                           horizontal: 6.w
                       ),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text(tr('Includes')+" "+featuresNumber.toString()+" "
                               +tr('features'),
                             style: TextStyle(
                                 fontSize: 19.sp,
                                 fontWeight: FontWeight.w700,
                                 color: ColorManager.backgroundColor
                             ),
                             overflow: TextOverflow.ellipsis,
                             textAlign: TextAlign.center,
                           ),

                         ],
                       )
                   ),
                   SizedBox(
                     height: 15.h,
                   ),
                 ],
               ),
             ),



              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.w),
                      topRight: Radius.circular(25.w),
                    )

                  ),
                  child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children:
                      [
                        SizedBox(height: 40.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(

                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset('assets/icons/Rectangle.svg',
                                      width: 45.w,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.5.h,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset('assets/icons/Rectangle.svg',
                                      width: 40.w,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.5.h,
                                ),
                                SvgPicture.asset('assets/icons/Rectangle.svg',
                                  width: 35.w,
                                ),

                              ],
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text('Privileges',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context).disabledColor
                              ),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ).tr(),
                            SizedBox(
                              width: 3.w,
                            ),

                            Column(

                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset('assets/icons/Rectangle.svg',
                                      width: 45.w,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.5.h,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset('assets/icons/Rectangle.svg',
                                      width: 40.w,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.5.h,
                                ),
                                SvgPicture.asset('assets/icons/Rectangle.svg',
                                  width: 35.w,
                                ),

                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 40.h,),
                        Padding(
                            padding:  EdgeInsets.symmetric(
                                horizontal: 6.w
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      SvgPicture.asset('assets/icons/dismissal.svg',
                                        width: 40.w,
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      Text('eviction protection',
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w700,
                                            color: ColorManager.primaryColor
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                      ).tr(),

                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      Image.asset('assets/icons/picture.png',
                                      width: 40.w,
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      Text('Premium Photo Frame',
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w700,
                                            color: ColorManager.primaryColor
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                      ).tr(),

                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      Image.asset('assets/icons/login.png',
                                        width: 40.w,
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      Text('Special Entry',
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w700,
                                            color: ColorManager.primaryColor
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                      ).tr(),

                                    ],
                                  ),
                                ),




                              ],
                            )
                        ),
                        SizedBox(
                          height: 35.h,
                        ),
                        Padding(
                            padding:  EdgeInsets.symmetric(
                                horizontal: 6.w
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      Image.asset('assets/icons/dollar.png',
                                        width: 40.w,
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      Text(tr('coins')+' '+'360000 ',
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w700,
                                            color: ColorManager.primaryColor
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                      ),

                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      Image.asset('assets/icons/gift_4.png',
                                        width: 40.w,
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      Text('15'+' '+tr('special gift'),
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w700,
                                            color: ColorManager.primaryColor
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                      ),

                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      Image.asset('assets/icons/living_room.png',
                                        width: 40.w,
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      Text('special seat',
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w700,
                                            color: ColorManager.primaryColor
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                      ).tr(),

                                    ],
                                  ),
                                ),




                              ],
                            )
                        ),
                        SizedBox(
                          height: 35.h,
                        ),
                        Padding(
                            padding:  EdgeInsets.symmetric(
                                horizontal: 6.w
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      Image.asset('assets/icons/sent_message.png',
                                        width: 40.w,
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      Text('public message',
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w700,
                                            color: ColorManager.primaryColor
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                      ).tr(),

                                    ],
                                  ),
                                ),
                                const  Expanded(child:  SizedBox()),
                                const  Expanded(child:  SizedBox()),





                              ],
                            )
                        ),
                        SizedBox(
                          height: 35.h,
                        ),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(tr('The number of days')+" "+'30',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context).disabledColor
                              ),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              width: 0.30.sw,
                              child: ElevatedButton(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          "Buy",
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              color: ColorManager.backgroundColor
                                          )
                                      ).tr(),

                                    ],
                                  ),
                                  style: ButtonStyle(
                                      foregroundColor: MaterialStateProperty.all<Color>(ColorManager.backgroundColor),
                                      backgroundColor: MaterialStateProperty.all<Color>(ColorManager.primaryColor),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(25),
                                              side: const BorderSide(color: ColorManager.primaryColor)
                                          )
                                      ),
                                      padding:MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(
                                          vertical: 5.h
                                      ))
                                  ),
                                  onPressed: () {}
                              ),
                            ),
                          ],
                        ),

                      ]),
                ),
              ),





            ],
          ),
        ),

      ),
    );
  }
}
