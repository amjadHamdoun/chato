import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../Globals.dart';
import '../../bloc/room_conversation_bloc.dart';
import '../../bloc/room_conversation_state.dart';



Future<String?> showUserBottomSheet(BuildContext ctx,
    RoomConversationBloc bloc
    ) async {
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
      builder: (ctx) =>
          BlocBuilder<RoomConversationBloc,RoomConversationState>(
           bloc: bloc,
           builder: (context, state) {
            return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            decoration:  BoxDecoration(
              color: Theme.of(ctx).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            alignment: Alignment.center,
            width: 1.sw,
            height: 350.h,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text('Users',
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(ctx).primaryColorDark
                        ),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ).tr(),
                    ),
                  ],
                ),
                SizedBox(height: 30.h,),
                Expanded(
                  child:state.allTypeUser.data==null?
                  Center(
                    child: Text('No Users',
                      style: TextStyle(
                        fontSize: 17.sp,
                      ),
                    ).tr(),
                  ): ListView.separated(
                      itemBuilder: (context, index) {
                        return  Padding(
                            padding:  EdgeInsets.symmetric(
                                horizontal: 12.w
                            ),
                            child: Row(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SizedBox(
                                      width: 50.h,
                                      height: 50.h,
                                      child: CachedNetworkImage(
                                        imageUrl:state.allTypeUser.data![index].img??
                                            "https://chato.vip/WI.jpeg",
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
                                    if(state.allTypeUser.data![index].vip_user!=null)
                                      SizedBox(
                                        width:state.allTypeUser.data![index].vip_user!.vip_id
                                            =="1"?64.h: 75.h,
                                        height: state.allTypeUser.data![index].vip_user!.vip_id
                                            =="1"?64.h: 75.h,
                                        child:Image.asset(
                                          state.allTypeUser.data![index].vip_user!.vip_id
                                              =="1"?
                                          'assets/images/solider_frame.png':
                                          state.allTypeUser.data![index].vip_user!.vip_id
                                              =="2"?
                                          'assets/images/knight_frame.png':
                                          state.allTypeUser.data![index].vip_user!.vip_id
                                              =="3"?
                                          'assets/images/minister_frame.png':
                                          'assets/images/king_frame.png',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                  ],
                                ),
                                SizedBox(width: 6.w,),
                                Expanded(
                                  child: Text(state.allTypeUser.data![index].name!,
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(context).primaryColorDark
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                  ),
                                ),

                                IconButton(onPressed: (){}, icon: SvgPicture.asset('assets/icons/trash.svg')),

                              ],
                            )
                        );
                      }, separatorBuilder: (context, index) {
                    return  Divider(
                      thickness:1,
                      color: Theme.of(context).hintColor,
                    );
                  }, itemCount:
                  state.allTypeUser.data!=null?
                  state.allTypeUser.data!.length:0),
                ),
                Divider(
                  thickness:1,
                  color: Theme.of(ctx).hintColor,
                ),
                SizedBox(height: 30.h,),

              ],
            ),
          );
        },

      ));
  return '';
}
