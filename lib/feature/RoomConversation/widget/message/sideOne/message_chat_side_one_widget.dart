import 'package:cached_network_image/cached_network_image.dart';
import 'package:chato/feature/User/user.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../Globals.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../model/conversationMessage/conversation_old_message_data_model.dart';

class MessageChatSideOne extends StatefulWidget {
  final ConversationOldMessageDataModel message;

  const MessageChatSideOne({Key? key, required this.message}) : super(key: key);

  @override
  _MessageChatSideOneState createState() => _MessageChatSideOneState();
}

class _MessageChatSideOneState extends State<MessageChatSideOne> {
  @override
  void initState() {
    super.initState();
  }

  bool isUrl(String message) {
    if (message.startsWith('https')) {
      return true;
    }
    if (message.startsWith('http')) {
      return true;
    }
    if (message.startsWith('www')) {
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.message.message!.startsWith('message.msg.text')) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: ColorManager.primaryColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12.w),
                  bottomLeft: Radius.circular(12.w),
                  topLeft: Radius.circular(12.w),
                  bottomRight: Radius.circular(12.w),
                )),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 4.h),
              child: Container(
                decoration: widget.message.message!.length >
                        widget.message.user!.name!.length
                    ? const BoxDecoration()
                    : const BoxDecoration(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Text(
                    widget.message.message!
                        .substring(16, widget.message.message!.length),
                    style: TextStyle(
                        color: isUrl(widget.message.message!)
                            ? Colors.blue.shade700
                            : ColorManager.backgroundColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    } else if (widget.message.message!.startsWith('http') &&
        widget.message.message!.contains('smiles')) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserScreen(
                      id: Global.userId!,
                    ),
                  ));
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 50.h,
                  height: 50.h,
                  child: CachedNetworkImage(
                    imageUrl: widget.message.user!.img ??
                        "https://i.ibb.co/Dwh8sx7/logo.png",
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                if (Global.vipId! > 0)
                  SizedBox(
                    width: Global.vipId == 1 ? 64.h : 75.h,
                    height: Global.vipId == 1 ? 64.h : 75.h,
                    child: Image.asset(
                      Global.vipId == 1
                          ? 'assets/images/solider_frame.png'
                          : Global.vipId == 2
                              ? 'assets/images/knight_frame.png'
                              : Global.vipId == 3
                                  ? 'assets/images/minister_frame.png'
                                  : 'assets/images/king_frame.png',
                      fit: BoxFit.fill,
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(
            width: 6.w,
          ),
          Row(
            children: [
              CachedNetworkImage(
                imageUrl: widget.message.message ??
                    "https://www.room.tecknick.net/WI.jpeg",
                imageBuilder: (context, imageProvider) => Container(
                  height: 120.w,
                  width: 120.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ],
          ),
          SizedBox(
            width: 50.w,
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserScreen(
                      id: Global.userId!,
                    ),
                  ));
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 50.h,
                  height: 50.h,
                  child: CachedNetworkImage(
                    imageUrl: widget.message.user!.img ??
                        "https://www.room.tecknick.net/WI.jpeg",
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                if (Global.vipId! > 0)
                  SizedBox(
                    width: Global.vipId == 1 ? 64.h : 75.h,
                    height: Global.vipId == 1 ? 64.h : 75.h,
                    child: Image.asset(
                      Global.vipId == 1
                          ? 'assets/images/solider_frame.png'
                          : Global.vipId == 2
                              ? 'assets/images/knight_frame.png'
                              : Global.vipId == 3
                                  ? 'assets/images/minister_frame.png'
                                  : 'assets/images/king_frame.png',
                      fit: BoxFit.fill,
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(
            width: 6.w,
          ),
          if (widget.message.message!.length > 35 ||
              widget.message.user!.name!.length > 35)
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent.withOpacity(0.5),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12.w),
                            bottomLeft: Radius.circular(12.w),
                            topLeft: Radius.circular(12.w),
                            bottomRight: Radius.circular(12.w),
                          )),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.h),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      widget.message.user!.name!,
                                      style: TextStyle(
                                          color: ColorManager.backgroundColor,
                                          fontSize: 13.sp,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w600),
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
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 8.h,
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
                                    width: 5.w,
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 8.h,
                                      ),
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
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onLongPress: () async {
    await Clipboard.setData(ClipboardData(
    text: widget.message.message!));
    // copied successfully
    Fluttertoast.showToast(
    msg: "text copied done!".tr(),
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor: ColorManager.hintText,
    textColor: Colors.white,
    fontSize: 16.0
    );
    },
                                      onTap: isUrl(widget.message.message!)
                                          ? () async {
                                              await launch(
                                                  widget.message.message!);
                                            }
                                          : null,
                                      child: Text(
                                        widget.message.message!,
                                        style: TextStyle(
                                            color:
                                                isUrl(widget.message.message!)
                                                    ? Colors.blue.shade700
                                                    : ColorManager
                                                        .backgroundColor,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.start,
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
                    child: SizedBox(),
                  ),
                ],
              ),
            )
          else
            Container(
              decoration: BoxDecoration(
                  color: Colors.transparent.withOpacity(0.6),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12.w),
                    bottomLeft: Radius.circular(12.w),
                    topLeft: Radius.circular(12.w),
                    bottomRight: Radius.circular(12.w),
                  )),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: widget.message.message!.length <=
                              widget.message.user!.name!.length
                          ? const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                color: ColorManager.backgroundColor,
                              )),
                            )
                          : const BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Text(
                          widget.message.user!.name!,
                          style: TextStyle(
                              color: ColorManager.backgroundColor,
                              fontSize: 13.sp,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    InkWell(
                      onLongPress: () async {
                        await Clipboard.setData(ClipboardData(
                            text: widget.message.message!));
                        // copied successfully
                        Fluttertoast.showToast(
                            msg: "text copied done!".tr(),
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.TOP,
                            timeInSecForIosWeb: 1,
                            backgroundColor: ColorManager.hintText,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      },
                      onTap: isUrl(widget.message.message!)
                          ? () async {
                              await launch(widget.message.message!);
                            }
                          : null,
                      child: Container(
                        decoration: widget.message.message!.length >
                                widget.message.user!.name!.length
                            ? const BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                  color: ColorManager.backgroundColor,
                                )),
                              )
                            : const BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 8.h,
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
                                width: 5.w,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 8.h,
                                  ),
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
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                widget.message.message!,
                                style: TextStyle(
                                    color: isUrl(widget.message.message!)
                                        ? Colors.blue.shade700
                                        : ColorManager.backgroundColor,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
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
}
