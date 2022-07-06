import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../../../../core/utils/color_manager.dart';



class DiamondsPage extends StatefulWidget {
  final List<ProductDetails> products;
  const DiamondsPage({Key? key,required this.products}) : super(key: key);

  @override
  _DiamondsPageState createState() => _DiamondsPageState();
}

class _DiamondsPageState extends State<DiamondsPage> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
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
                        Text('Current Diamonds balance',
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

        Expanded(
          child: Padding(
            padding:  EdgeInsets.symmetric(
                horizontal: 12.w
            ),
            child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 1.4,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: 6,
                itemBuilder: (BuildContext ctx, index) {
                  for(var prod in widget.products)
                  {

                    if(prod.id=='1_diamonds'&&index==0) {
                      return Column(
                        children: [
                          Image.asset('assets/icons/diamonds.png',

                            height: 60.w,
                            width: 60.w,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(height: 6.h,),
                          Text(prod.description,
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: 'DIN',
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).primaryColorDark
                            ),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 6.h,),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.w),
                              border: Border.all(
                                  color: Theme.of(context).cursorColor
                              ),
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(
                                  vertical: 2.h,
                                  horizontal: 28.w
                              ),
                              child: Text(prod.price,
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
                          ),

                        ],
                      );
                    }
                    if(prod.id=='2_diamonds'&&index==1) {
                      return Column(
                        children: [
                          Image.asset('assets/icons/diamonds1.png',

                            height: 60.w,
                            width: 60.w,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(height: 6.h,),
                          Text(prod.description,
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: 'DIN',
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).primaryColorDark
                            ),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 6.h,),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.w),
                              border: Border.all(
                                  color: Theme.of(context).cursorColor
                              ),
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(
                                  vertical: 2.h,
                                  horizontal: 28.w
                              ),
                              child: Text(prod.price,
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
                          ),

                        ],
                      );
                    }
                    if(prod.id=='3_diamonds'&&index==2) {
                      return Column(
                        children: [
                          Image.asset('assets/icons/diamonds2.png',

                            height: 60.w,
                            width: 60.w,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(height: 6.h,),
                          Text(prod.description,
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: 'DIN',
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).primaryColorDark
                            ),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 6.h,),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.w),
                              border: Border.all(
                                  color: Theme.of(context).cursorColor
                              ),
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(
                                  vertical: 2.h,
                                  horizontal: 28.w
                              ),
                              child: Text(prod.price,
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
                          ),

                        ],
                      );
                    }
                    if(prod.id=='4_diamonds'&&index==3) {
                      return Column(
                        children: [
                          Image.asset('assets/icons/diamonds3.png',

                            height: 60.w,
                            width: 60.w,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(height: 6.h,),
                          Text(prod.description,
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: 'DIN',
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).primaryColorDark
                            ),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 6.h,),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.w),
                              border: Border.all(
                                  color: Theme.of(context).cursorColor
                              ),
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(
                                  vertical: 2.h,
                                  horizontal: 28.w
                              ),
                              child: Text(prod.price,
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
                          ),

                        ],
                      );
                    }
                    if(prod.id=='5_diamonds'&&index==4) {
                      return Column(
                        children: [
                        Image.asset('assets/icons/diamonds4.png',

                        height: 60.w,
                        width: 60.w,
                        fit: BoxFit.fill,
                      ),
                          SizedBox(height: 6.h,),
                          Text(prod.description,
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: 'DIN',
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).primaryColorDark
                            ),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 6.h,),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.w),
                              border: Border.all(
                                  color: Theme.of(context).cursorColor
                              ),
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(
                                  vertical: 2.h,
                                  horizontal: 28.w
                              ),
                              child: Text(prod.price,
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
                          ),

                        ],
                      );
                    }
                    if(prod.id=='6_diamonds'&&index==5) {
                      return Column(
                        children: [
                         Image.asset('assets/icons/diamonds5.png',
                          height: 60.w,
                           width: 60.w,
                           fit: BoxFit.fill,
                          ),
                          SizedBox(height: 6.h,),
                          Text(prod.description,
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: 'DIN',
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).primaryColorDark
                            ),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 6.h,),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.w),
                              border: Border.all(
                                  color: Theme.of(context).cursorColor
                              ),
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(
                                  vertical: 2.h,
                                  horizontal: 28.w
                              ),
                              child: Text(prod.price,
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
                          ),

                        ],
                      );
                    }
                  }

                  return const SizedBox();
                }),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}