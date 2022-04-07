
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chato/feature/Pages/ProfilePage/widget/friendship_requests.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/color_manager.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Image Profile
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 1.sw,
                  height: 200.h,
                  decoration:  BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Theme.of(context).primaryColor,
                            Theme.of(context).primaryColor,
                          ]
                      )
                  ),
                  child: CachedNetworkImage(
                    imageUrl: "https://media.npr.org/assets/img/2022/02/02/50-verdens-verste-menneske-oslo-pictures_wide-52fe31568d45897f5990960f1cf989fedbf2c828-s1100-c50.jpg",
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(

                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fill,

                        ),
                      ),
                    ),
                    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),



                ),

                Positioned(
                  bottom: -36.h,

                  width: 1.sw,
                  child: SizedBox(
                    width: 90.h,
                    height: 90.h,
                    child: CachedNetworkImage(
                      imageUrl: "https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg",
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.contain,

                          ),
                        ),
                      ),
                      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ),
              ],
            ),
            



            //details
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(
                  horizontal: 6.w
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text('ۦ⇜اسـۦـۦـد❪᪣❫ديـۦــرالـۦـزور⇝',
                      style: TextStyle(
                          fontSize: 23.sp,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColorDark
                      ),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
                padding:  EdgeInsets.symmetric(
                    horizontal: 6.w
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('142535626',
                      style: TextStyle(
                          fontSize: 23.sp,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).disabledColor
                      ),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    InkWell(
                      onTap: (){},
                        child: SvgPicture.asset('assets/icons/copy.svg',width: 26.w,)),
                  ],
                )
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
                padding:  EdgeInsets.symmetric(
                    horizontal: 6.w
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text('6 اصدقاء',
                          style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).disabledColor
                          ),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        InkWell(
                            onTap: (){},
                            child: SvgPicture.asset('assets/icons/user-friends.svg',width:16.w,)),
                      ],
                    ),
                    SizedBox(
                      width: 27.w,
                    ),
                    Row(
                      children: [
                        Text('سوريا',
                          style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).disabledColor
                          ),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        InkWell(
                            onTap: (){},
                            child: SvgPicture.asset('assets/icons/Icon-location.svg',width: 13.w,)),
                      ],
                    ),

                  ],
                )
            ),
            SizedBox(
              height: 55.h,
            ),
            Padding(
                padding:  EdgeInsets.symmetric(
                    horizontal: 26.w
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          SvgPicture.asset(
                              'assets/icons/amazing_account.svg',
                            width: 26.w,
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text('Create Amazing Account',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).disabledColor
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

                          SvgPicture.asset('assets/icons/setting.svg',
                            width: 26.w,
                            color: ColorManager.primaryColor,

                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text('Settings',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).disabledColor
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
              height: 45.h,
            ),
            Padding(
                padding:  EdgeInsets.symmetric(
                    horizontal: 26.w
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          SvgPicture.asset(
                            'assets/icons/log_out.svg',
                            width: 26.w,
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text('Log out',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).disabledColor
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

                          SvgPicture.asset('assets/icons/send_gift.svg',
                            width: 26.w,
                            color: ColorManager.primaryColor,

                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text('Send Coins',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).disabledColor
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






          ],
        ),
      ),

    );
  }
}
