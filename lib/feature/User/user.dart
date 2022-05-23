import 'package:cached_network_image/cached_network_image.dart';
import 'package:chato/injection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../core/utils/color_manager.dart';
import 'bloc/user_bloc.dart';
import 'bloc/user_state.dart';

class UserScreen extends StatefulWidget {
 final int id;
  const UserScreen({Key? key,required this.id}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  UserBloc bloc = sl<UserBloc>();

  @override
  void initState() {
    super.initState();
    bloc.onGetDetailsUserEvent(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      bloc: bloc,
      listener: (context, state) {

      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state.isLoading!,
          child: Scaffold(
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
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Theme
                                      .of(context)
                                      .primaryColor,
                                  Theme
                                      .of(context)
                                      .primaryColor,
                                ]
                            )
                        ),
                        child: CachedNetworkImage(
                          imageUrl:
                          state.userModel!.data!.img??
                          "https://media.npr.org/assets/img/2022/02/02/50-verdens-verste-menneske-oslo-pictures_wide-52fe31568d45897f5990960f1cf989fedbf2c828-s1100-c50.jpg",
                          imageBuilder: (context, imageProvider) =>
                              Container(
                                decoration: BoxDecoration(
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
                        ),


                      ),
                      Positioned(
                        bottom: -25,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/stack_profile_1.png",
                              width: 1.sw,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: -8.h,

                        width: 1.sw,
                        child: SizedBox(
                          width: 90.h,
                          height: 90.h,
                          child: CachedNetworkImage(

                            imageUrl:   state.userModel!.data!.img??
                                "https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg",
                            imageBuilder: (context, imageProvider) =>
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.contain,

                                    ),
                                  ),
                                ),
                            placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                          ),
                        ),
                      ),
                    ],
                  ),


                  //details
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 6.w
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(   state.userModel!.data!.name??'',
                              style: TextStyle(
                                  fontSize: 23.sp,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                  color: Theme
                                      .of(context)
                                      .primaryColorDark
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
                      padding: EdgeInsets.symmetric(
                          horizontal: 6.w
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(state.userModel!.data!.id.toString(),
                            style: TextStyle(
                                fontSize: 23.sp,
                                fontWeight: FontWeight.w700,
                                color: Theme
                                    .of(context)
                                    .disabledColor
                            ),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/icons/copy.svg', width: 26.w,)),
                        ],
                      )
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
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
                                    color: Theme
                                        .of(context)
                                        .disabledColor
                                ),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              InkWell(
                                  onTap: () {},
                                  child: SvgPicture.asset(
                                    'assets/icons/user-friends.svg',
                                    width: 16.w,)),
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
                                    color: Theme
                                        .of(context)
                                        .disabledColor
                                ),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              InkWell(
                                  onTap: () {},
                                  child: SvgPicture.asset(
                                    'assets/icons/Icon-location.svg',
                                    width: 13.w,)),
                            ],
                          ),

                        ],
                      )
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 6.w
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 70.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: const Color(0xffCACACA)
                                )
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(

                                  horizontal: 6.w
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  SvgPicture.asset(
                                      'assets/icons/date_time.svg'),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Text('28/3/2021',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Theme
                                            .of(context)
                                            .disabledColor
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  ),

                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 70.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: const Color(0xffCACACA)
                                )
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(

                                  horizontal: 27.w
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Image.asset('assets/images/birthday.png',

                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Text('28',
                                    style: TextStyle(
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Theme
                                            .of(context)
                                            .disabledColor
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  ),

                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 70.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: const Color(0xffCACACA)
                                )
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(

                                  horizontal: 22.w
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  SvgPicture.asset(
                                    'assets/icons/user-friends.svg',
                                    width: 22.w,
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Text('ذكر',
                                    style: TextStyle(
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Theme
                                            .of(context)
                                            .disabledColor
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  ),

                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 70.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: const Color(0xffCACACA)
                                )
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(

                                  horizontal: 22.w
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  SvgPicture.asset('assets/icons/eye.svg',

                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text('11.k',
                                    style: TextStyle(
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Theme
                                            .of(context)
                                            .disabledColor
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  ),

                                ],
                              ),
                            ),
                          ),


                        ],
                      )
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  //gift
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 6.w
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(23.w),
                                border: Border.all(
                                    color: const Color(0xffCACACA)
                                )
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(

                                  horizontal: 16.w,
                                  vertical: 7.h
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [


                                  Text('gifts received',
                                    style: TextStyle(
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Theme
                                            .of(context)
                                            .disabledColor
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  ).tr(),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text('20',
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Theme
                                            .of(context)
                                            .disabledColor
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  SvgPicture.asset('assets/icons/gift_1.svg'),

                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Container(

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(23.w),
                                border: Border.all(
                                    color: const Color(0xffCACACA)
                                )
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(

                                  horizontal: 16.w,
                                  vertical: 7.h
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [


                                  Text('Sent gifts',
                                    style: TextStyle(
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Theme
                                            .of(context)
                                            .disabledColor
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  ).tr(),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text('20',
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Theme
                                            .of(context)
                                            .disabledColor
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  SvgPicture.asset('assets/icons/gift_2.svg'),

                                ],
                              ),
                            ),
                          ),


                        ],
                      )
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 50.w
                    ),
                    child: Divider(
                      height: 30,
                      thickness: 1,
                      color: Theme
                          .of(context)
                          .hintColor,


                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w
                          ),
                          child: Text(
                            'إن كثرة الصراعات والصخب يمكن أن تحولك إلى شخص لا يبالي.',
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: Theme
                                    .of(context)
                                    .primaryColorDark
                            ),

                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 0.38.sw,
                        child: ElevatedButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  state.addFriend == true
                                      ? "cancel order"
                                      : "add",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: ColorManager.backgroundColor
                                  ),
                                  textAlign: TextAlign.center,
                                ).tr(),
                                SizedBox(width: 5.w,),
                                SvgPicture.asset('assets/icons/add_user.svg'),
                              ],
                            ),
                            style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<
                                    Color>(ColorManager.backgroundColor),
                                backgroundColor: MaterialStateProperty.all<
                                    Color>(ColorManager.primaryColor),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        side: const BorderSide(
                                            color: ColorManager.primaryColor)
                                    )
                                ),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.symmetric(
                                        vertical: 5.h
                                    ))
                            ),
                            onPressed: () {
                              bloc.onAddFriendEvent();
                            }
                        ),
                      ),
                      SizedBox(
                        width: 0.38.sw,
                        child: ElevatedButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    "Message",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        color: ColorManager.backgroundColor
                                    )
                                ).tr(),
                                SizedBox(width: 5.w,),
                                SvgPicture.asset('assets/icons/message.svg'),
                              ],
                            ),
                            style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<
                                    Color>(ColorManager.backgroundColor),
                                backgroundColor: MaterialStateProperty.all<
                                    Color>(ColorManager.primaryColor),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        side: const BorderSide(
                                            color: ColorManager.primaryColor)
                                    )
                                ),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.symmetric(
                                        vertical: 5.h
                                    ))
                            ),
                            onPressed: () {}
                        ),
                      ),
                    ],
                  ),


                ],
              ),
            ),

          ),
        );
      },
    );
  }
}
