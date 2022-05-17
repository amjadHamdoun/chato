import 'package:cached_network_image/cached_network_image.dart';
import 'package:chato/Globals.dart';
import 'package:chato/Preference.dart';
import 'package:chato/core/utils/styles_manager.dart';
import 'package:chato/feature/Pages/HomePage/bloc/home_bloc.dart';
import 'package:chato/feature/Pages/HomePage/bloc/home_state.dart';
import 'package:chato/feature/Pages/HomePage/widget/search_friends.dart';
import 'package:chato/feature/autho/login/login_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/utils/color_manager.dart';
import 'widget/friendship_requests.dart';

class HomeScreen extends StatefulWidget {
  final HomeBloc bloc;
  const HomeScreen({Key? key,required this.bloc}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin{

  @override
  void initState() {
    widget.bloc.onGetAllFriendEvent();
    widget.bloc.onGetFriendshipRequestsEvent();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<HomeBloc,HomeState>(
      bloc: widget.bloc,
      listener: (context, state) {
        if(state.error.isNotEmpty)
          {
            Fluttertoast.showToast(
                msg: state.error,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: ColorManager.primaryColor,
                textColor: Colors.white,
                fontSize: 16.0
            );
          }
        if(state.allFriendModel.message!.contains('Unauthenticated.'))
          {
            Global.userToken='';
            Preferences.saveUserToken('');
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const LoginScreen(),));
          }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: SizedBox(
              height: 1.sh,
              child: Column(
                children: [
                  //appBar
                  SizedBox(
                    width: 1.sw,


                    child: Padding(
                      padding:  EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 12.h
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            children: [

                              SizedBox(width: 6.w,),
                              Expanded(child:
                              Text('Friends',
                                style: TextStyle(
                                    color: ColorManager.primaryColor,


                                    fontWeight: FontWeight.w700,
                                    fontSize: 19.sp


                                ),
                              ).tr(),),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>
                                    FriendshipRequests(bloc: widget.bloc,)),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.w),
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Theme.of(context).primaryColor,
                                          Theme.of(context).primaryColorLight,
                                        ]),

                                  ),
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(
                                        horizontal: 16.w,
                                        vertical: 7.h
                                    ),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset('assets/icons/add.svg',
                                          width: 13.w,
                                          color: ColorManager.backgroundColor,
                                        ),
                                        SizedBox(width: 5.w,),
                                        Text('+'+state.friendshipRequestsModel.data!.length.toString(),
                                          style: getMediumStyle(
                                            color: ColorManager.backgroundColor,
                                            fontSize: 15.sp,



                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),



                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),

                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ),



                  ),


                  //add && friend
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(
                        horizontal: 6.w
                    ),
                    child: SizedBox(
                      height: 0.13.sh,

                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.allFriendModel.data!.length+1,
                        itemBuilder: (context, index){
                          if(index==0) {
                            return GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      SearchFriendsScreen(bloc: widget.bloc,)),
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    width: 57.w,
                                    height: 57.w,
                                    decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            colors: [
                                              ColorManager.primaryColor,
                                              ColorManager.primaryColorLight,
                                            ]
                                        ),
                                        shape: BoxShape.circle

                                    ),
                                    child: Icon(Icons.add,
                                      size: 25.w,
                                      color:    ColorManager.lightGreyShade200,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 75.w,
                                    child: Text('new addition',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: 'DIN',
                                          fontWeight: FontWeight.w700,
                                          color: Theme.of(context).disabledColor
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                    ).tr(),
                                  )
                                ],
                              ),
                            );
                          } else {
                            return Column(
                              children: [
                                SizedBox(
                                  width: 57.w,
                                  height: 57.w,
                                  child: CachedNetworkImage(

                                    imageUrl:state.allFriendModel.
                                    data![index-1].img??
                                        "http://via.placeholder.com/200x150",
                                    imageBuilder: (context, imageProvider) => Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
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
                                SizedBox(
                                  height: 3.h,
                                ),
                                SizedBox(
                                  width: 70.w,
                                  child: Text(state.allFriendModel.data![index-1].name!,
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context).disabledColor
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            );
                          }

                        },
                        separatorBuilder:(context, i){
                          return const SizedBox(



                          );

                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),

                  //المحادثات
                  Expanded(

                    child:
                        state.isLoadingGetAllFriend!?const Center(
                          child: CircularProgressIndicator(),
                        ):
                    state.allFriendModel.data!.isNotEmpty?
                    RefreshIndicator(
                      onRefresh: ()async{
                        widget.bloc.onGetAllFriendEvent();
                      },
                      child: ListView.separated(

                        physics: const BouncingScrollPhysics(),
                        itemCount: state.allFriendModel.data!.length,
                        itemBuilder: (context, index){

                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w
                            ),
                            child: Row(
                              children: [
                                Stack(
                                  children: [
                                    SizedBox(
                                      width: 60.w,
                                      height: 60.w,
                                      child: CachedNetworkImage(
                                        imageUrl: state.allFriendModel.
                                        data![index].img??
                                            "http://via.placeholder.com/200x150",
                                        imageBuilder: (context, imageProvider) => Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
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
                                    if(Localizations.localeOf(context)==const Locale('ar','AR'))
                                      Positioned(
                                        top: 5.h,

                                        left: 2.w,
                                        child: Container(


                                          width: 12.w,
                                          height: 12.w,
                                          decoration: const BoxDecoration(
                                            color: Color(0xff00EA11),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      )
                                    else
                                      Positioned(
                                        top: 5.h,

                                        right: 2.w,
                                        child: Container(


                                          width: 12.w,
                                          height: 12.w,
                                          decoration: const BoxDecoration(
                                            color: Color(0xff00EA11),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      )
                                  ],
                                ),
                                SizedBox(width: 4.w,),
                                Expanded(
                                  flex: 3,

                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(state.allFriendModel.data![index]
                                                .name!,
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w700,
                                                  color: Theme.of(context).disabledColor
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(state.allFriendModel.
                                            data![index].status!,
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontFamily: 'DIN',
                                                  fontWeight: FontWeight.w700,
                                                  color: Theme.of(context).hintColor
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 4.w,),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text('6:50 pm',
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              fontFamily: 'DIN',
                                              fontWeight: FontWeight.w700,
                                              color: Theme.of(context).hintColor
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );

                        },
                        separatorBuilder:(context, i){
                          return  SizedBox(
                            height: 5.h,
                          );

                        },
                      ),
                    ):
                        RefreshIndicator(
                          onRefresh: ()async{
                            widget.bloc.onGetAllFriendEvent();
                          },
                          child: ListView(
                            children: [
                              SizedBox(
                                height: 0.6.sh,
                                child: Center(
                                  child: Text(state.error.isNotEmpty?
                                  state.error:
                                  'No Friends',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        color: Theme.of(context).primaryColorDark
                                    ),
                                  ).tr(),
                                ),
                              ),
                            ],

                          ),
                        )

                    ,),

                  SizedBox(
                    height: 95.h,
                  ),

                ],
              ),
            ),
          ),

        );
      },

    );
  }

  @override
  bool get wantKeepAlive => true;
}
