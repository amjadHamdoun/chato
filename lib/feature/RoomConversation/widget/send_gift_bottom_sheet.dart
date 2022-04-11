import 'package:cached_network_image/cached_network_image.dart';
import 'package:chato/core/utils/color_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui'as ui;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../bloc/room_conversation_bloc.dart';
import '../bloc/room_conversation_state.dart';

void sendGiftBottomSheet(BuildContext ctx,RoomConversationBloc bloc) {

  showModalBottomSheet(
      elevation: 10,
      backgroundColor: ColorManager.darkBackgroundColor,
      context: ctx,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.w),
          topRight: Radius.circular(30.w),
        ),

      ),

      builder: (ctx) => BlocBuilder<RoomConversationBloc,
          RoomConversationState>(
        bloc: bloc,
        builder: (context, state) {

          return Container(

            width: 1.sw,
            height: 400.h,

            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(height: 20.h,),
                Padding(
                  padding:  EdgeInsets.symmetric(
                      horizontal: 6.w
                  ),
                  child: SizedBox(
                    height: 40.h,

                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: 13,
                      itemBuilder: (context, index){

                        return Column(
                          children: [
                            SizedBox(
                              width: 35.h,
                              height: 35.h,
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

                          ],
                        );


                      },
                      separatorBuilder: (context, index){

                        return SizedBox(width: 6.w,);


                      },

                    ),
                  ),
                ),

                SizedBox(height: 20.h,),
                Padding(
                  padding:  EdgeInsets.symmetric(
                      horizontal: 6.w
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          bloc.onChangeGiftEvent(0);
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/icons/gift_5.svg',
                            color: state.senGiftType==0?
                              ColorManager.backgroundColor:
                            ColorManager.hintText,
                            ),
                            SizedBox(
                              width: 6.w,
                            ),
                            Text('Gifts',style: TextStyle(
                                color: state.senGiftType==0?
                                ColorManager.backgroundColor:
                                ColorManager.hintText,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600
                            ),).tr()

                          ],
                        ),
                      ),
                      SizedBox(width: 16.w,),
                      GestureDetector(
                        onTap: (){
                          bloc.onChangeGiftEvent(1);
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/icons/flag.svg',
                              color: state.senGiftType==1?
                              ColorManager.backgroundColor:
                              ColorManager.hintText,
                            ),
                            SizedBox(
                              width: 6.w,
                            ),
                            Text('Flags',style: TextStyle(
                                color: state.senGiftType==1?
                                ColorManager.backgroundColor:
                                ColorManager.hintText,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600
                            ),).tr()

                          ],
                        ),
                      ),
                      SizedBox(width: 16.w,),
                      GestureDetector(
                        onTap: (){
                          bloc.onChangeGiftEvent(2);
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/icons/star.svg',
                              color: state.senGiftType==2?
                              ColorManager.backgroundColor:
                              ColorManager.hintText,
                            ),
                            SizedBox(
                              width: 6.w,
                            ),
                            Text('the rich',style: TextStyle(
                                color: state.senGiftType==2?
                                ColorManager.backgroundColor:
                                ColorManager.hintText,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600
                            ),).tr()

                          ],
                        ),
                      ),
                      SizedBox(width: 16.w,),
                      GestureDetector(
                        onTap: (){
                          bloc.onChangeGiftEvent(3);
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/icons/vip.svg',
                              color: state.senGiftType==3?
                              ColorManager.backgroundColor:
                              ColorManager.hintText,
                            ),
                            SizedBox(
                              width: 6.w,
                            ),
                            Text('vip',style: TextStyle(
                                color: state.senGiftType==3?
                                ColorManager.backgroundColor:
                                ColorManager.hintText,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600
                            ),).tr()

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h,),
                Expanded(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(
                        horizontal: 12.w
                    ),
                    child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          // number of items per row
                          crossAxisCount: 5,
                          childAspectRatio: 0.8,
                          // vertical spacing between the items
                          mainAxisSpacing: 10,
                          // horizontal spacing between the items
                          crossAxisSpacing: 10,
                        ),
                        itemCount: 10,
                        itemBuilder: (BuildContext ctx, index) {

                          return Container(
                            decoration: BoxDecoration(
                              border:Border.all(
                                color: ColorManager.backgroundColor,
                              ),
                              borderRadius: BorderRadius.circular(12.w),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset('assets/icons/diamonds.svg',
                                      width: 33.w),
                                  SizedBox(height: 6.h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset('assets/icons/diamonds.svg',
                                          width: 14.w),
                                      const SizedBox(width: 3,),
                                      Text('1500',
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontFamily: 'DIN',
                                            fontWeight: FontWeight.w500,
                                            color:ColorManager.backgroundColor,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                      ),

                                    ],
                                  ),


                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                SizedBox(height: 20.h,),
                Padding(
                  padding:  EdgeInsets.symmetric(
                    horizontal: 12.w
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/diamonds.svg',
                              width: 14.w),
                          const SizedBox(width: 3,),
                          Text('1500',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: 'DIN',
                              fontWeight: FontWeight.w500,
                              color:ColorManager.backgroundColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                          ),

                        ],
                      ),

                      Container(

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.w),
                            border: Border.all(
                                color: const Color(0xffD6D6D6)
                            )
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Padding(
                              padding:  EdgeInsets.symmetric(
                                horizontal: 7.w
                              ),
                              child: SizedBox(
                                width: 30.w,
                                height: 30.h,
                                child: DropdownButton(
                                  isExpanded: true,
                                  dropdownColor: ColorManager.darkBackgroundColor,
                                  underline: const SizedBox(),


                                  value: '1',


                                  // Down Arrow Icon
                                  icon:   Icon(Icons.arrow_drop_down,
                                  size: 22.w,
                                    color: ColorManager.backgroundColor,
                                  ),

                                  // Array list of items
                                  items: ['1','2','3','4'].map((String items) {
                                    return DropdownMenuItem(

                                      value: items,
                                      child: Row(

                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(items
                                            , style: TextStyle(
                                                fontSize: 12.sp,
                                                color: ColorManager.backgroundColor,

                                                fontWeight: FontWeight.w700
                                            ),
                                            textAlign: TextAlign.center,
                                          ),


                                        ],
                                      ),
                                    );
                                  }).toList(),
                                  // After selecting the desired option,it will
                                  // change button value to selected value
                                  onChanged: (newValue) {

                                  },
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){

                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.w),
                                    color:ColorManager.primaryColor
                                ),

                                child: Padding(
                                  padding:  EdgeInsets.symmetric(
                                    vertical: 7.h,
                                    horizontal: 20.w

                                  ),
                                  child: Text('Send',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: 'DIN',
                                        fontWeight: FontWeight.w500,
                                        color: ColorManager.backgroundColor

                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  ).tr(),
                                ),
                              ),
                            ),




                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 20.h,),


              ],
            ),
          );
        },
      ));
}