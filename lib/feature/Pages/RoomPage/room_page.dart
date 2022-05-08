
import 'package:chato/feature/Pages/RoomPage/bloc/room_state.dart';
import 'package:chato/feature/Pages/RoomPage/widget/all_room.dart';
import 'package:chato/feature/Pages/RoomPage/widget/create_room.dart';
import 'package:chato/feature/Pages/RoomPage/widget/fav_room.dart';
import 'package:chato/feature/Pages/RoomPage/widget/global_room.dart';
import 'package:chato/feature/Pages/RoomPage/widget/trend_room.dart';

import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/color_manager.dart';
import '../../../core/utils/styles_manager.dart';

import 'bloc/room_bloc.dart';


class RoomScreen extends StatefulWidget {
  final RoomBloc bloc;
  const RoomScreen({Key? key, required this.bloc}) : super(key: key);

  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> with AutomaticKeepAliveClientMixin{

   List<String> filters=[
     tr('Global'),tr('Trend'),
     tr('Active'),tr('Fav')];
   PageController pageController=PageController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<RoomBloc,RoomState>(
      bloc:widget.bloc,
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
                                    widget.bloc.onChangeFilter(i);
                                    pageController.jumpToPage(i);
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
                        PageView(
                          controller: pageController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            AllRoomPage(
                              bloc: widget.bloc,
                            ),
                            TrendRoomPage(
                              bloc: widget.bloc,
                            ),
                            GlobalRoomPage(bloc: widget.bloc,),
                            FavRoomPage(
                              bloc: widget.bloc,
                            ),
                          ],
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
                        MaterialPageRoute(builder: (context) =>
                            CreateRoom(bloc: widget.bloc,)),
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

  bool get wantKeepAlive => true;
}
