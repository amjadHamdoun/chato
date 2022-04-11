import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/color_manager.dart';
import '../../../core/utils/styles_manager.dart';
import '../../Conversation/conversation.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          height: 1.sh,
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
                          Text('Chats',
                            style: getMediumStyle(
                                color: ColorManager.lightGreyShade200,
                                fontSize: 19.sp


                            ),
                          ).tr(),),




                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),

                    ],
                  ),
                ),



              ),



              //friend
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
                    itemCount: 3,
                    itemBuilder: (context, index){

                        return Column(
                          children: [
                            Stack(
                              children: [
                                SizedBox(
                                  width: 57.w,
                                  height: 57.w,
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
                            SizedBox(
                              width: 70.w,
                              child: Text('سامر ',
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
                ListView.separated(

                  physics: const BouncingScrollPhysics(),
                  itemCount: 13,
                  itemBuilder: (context, index){

                    return GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ConversationScreen()),
                        );
                      },
                      child: Padding(
                        padding:  EdgeInsets.symmetric(
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
                                if(Localizations.localeOf(context)==const Locale('ar','AR'))
                                Positioned(

                                  left: 2.w,
                                  child: Container(

                                    child:  Padding(
                                      padding:  EdgeInsets.symmetric(
                                        horizontal: 5.w,
                                        vertical: 1.5.w
                                      ),
                                      child: Text('5',
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: ColorManager.backgroundColor,
                                        fontWeight: FontWeight.w700
                                      ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    decoration:  BoxDecoration(
                                        gradient:const LinearGradient(

                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            colors: [
                                              ColorManager.primaryColor,
                                              ColorManager.primaryColorLight,
                                            ]
                                        ) ,
                                       borderRadius: BorderRadius.circular(
                                         4.w
                                       ),
                                      shape: BoxShape.rectangle
                                    ),

                                  ),
                                )
                                else
                                  Positioned(

                                    right: 2.w,
                                    child: Container(

                                      child:  Padding(
                                        padding:  EdgeInsets.symmetric(
                                            horizontal: 5.w,
                                            vertical: 1.5.w
                                        ),
                                        child: Text('5',
                                          style: TextStyle(
                                              fontSize: 10.sp,
                                              color: ColorManager.backgroundColor,
                                              fontWeight: FontWeight.w700
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      decoration:  BoxDecoration(
                                          gradient:const LinearGradient(

                                              begin: Alignment.topRight,
                                              end: Alignment.bottomLeft,
                                              colors: [
                                                ColorManager.primaryColor,
                                                ColorManager.primaryColorLight,
                                              ]
                                          ) ,
                                          borderRadius: BorderRadius.circular(
                                              4.w
                                          ),
                                          shape: BoxShape.rectangle
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
                        ),
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
                height: 95.h,
              ),

            ],
          ),
        ),
      ),

    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
