import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/color_manager.dart';



class DiamondsPage extends StatefulWidget {
  const DiamondsPage({Key? key}) : super(key: key);

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
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: 10,
                itemBuilder: (BuildContext ctx, index) {

                  return Column(
                    children: [
                      SvgPicture.asset('assets/icons/diamonds.svg',
                      width: 50.w),
                      SizedBox(height: 6.h,),
                      Text('1500 Diamonds',
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
                          child: Text('15 \$',
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