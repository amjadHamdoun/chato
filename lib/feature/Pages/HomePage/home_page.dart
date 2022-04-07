import 'package:cached_network_image/cached_network_image.dart';
import 'package:chato/core/utils/styles_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/color_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
                  vertical: 12.h
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 60.h,
                          height: 60.h,
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
                         SizedBox(width: 6.w,),
                         Expanded(child:
                         Text('Friends',
                           style: getMediumStyle(
                             color: ColorManager.lightGreyShade200,
                              fontSize: 19.sp


                           ),
                        ).tr(),),
                        Container(
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
                          child: Container(

                            decoration: BoxDecoration(
                              color: ColorManager.lightGreyShade200,
                              borderRadius: BorderRadius.circular(25.w),


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
                                     ),
                                       SizedBox(width: 5.w,),
                                      Text('+9',
                                    style: getMediumStyle(
                                        color: ColorManager.primaryColor,
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
                    Row(
                      children: [
                        SizedBox(
                          width: 0.1.sw,
                        ),
                        Expanded(
                          child: TextField(

                            style: TextStyle(
                              fontSize: 15.sp,
                              color: ColorManager.backgroundColor,
                              height: 1.5.h,

                            ),
                            cursorColor: Theme.of(context).hoverColor,
                            decoration:  InputDecoration(
                              suffix: SvgPicture.asset(
                                  'assets/icons/search.svg',
                                width: 17.w,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                              ),


                                enabledBorder:  UnderlineInputBorder(
                                  borderSide: BorderSide(color: Theme.of(context).hoverColor),
                                ),
                                focusedBorder:  UnderlineInputBorder(
                                  borderSide: BorderSide(color: Theme.of(context).hoverColor),
                                ),
                              disabledBorder:UnderlineInputBorder(
                                borderSide: BorderSide(color: Theme.of(context).hoverColor),
                              ) ,
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Theme.of(context).hoverColor),
                              ) ,


                              hintText:  tr('search'),
                              hintStyle: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.grey.shade300
                              ),
                              focusColor: Theme.of(context).hoverColor,
                              fillColor: Theme.of(context).hoverColor,


                            ),


                          ),
                        ),
                        SizedBox(
                          width: 0.1.sw,
                        ),
                      ],
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
                  itemCount: 13,
                  itemBuilder: (context, index){
                   if(index==0) {
                     return Column(
                      children: [
                        Container(
                          width: 60.w,
                          height: 60.w,
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
                    );
                   } else {
                     return Column(
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
                         SizedBox(
                           width: 70.w,
                           child: Text('سامر ',
                             style: TextStyle(
                                 fontSize: 14.sp,
                                 fontFamily: 'DIN',
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
            Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: 12.w
              ),
              child: SizedBox(
                height: 0.55.sh,
                  child:
                  ListView.separated(

                    physics: const BouncingScrollPhysics(),
                    itemCount: 13,
                    itemBuilder: (context, index){
                      if(index==12)
                        { return  const SizedBox(
                          height: 62,
                        );}
                      return Row(
                        children: [
                          Stack(
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
                                      child: Text('سامر ',
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
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text('انا بعيد ',
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
                      );

                    },
                    separatorBuilder:(context, i){
                      return  SizedBox(
                        height: 5.h,
                      );

                    },
                  ),),
            )

          ],
        ),
      ),

    );
  }
}
