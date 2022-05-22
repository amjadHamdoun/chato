import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../User/user.dart';
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
        GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
                  UserScreen(id: widget.message.user!.id!,)),
            );
          },
          child: SizedBox(
            width: 50.h,
            height: 50.h,
            child: CachedNetworkImage(
              imageUrl:widget.message.user!.img??
                  "http://via.placeholder.com/200x150",
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
        ),
        SizedBox(
          width: 6.w,
        ),
        if(widget.message.message!.length>35
            ||widget.message.user!.name!.length>35
        )
          Expanded(
            child: Row(
              children: [
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
                                  child: InkWell(
                                    onTap:isUrl (widget.message.message!)?()
                                    async {
                                      await launch(widget.message.message!);
                                    }:null,
                                    child: Text(widget.message.message!
                                      ,style: TextStyle(
                                          color:isUrl (widget.message.message!)?
                                          Colors.blue.shade700:
                                          ColorManager.backgroundColor,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w600
                                      ),textAlign: TextAlign.start,),
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


                  InkWell(
                    onTap:isUrl(widget.message.message!)? () async {
                      await launch(widget.message.message!);
                    }:null,
                    child: Container(
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
                              color:isUrl(widget.message.message!)?
                              Colors.blue.shade700:
                              ColorManager.backgroundColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600
                          ),textAlign: TextAlign.start,),
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
