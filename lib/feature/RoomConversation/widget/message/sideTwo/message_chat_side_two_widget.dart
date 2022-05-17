import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../User/user.dart';
import '../../../model/conversationMessage/conversation_old_message_data_model.dart';





class MessageChatSideTwo extends StatefulWidget {
  final ConversationOldMessageDataModel message;
  const MessageChatSideTwo({Key? key,required this.message}) :
        super(key: key);

  @override
  _MessageChatSideTwoState createState() => _MessageChatSideTwoState();
}

class _MessageChatSideTwoState extends State<MessageChatSideTwo> {


  @override
  void initState() {



    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if(widget.message.message!.length>35
            ||widget.message.user!.name!.length>35
        )
          Row(
            children: [
              const Expanded(
                child: SizedBox(
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(

                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xff99AACD),
                            Color(0xff99AACD),
                          ]
                      ),
                      borderRadius: BorderRadius.only(
                        topRight:  Radius.circular(12.w),
                        bottomLeft: Radius.circular(12.w),
                        topLeft: Radius.circular(12.w),
                        bottomRight:  Radius.circular(12.w),

                      )
                  ),
                  child:  Padding(
                    padding:  EdgeInsets.symmetric(
                        vertical: 4.h
                    ),
                    child: Column(

                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(
                              horizontal: 12.w
                          ),
                          child: Row(
                            children: [

                              Expanded(
                                child: Text(
                                  widget.message.user!.name!,
                                  style: TextStyle(
                                      color: ColorManager.backgroundColor,
                                      fontSize: 13.sp,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w600
                                  ),
                                  textAlign: TextAlign.end,

                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: ColorManager.backgroundColor,

                          thickness: 1,
                          height: 3.h,
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(
                              horizontal: 12.w
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(widget.message.message!
                                  ,style: TextStyle(
                                      color: ColorManager.backgroundColor,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w600
                                  ),textAlign: TextAlign.end,),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )else
          Container(
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xff99AACD),
                      Color(0xff99AACD),
                    ]
                ),
                borderRadius: BorderRadius.only(
                  topRight:  Radius.circular(12.w),
                  bottomLeft: Radius.circular(12.w),
                  topLeft: Radius.circular(12.w),
                  bottomRight:  Radius.circular(12.w),

                )
            ),
            child:  Padding(
              padding:  EdgeInsets.symmetric(
                  vertical: 4.h
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Container(
                    decoration:
                    widget.message.message!.length<=
                        widget.message.user!.name!.length?
                    const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                            color: ColorManager.backgroundColor,
                          )
                      ),
                    ):const BoxDecoration(),

                    child: Padding(
                      padding:  EdgeInsets.symmetric(
                          horizontal: 12.w
                      ),
                      child: Text(widget.message.user!.name!,
                        style: TextStyle(
                            color: ColorManager.backgroundColor,
                            fontSize: 13.sp,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600
                        ),
                        textAlign: TextAlign.start,

                      ),
                    ),
                  ),


                  Container(
                    decoration:
                    widget.message.message!.length>
                        widget.message.user!.name!.length?
                    const BoxDecoration(
                      border: Border(
                          top: BorderSide(
                            color: ColorManager.backgroundColor,
                          )
                      ),
                    ):const BoxDecoration(),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 12.w),
                      child: Text(widget.message.message!,
                        style: TextStyle(
                            color: ColorManager.backgroundColor,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600
                        ),textAlign: TextAlign.start,),
                    ),
                  ),
                ],
              ),
            ),
          ),

        SizedBox(
          width: 6.w,
        ),
        SizedBox(
          width: 50.h,
          height: 50.h,
          child: CachedNetworkImage(
            imageUrl:widget.message.user!.img?? "http://via.placeholder.com/200x150",
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

        //   Image.asset('assets/stickers/01_Cuppy_smile.webp',
        //    width: 40.w,
        //     fit: BoxFit.fill,
        //   ),



      ],
    );
  }



}
