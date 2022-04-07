import 'package:cached_network_image/cached_network_image.dart';
import 'package:chato/feature/Pages/StorePage/bloc/store_bloc.dart';
import 'package:chato/feature/Pages/StorePage/bloc/store_state.dart';
import 'package:chato/injection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../core/utils/color_manager.dart';
import '../../../core/utils/styles_manager.dart';


class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  StoreBloc storeBloc=sl<StoreBloc>();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreBloc,StoreState>(
      bloc: storeBloc,
      listener: (context, state) {

      },
      builder:(context, state) {
       return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                //appBar
                Container(
                  width: 1.sw,
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
                  child: Padding(
                    padding:  EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 24.h
                    ),
                    child:   Row(
                      children: [
                        SvgPicture.asset('assets/icons/store2.svg',
                          width: 24.w,
                        ),
                        SizedBox(width: 12.w,),
                        Expanded(child:
                        Text('Store',
                          style: getMediumStyle(
                              color: ColorManager.lightGreyShade200,
                              fontSize: 19.sp


                          ),
                        ).tr(),),




                      ],
                    ),
                  ),



                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: 0.8.sw,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.w),
                      border: Border.all(
                          color: const Color(0xffD6D6D6)
                      )
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              if(state.selectedPage!=0)
                                {
                                  storeBloc.onChangePageEvent(0);
                                }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.w),
                                  color:state.selectedPage==0? ColorManager.primaryColor:
                                  Colors.transparent
                              ),

                              child: Padding(
                                padding:  EdgeInsets.symmetric(
                                  vertical: 7.h,

                                ),
                                child: Text('Coins',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: 'DIN',
                                      fontWeight: FontWeight.w500,
                                      color:state.selectedPage==0? ColorManager.backgroundColor:
                                      Theme.of(context).disabledColor
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              if(state.selectedPage!=1)
                              {
                                storeBloc.onChangePageEvent(1);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.w),
                                  color:state.selectedPage==1? ColorManager.primaryColor:
                                  Colors.transparent
                              ),

                              child: Padding(
                                padding:  EdgeInsets.symmetric(
                                  vertical: 7.h,

                                ),
                                child: Text('Diamonds',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: 'DIN',
                                      fontWeight: FontWeight.w500,
                                      color:state.selectedPage==1? ColorManager.backgroundColor:
                                      Theme.of(context).disabledColor
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              if(state.selectedPage!=2)
                              {
                                storeBloc.onChangePageEvent(2);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.w),
                                  color:state.selectedPage==2? ColorManager.primaryColor:
                                      Colors.transparent
                              ),

                              child: Padding(
                                padding:  EdgeInsets.symmetric(
                                  vertical: 7.h,

                                ),
                                child: Text('VIP',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: 'DIN',
                                      fontWeight: FontWeight.w500,
                                      color:state.selectedPage==2? ColorManager.backgroundColor:
                                      Theme.of(context).disabledColor
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),


                //رصيد
                SizedBox(
                  height: 10.h,
                ),
                 Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: 12.w
              ),
                 child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Current currency balance',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontFamily: 'DIN',
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context).primaryColorDark
                              ),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                            ).tr(),
                          ],
                        ),
                        Row(
                          children: [
                            Text('1000',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'DIN',
                                  fontWeight: FontWeight.w500,
                                  color:ColorManager.primaryColor
                              ),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 80.h,
                    height: 80.h,
                    child: Image.asset('assets/images/store.png'),
                  ),

                ],
              ),
            ),
                SizedBox(
                  height: 10.h,
                ),

                //المحادثات
                Padding(
                  padding:  EdgeInsets.symmetric(
                      horizontal: 12.w
                  ),
                  child: SizedBox(
                    height: 480.h,
                    child:
                    GridView.builder(
                      physics: const BouncingScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 1.7,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                        itemCount: 10,
                        itemBuilder: (BuildContext ctx, index) {
                          return Column(
                            children: [
                                 SvgPicture.asset('assets/icons/coins.svg'),
                                 SizedBox(height: 6.h,),
                                 Text('1500 Coins',
                                   style: TextStyle(
                                       fontSize: 15.sp,
                                       fontFamily: 'DIN',
                                       fontWeight: FontWeight.w500,
                                       color: Theme.of(context).primaryColorDark
                                   ),
                                   overflow: TextOverflow.ellipsis,
                                   textAlign: TextAlign.start,
                                 ).tr(),
                                  SizedBox(height: 6.h,),
                                 Text('15 \$',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'DIN',
                                    fontWeight: FontWeight.w700,
                                    color: Theme.of(context).hintColor
                                ),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                              ).tr(),

                            ],
                          );
                        }),
                  ),
                )

              ],
            ),
          ),

        );
      },

    );
  }
}
