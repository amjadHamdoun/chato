
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chato/feature/Pages/RoomPage/bloc/room_state.dart';
import 'package:chato/feature/Pages/RoomPage/widget/create_room.dart';

import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/color_manager.dart';
import '../../../core/utils/styles_manager.dart';

import '../../RoomConversation/room_conversation.dart';
import 'bloc/room_bloc.dart';


class RoomScreen extends StatefulWidget {
  const RoomScreen({Key? key}) : super(key: key);

  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> with AutomaticKeepAliveClientMixin{
  RoomBloc bloc=RoomBloc();
   List<String> filters=[tr('Global'),tr('Trend'),tr('Active'),tr('Fav')];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<RoomBloc,RoomState>(
      bloc: bloc,
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
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
                                  Text('Rooms Chat',
                                    style: getMediumStyle(
                                        color: ColorManager.primaryColor,
                                        fontSize: 19.sp


                                    ),
                                  ).tr(),),




                                ],
                              ),


                            ],
                          ),
                        ),



                      ),


                      //filter
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(
                            horizontal: 6.w
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            for(int i=0;i<filters.length;i++)
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 12.w),
                                child: InkWell(
                                  onTap: (){
                                    bloc.onChangeFilter(i);
                                  },
                                  child: Column(
                                    children: [
                                      Container(

                                        decoration:  BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: state.selectedFilter==i?
                                                    ColorManager.primaryColor:
                                                    Theme.of(context).disabledColor
                                                )
                                            )
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Text(filters[i],
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                fontFamily: 'DIN',
                                                fontWeight: FontWeight.w500,
                                                color:state.selectedFilter==i?
                                                    ColorManager.primaryColor:
                                                Theme.of(context).disabledColor
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),

                      //rooms
                      Expanded(

                        child:
                        ListView.separated(

                          physics: const BouncingScrollPhysics(),
                          itemCount: 13,
                          itemBuilder: (context, index){

                            return GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const RoomConversationScreen()),
                                );
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 60.w,
                                    height: 60.w,
                                    child: CachedNetworkImage(
                                      imageUrl: "http://via.placeholder.com/200x150",
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
                                  SizedBox(width: 4.w,),
                                  Expanded(
                                    flex: 3,

                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text('syria',
                                                style: TextStyle(
                                                    fontSize: 15.sp,
                                                    fontFamily: 'DIN',
                                                    fontWeight: FontWeight.w700,
                                                    color: Theme.of(context).disabledColor
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
                                  Column(

                                    children: [
                                      if(index<5)
                                      SvgPicture.asset('assets/icons/awesome-crown.svg'),
                                      Row(
                                        children: [
                                          Container(
                                            decoration:  const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xffFCAF65)
                                            ),
                                            child: Padding(
                                              padding:  EdgeInsets.all(14.0.w),
                                              child: Text((index+1).toString(),
                                                style: TextStyle(
                                                    fontSize: 15.sp,
                                                    fontFamily: 'DIN',
                                                    fontWeight: FontWeight.w700,
                                                    color: ColorManager.backgroundColor
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 16.w,),
                                ],
                              ),
                            );

                          },
                          separatorBuilder:(context, i){
                            return  SizedBox(
                              height: 5.h,
                            );

                          },
                        ),),
                      SizedBox(
                        height: 90.h,
                      ),

                    ],
                  ),
                ),
                Positioned(
                 bottom: 95.h,
                  right: 0,
                  left: 0,

                  child: InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CreateRoom()),
                      );
                    },
                    child: Container(
                      width: 40.w,
                      height: 40.w,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              end: Alignment.topRight,
                              tileMode: TileMode.mirror,
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
                  ),
                ),
              ],
            ),
          ),


        );
      },
      listener: (context, state) {},

    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
