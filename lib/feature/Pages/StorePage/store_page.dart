
import 'package:chato/feature/Pages/StorePage/bloc/store_bloc.dart';
import 'package:chato/feature/Pages/StorePage/bloc/store_state.dart';
import 'package:chato/feature/Pages/StorePage/widget/coins_page.dart';
import 'package:chato/feature/Pages/StorePage/widget/diamonds_page.dart';
import 'package:chato/feature/Pages/StorePage/widget/vip_page.dart';
import 'package:chato/injection.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/color_manager.dart';
import '../../../core/utils/styles_manager.dart';


class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> with AutomaticKeepAliveClientMixin{
  StoreBloc storeBloc=sl<StoreBloc>();
  PageController pageController=PageController(
    initialPage: 0,
     keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<StoreBloc,StoreState>(
      bloc: storeBloc,
      listener: (context, state) {

      },
      builder:(context, state) {
       return Scaffold(
          body: SingleChildScrollView(
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
                          vertical: 24.h
                      ),
                      child:   Row(
                        children: [
                          SvgPicture.asset('assets/icons/store2.svg',
                            width: 24.w,
                            color: ColorManager.primaryColor,
                          ),
                          SizedBox(width: 12.w,),
                          Expanded(child:
                          Text('Store',
                            style: TextStyle(
                                color: ColorManager.primaryColor,


                                fontWeight: FontWeight.w700,
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
                                    pageController.jumpToPage(0);
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
                                  ).tr(),
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
                                  pageController.jumpToPage(1);
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
                                  ).tr(),
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
                                  pageController.jumpToPage(2);
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
                                  ).tr(),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),


                  //رصيد
                  Expanded(
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: pageController,

                      
                      children: const [
                        CoinsPage(),
                        DiamondsPage(),
                        VipPage()
                        //store

                      ],
                    ),
                  ),

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
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
