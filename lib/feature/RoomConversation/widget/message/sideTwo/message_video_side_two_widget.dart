import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../User/user.dart';
import '../../../model/conversationMessage/conversation_old_message_data_model.dart';
import '../sideOne/cont.dart';
import 'dart:ui' as ui;



class MessageVideoSideTwo extends StatefulWidget {
  final ConversationOldMessageDataModel message;
  const MessageVideoSideTwo({Key? key,required this.message}) :
        super(key: key);

  @override
  _MessageVideoSideTwoState createState() =>
      _MessageVideoSideTwoState();
}

class _MessageVideoSideTwoState extends State<MessageVideoSideTwo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller=VideoPlayerController.network
      (widget.message.all_file!)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });;


    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection:ui.TextDirection.rtl ,

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
        Expanded(
          child: Stack(
            children: [
              VideoPlayer(_controller),
              ControlsOverlay(controller: _controller),
              VideoProgressIndicator(_controller,
                allowScrubbing: true,


              ),
            ],
          ),
        ),

        SizedBox(
          width: 6.w,
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

}
