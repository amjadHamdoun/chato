import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../model/private_old_message_data_model.dart';






class MessageChatSideOne extends StatefulWidget {
  final PrivateOldMessageDataModel message;
  const MessageChatSideOne({Key? key,required this.message}) :
        super(key: key);

  @override
  _MessageChatSideOneState createState() => _MessageChatSideOneState();
}

class _MessageChatSideOneState extends State<MessageChatSideOne> {


  @override
  void initState() {



    super.initState();
  }
  bool isUrl(String message){
    if(message.startsWith('https')){
      return true;
    }
    if(message.startsWith('http')){
      return true;
    }
    if(message.startsWith('www')){
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        SizedBox(
          width: 6.w,
        ),
        if(widget.message.message!=null)
        if(widget.message.message!.length>35
        )
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(

                    decoration: BoxDecoration(
                        color: Colors.transparent.withOpacity(0.5),
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
                                horizontal: 0
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap:isUrl (widget.message.message!)?()
                                    async {
                                      await launch(widget.message.message!);
                                    }:null,
                                    child:Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 16.w,
                                          vertical: 2.h
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          Text(widget.message.message!,
                                            style: TextStyle(
                                                color:isUrl(widget.message.message!)?
                                                Colors.blue.shade700:
                                                ColorManager.backgroundColor,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600
                                            ),textAlign: TextAlign.start,),
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  SizedBox(
                                                    height: 4.h,
                                                  ),
                                                  if (widget.message.seen == '0')
                                                    Icon(
                                                      Icons.done,
                                                      color: ColorManager.hintText,
                                                      size: 14.sp,
                                                    )
                                                  else if (widget.message.seen == '1')
                                                    Icon(
                                                      Icons.done_all,
                                                      color: ColorManager.hintText,
                                                      size: 14.sp,
                                                    )
                                                  else if (widget.message.seen == '2')
                                                      Icon(
                                                        Icons.done_all,
                                                        color: Colors.lightBlueAccent,
                                                        size: 14.sp,
                                                      )
                                                ],
                                              ),
                                              SizedBox(
                                                width: 2.w,
                                              ),
                                              Column(
                                                children: [

                                                  Text(
                                                    DateFormat('hh:mm a', 'en').format(
                                                        DateTime.parse(
                                                            widget.message.created_at!)),
                                                    style: TextStyle(
                                                        fontSize: 12.sp,
                                                        color: ColorManager.hintText),
                                                  )
                                                ],
                                              ),

                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  child: SizedBox(

                  ),
                ),
              ],
            ),
          )else
          Container(

            decoration: BoxDecoration(
                color: Colors.transparent.withOpacity(0.5),
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
                  InkWell(
                    onTap:isUrl(widget.message.message!)? () async {
                      await launch(widget.message.message!);
                    }:null,
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 16.w,
                      vertical: 2.h
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(widget.message.message!,
                            style: TextStyle(
                                color:isUrl(widget.message.message!)?
                                Colors.blue.shade700:
                                ColorManager.backgroundColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600
                            ),textAlign: TextAlign.start,),
                          Row(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  if (widget.message.seen == '0')
                                    Icon(
                                      Icons.done,
                                      color: ColorManager.hintText,
                                      size: 14.sp,
                                    )
                                  else if (widget.message.seen == '1')
                                    Icon(
                                      Icons.done_all,
                                      color: ColorManager.hintText,
                                      size: 14.sp,
                                    )
                                  else if (widget.message.seen == '2')
                                      Icon(
                                        Icons.done_all,
                                        color: Colors.lightBlueAccent,
                                        size: 14.sp,
                                      )
                                ],
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Column(
                                children: [

                                  Text(
                                    DateFormat('hh:mm a', 'en').format(
                                        DateTime.parse(
                                            widget.message.created_at!)),
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: ColorManager.hintText),
                                  )
                                ],
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

      ],
    );
  }



}
