import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chato/Globals.dart';
import 'package:chato/feature/RoomConversation/widget/message/sideOne/file_chat_side_one_widget.dart';
import 'package:chato/feature/RoomConversation/widget/message/sideOne/image_side_one_widget.dart';
import 'package:chato/feature/RoomConversation/widget/message/sideOne/message_chat_side_one_widget.dart';
import 'package:chato/feature/RoomConversation/widget/message/sideOne/message_video_side_one_widget.dart';
import 'package:chato/feature/RoomConversation/widget/message/sideOne/music_side_one_widget.dart';
import 'package:chato/feature/RoomConversation/widget/message/sideTwo/file_chat_side_two_widget.dart';
import 'package:chato/feature/RoomConversation/widget/message/sideTwo/image_side_two_widget.dart';
import 'package:chato/feature/RoomConversation/widget/message/sideTwo/message_chat_side_two_widget.dart';
import 'package:chato/feature/RoomConversation/widget/message/sideTwo/message_video_side_two_widget.dart';
import 'package:chato/feature/RoomConversation/widget/message/sideTwo/music_side_two_widget.dart';
import 'package:chato/feature/RoomConversation/widget/send_gift_bottom_sheet.dart';
import 'package:chato/feature/RoomConversation/widget/setting/room_settings.dart';
import 'package:chato/feature/RoomConversation/widget/setting/show_vip_bottom_sheet.dart';
import 'package:chato/feature/RoomConversation/widget/smile&sticker/smile_and_sticker.dart';
import 'package:chato/feature/User/model/user_data.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_recorder2/flutter_audio_recorder2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keyboard_utils/keyboard_aware/keyboard_aware.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pusher_client/pusher_client.dart';
import '../../../core/utils/color_manager.dart';
import '../../injection.dart';
import 'model/conversationMessage/message_pusher_model.dart';
import 'bloc/room_conversation_bloc.dart';
import 'bloc/room_conversation_state.dart';
import 'widget/show_media_bottom_sheet.dart';
import 'dart:io' as io;


 class RoomConversationScreen extends StatefulWidget {
   final int roomId;
  final String? background;
   final String? roomName;
   String? fav;
  final int? ownerId;
   RoomConversationScreen({
     Key? key,
     required this.roomId,
    required this.background,
     required this.fav,
    required this.ownerId,
    required this.roomName
  }) : super(key: key);

  @override
  _RoomConversationScreenState createState() => _RoomConversationScreenState();
}

class _RoomConversationScreenState extends State<RoomConversationScreen> {
   ScrollController scrollController=ScrollController();
   ScrollController singleScrollController=ScrollController();
   TextEditingController textEditingController= TextEditingController();
   RoomConversationBloc bloc=sl<RoomConversationBloc>();
   Channel? channelChat;
   bool showProgress = false;
   FlutterAudioRecorder2? _recorder;
   Recording? _current;
   late RecordingStatus _currentStatus ;
   late Timer timer;

   bool update=false;

   @override
  void initState() {
     _init();
      Global.currentRoomId=widget.roomId.toString();
     _currentStatus = RecordingStatus.Unset;
     bloc.onAddUserRoomEvent(Global.userId!, widget.roomId);
     bloc.onGetConversationMessage(widget.roomId);
     bloc.onGetAllTypeEvent('',widget.roomId);

     channelChat =
         Global.pusher!.subscribe("chat.${widget.roomId}");

     channelChat!.bind('App\\Events\\ChatEvent', (event) {

         log("event.toString()");

         Map<String,dynamic> arguments =
         (json.decode(event!.data!)??{}) as Map<String,dynamic>;

         MessagePusherModel message=
         MessagePusherModel.fromJson(arguments);
         UserData user=UserData.fromJson(arguments['user']);
        message.msg.user=user;
        String roomIdPusher=arguments['room_id'];
        if(user.id!=Global.userId&&
            roomIdPusher==Global.currentRoomId)
          {
            bloc.onAddMessageFromPusherEvent(message.msg);
          }
           Future.delayed(const Duration(milliseconds: 300)).then((value) {

             scrollController.animateTo(scrollController.position.maxScrollExtent
                 , duration: const Duration(milliseconds: 500),
                 curve: Curves.linearToEaseOut);
           });


     });




    super.initState();
  }



   _init() async {
     try {
       bool hasPermission = await FlutterAudioRecorder2.hasPermissions ?? false;

       if (hasPermission) {
         String customPath = '/flutter_audio_recorder_';
         io.Directory appDocDirectory;
//        io.Directory appDocDirectory = await getApplicationDocumentsDirectory();
         if (io.Platform.isIOS) {
           appDocDirectory = await getApplicationDocumentsDirectory();
         } else {
           appDocDirectory = (await getExternalStorageDirectory())!;
         }

         customPath = appDocDirectory.path +
             customPath +
             DateTime.now().millisecondsSinceEpoch.toString();


         _recorder =
             FlutterAudioRecorder2(customPath, audioFormat: AudioFormat.AAC);

         await _recorder!.initialized;

         var current = await _recorder!.current(channel: 0);
         print(current);
         setState(() {
           _current = current;
           _currentStatus = current!.status!;
           print(_currentStatus);
         });
       } else {
         ScaffoldMessenger.of(context).showSnackBar(
             const SnackBar(content:  Text("You must accept permissions")));
       }
     } catch (e) {
       print(e);
     }
   }

   _start() async {
     try {
       await _recorder!.start();
       var recording = await _recorder!.current(channel: 0);
       setState(() {
         _current = recording;
       });

       const tick =  Duration(milliseconds: 50);
       Timer.periodic(tick, (Timer t) async {
         if (_currentStatus == RecordingStatus.Stopped) {
           t.cancel();
         }

         var current = await _recorder!.current(channel: 0);
         // print(current.status);
         setState(() {
           _current = current;
           _currentStatus = _current!.status!;
         });
       });
     } catch (e) {
       print(e);
     }
   }

   _stop() async {
     var result = await _recorder!.stop();
     print("Stop recording: ${result!.path}");
     print("Stop recording: ${result.duration}");
     // File file = widget.localFileSystem.file(result.path);
     //  print("File length: ${await file.length()}");
     setState(() {
       _current = result;
       _currentStatus = _current!.status!;
     });
   }

  bool checkIsVideo(String? endUrl,String? localFile)
  {
    if(endUrl!=null)
      {
        if(endUrl.contains('mp4')
            ||endUrl.contains('mov')
            ||endUrl.contains('wmv')
            ||endUrl.contains('avi')
            ||endUrl.contains('flv'))
        {
          return true;
        }
      }
    if(localFile!=null)
      {
        if (localFile.contains('mp4')
            ||localFile.contains('mov')
            ||localFile.contains('wmv')
            ||localFile.contains('avi')
            ||localFile.contains('flv'))
        {
          return true;
        }
      }

    return false;
  }

   bool checkIsImage(String? endUrl,String? localFile)
   {
     if(endUrl!=null)
       {
         endUrl= endUrl.substring(endUrl.length-4,endUrl.length);
         if(endUrl.contains('jpeg')
             ||endUrl.contains('jpg')
             ||endUrl.contains('png')
             ||endUrl.contains('gif')
         )
           {
             return true;
           }

       }
     if(localFile!=null)
     {
       if(localFile.contains('jpeg')
           ||localFile.contains('jpg')
           ||localFile.contains('png')
           ||localFile.contains('gif'))
       {
         return true;
       }
     }


     return false;
   }


   bool checkIsMusic(String? endUrl,String? localFile)
   {
     if(endUrl!=null)
     {
       endUrl= endUrl.substring(endUrl.length-4,endUrl.length);
       if(endUrl.contains('mp3')
           ||endUrl.contains('wav')
           ||endUrl.contains('m4a')
           ||endUrl.contains('aac')

       )
       {
         return true;
       }

     }
     if(localFile!=null)
     {
       if(localFile.contains('mp3')
           ||localFile.contains('wav')
           ||localFile.contains('m4a')
           ||localFile.contains('aac')
           )
       {
         return true;
       }
     }


     return false;
   }

   bool checkIsFile(String? endUrl,String? localFile)
   {
     if(endUrl!=null)
     {
       endUrl= endUrl.substring(endUrl.length-4,endUrl.length);
       if(endUrl.contains('pdf')
           ||endUrl.contains('ppt')
           ||endUrl.contains('docx')
       )
       {
         return true;
       }
     }
     if(localFile!=null)
     {
       if(localFile.contains('pdf')
           ||localFile.contains('ppt')
           ||localFile.contains('docx'))

       {
         return true;
       }
     }


     return false;
   }

   int countSecond = 0;

   void startTimer() {
     countSecond=0;
     bloc.onChangeRecordTimerEvent(
         countSecond
     );
     const oneSec =  Duration(seconds: 1);
     timer =  Timer.periodic(
       oneSec,
           (Timer timer) {
             countSecond++;
              bloc.onChangeRecordTimerEvent(
                countSecond
              );
       },
     );
   }

   void closeTimer() {
      timer.cancel();
   }



   @override
   Widget build(BuildContext context) {
     return BlocConsumer<RoomConversationBloc,RoomConversationState>(
       bloc:bloc ,
       listener: (context, state) {
          if(state.smile.isNotEmpty)
            {
                textEditingController
                 ..text += state.smile
                ..selection = TextSelection.fromPosition(
                  TextPosition(offset: textEditingController.text.length));
            }
          if(state.isSuccess!)
            {
                Future.delayed(const Duration(milliseconds: 300)).then((value) {
                  scrollController.animateTo(scrollController.position.maxScrollExtent
                      , duration: const Duration(milliseconds: 500),
                      curve: Curves.linearToEaseOut);
                });
            }
       },
       builder: (context, state) {
         return  KeyboardAware(
           builder: (context, keyboardConfig) {
             return KeyboardVisibilityBuilder(

               builder: (context , bool isKeyboardVisible) {
                 if(isKeyboardVisible)
                 {
                   if(state.showEmoji)
                   {

                     bloc.onShowEmojiEvent(false);

                   }
                 }
                 return SafeArea(
                   child: WillPopScope(
                     onWillPop: () async {
                       if(state.showEmoji||FocusScope.of(context).hasFocus)
                       {
                         if(state.showEmoji)
                         {
                           bloc.onShowEmojiEvent(false);
                         }
                         if(FocusScope.of(context).hasFocus)
                         {
                           FocusScope.of(context).unfocus();
                         }
                         return false;
                       }
                       else{
                         Navigator.pop(context,update);
                       }
                       return true;
                     },
                     child: Stack(
                       children: [
                         Row(
                           children: [
                             if(widget.background!.isNotEmpty)
                               Expanded(
                                 child: Image.network(widget.background!,
                                   fit: BoxFit.cover,


                                 ),
                               )else
                             Expanded(
                               child: Image.asset('assets/images/background.jpg',
                                 fit: BoxFit.cover,


                               ),
                             ),
                           ],
                         ),
                         Scaffold(
                           backgroundColor: Colors.transparent,

                           appBar: AppBar(
                             backgroundColor: Colors.transparent,
                             elevation: 0,
                             leading: const SizedBox(),
                             toolbarHeight: 85.h,
                             actions: [
                               SizedBox(
                                 width: 1.sw,
                                 child: Padding(
                                   padding:  EdgeInsets.symmetric(
                                       horizontal: 15.w,
                                       vertical: 12.h
                                   ),
                                   child: Column(
                                     children: [
                                       Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [


                                           Row(
                                             children: [
                                               Container(
                                                 decoration: BoxDecoration(
                                                   borderRadius: BorderRadius.circular(25.w),
                                                   color: const Color(0xff1F4B88),
                                                 ),
                                                 child: Row(
                                                   children: [
                                                     GestureDetector(
                                                       onTap: (){
                                                         if(widget.ownerId==Global.userId)
                                                         {

                                                           Navigator.push(context,
                                                               MaterialPageRoute(builder: (context) =>
                                                                   RoomSettings(bloc: bloc,
                                                                     roomId: widget.roomId,
                                                                   ) ,));

                                                         }
                                                       },
                                                       child: SizedBox(
                                                         width: 50.h,
                                                         height: 50.h,
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
                                                     ),
                                                     SizedBox(width: 6.w,),
                                                     Text(widget.roomName!,
                                                       style: TextStyle(
                                                           fontWeight: FontWeight.w700,
                                                           fontSize: 17.sp,
                                                           color: ColorManager.backgroundColor,
                                                           fontFamily: 'Roboto'
                                                       ),
                                                       textAlign: TextAlign.center,
                                                     ),
                                                     SizedBox(width: 6.w,),
                                                     if(widget.fav=='0')
                                                     Padding(
                                                       padding: const EdgeInsets.all(4.0),
                                                       child: InkWell(
                                                         onTap: (){
                                                           widget.fav='1';
                                                           update=true;
                                                           setState(() {

                                                           });
                                                           bloc.onAddRemoveFavRoomEvent(widget.roomId);
                                                         },
                                                         child: SvgPicture.asset('assets/icons/love.svg',
                                                           width: 35.w,
                                                         ),
                                                       ),
                                                     ),


                                                   ],
                                                 ),
                                               ),
                                             ],
                                           ),
                                           Row(
                                             children: [
                                               SizedBox(width: 15.w,),
                                               InkWell(
                                                 onTap: (){

                                                 },
                                                 child: SvgPicture.asset('assets/icons/Rocket.svg',
                                                   width: 19.w,
                                                 ),
                                               ),
                                               SizedBox(width: 25.w,),
                                               IconButton(
                                                 onPressed: (){

                                                 },
                                                 icon:SvgPicture.asset(
                                                   'assets/icons/menu.svg',
                                                   width: 4.5.w,
                                                 ) ,


                                               ),
                                             ],
                                           ),


                                         ],
                                       ),
                                       SizedBox(
                                         height: 5.h,
                                       ),

                                     ],
                                   ),
                                 ),



                               )
                             ],
                           ),
                           body: SingleChildScrollView(
                             controller: singleScrollController,
                             physics:
                             const NeverScrollableScrollPhysics(),
                             child: SizedBox(
                               height: 1.sh-100.h,
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   SizedBox(
                                     height: 10.h,
                                   ),
                                   if(state.allTypeModel.data!=null)
                                     SingleChildScrollView(
                                       scrollDirection: Axis.horizontal,
                                       child: Row(
                                         mainAxisAlignment: MainAxisAlignment.start,

                                         children: [
                                           const SizedBox(width: 6,),

                                           GestureDetector(
                                             onTap: (){
                                               if(widget.ownerId==Global.userId)
                                                 {
                                                   showVipBottomSheet(context,bloc,
                                                    widget.roomId
                                                   );
                                                 }

                                             },
                                             child: Container(
                                               decoration: const BoxDecoration(
                                                   shape:BoxShape.circle,
                                                   color: Color(0xff1E3859)
                                               ),

                                               child: Padding(
                                                 padding:  EdgeInsets.symmetric(
                                                     vertical: 12.5.h,horizontal: 12.5.h
                                                 ),
                                                 child: Text(state.allTypeModel.data!.length.toString(),style: TextStyle(
                                                     fontSize: 15.sp,
                                                     color: ColorManager.backgroundColor,
                                                     fontWeight: FontWeight.w700
                                                 ),),
                                               ),
                                             ),
                                           ),
                                           SizedBox(width:3.w,),
                                           for(var item in state.allTypeModel.data!)
                                             Padding(
                                               padding:  EdgeInsets.symmetric(
                                                   horizontal: 2.w
                                               ),
                                               child: SizedBox(
                                                 width: 40.h,
                                                 height: 40.h,
                                                 child: CachedNetworkImage(
                                                   imageUrl:item.img??
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
                                                   placeholder: (context, url) =>
                                                   const Center(child: CircularProgressIndicator()),
                                                   errorWidget: (context, url, error) =>
                                                   const Icon(Icons.error),
                                                 ),
                                               ),
                                             ),






                                         ],
                                       ),
                                     ),

                                   SizedBox(
                                     height: 10.h,
                                   ),

                                   //المحادثة
                                   Expanded(
                                     child:
                                     Padding(
                                       padding:  EdgeInsets.symmetric(
                                           horizontal: 6.w
                                       ),
                                       child:state.isLoading!?
                                           const Center(
                                             child: CircularProgressIndicator(),
                                           ):
                                       ListView.separated(
                                         controller: scrollController,
                                         physics: const AlwaysScrollableScrollPhysics(
                                             parent: BouncingScrollPhysics()
                                         ),
                                         itemCount: state.
                                         conversationOldMessageModel
                                             .data!.length,
                                         shrinkWrap: true,
                                         itemBuilder: (context, index){
                                           if(state.
                                           conversationOldMessageModel
                                               .data![index].user!=null)
                                             { //me
                                               if(Global.userId==state.
                                               conversationOldMessageModel
                                                   .data![index].user!.id)
                                               {

                                                  if(checkIsVideo(
                                                      state.
                                                      conversationOldMessageModel.data![index].all_file!=null?
                                                      state.
                                                 conversationOldMessageModel.data![index].all_file!.substring(state.
                                                 conversationOldMessageModel.data![index].all_file!.length-4,
                                                      state.conversationOldMessageModel
                                                     .data![index].all_file!.length):null,state.
                                                 conversationOldMessageModel.data![index].localFile))
                                                   {
                                                     return SizedBox(
                                                       height: 170.h,
                                                       child: MessageVideoSideOne(
                                                         message:state.
                                                         conversationOldMessageModel
                                                             .data![index] ,
                                                       ),
                                                     );
                                                   }
                                                 else if(checkIsImage(
                                                     state.
                                                     conversationOldMessageModel.data![index].all_file
                                                 ,state.
                                                 conversationOldMessageModel.data![index].localFile))
                                                 {
                                                   return SizedBox(
                                                     height: 170.h,
                                                     child: MessageImageSideOne(
                                                       message:state.
                                                       conversationOldMessageModel
                                                           .data![index] ,
                                                     ),
                                                   );
                                                 }
                                                  else if(checkIsFile(state.
                                                  conversationOldMessageModel.data![index].all_file,
                                                      state.
                                                      conversationOldMessageModel.data![index].localFile

                                                  ))
                                                  {
                                                    return MessageFileSideOne(
                                                      message:state.
                                                      conversationOldMessageModel
                                                          .data![index] ,
                                                    );
                                                  }
                                                  else if(checkIsMusic(state.
                                                  conversationOldMessageModel.data![index].all_file,
                                                      state.
                                                      conversationOldMessageModel.data![index].localFile

                                                  ))
                                                  {
                                                    return SizedBox(
                                                      height: 100.h,
                                                      child: MessageMusicSideOne(
                                                        message:state.
                                                        conversationOldMessageModel
                                                            .data![index] ,
                                                      ),
                                                    );
                                                  }
                                                  return MessageChatSideOne(
                                                    message:state.
                                                    conversationOldMessageModel
                                                        .data![index] ,
                                                  );
                                               }
                                               else
                                                 if(
                                                 checkIsVideo(state.
                                                 conversationOldMessageModel.data![index].all_file,
                                                     state.
                                                     conversationOldMessageModel.data![index].localFile

                                                 )

                                                 )
                                                 {
                                                   return SizedBox(
                                                     height: 170.h,

                                                     child: MessageVideoSideTwo(
                                                       message:state.
                                                       conversationOldMessageModel
                                                           .data![index] ,
                                                     ),
                                                   );
                                                 }
                                                 else if(checkIsImage(state.
                                                 conversationOldMessageModel.data![index].all_file,
                                                     state.
                                                     conversationOldMessageModel.data![index].localFile

                                                 ))
                                                 {
                                                   return SizedBox(
                                                     height: 170.h,
                                                     child: MessageImageSideTwo(
                                                       message:state.
                                                       conversationOldMessageModel
                                                           .data![index] ,
                                                     ),
                                                   );
                                                 }
                                                 else if(checkIsMusic(state.
                                                 conversationOldMessageModel.data![index].all_file,
                                                     state.
                                                     conversationOldMessageModel.data![index].localFile

                                                 ))
                                                 {
                                                   return SizedBox(
                                                     height: 100.h,
                                                     child: MessageMusicSideTwo(
                                                       message:state.
                                                       conversationOldMessageModel
                                                           .data![index] ,
                                                     ),
                                                   );
                                                 }

                                           else{
                                             if(
                                             checkIsVideo(state.
                                             conversationOldMessageModel.data![index].all_file,
                                                 state.
                                                 conversationOldMessageModel.data![index].localFile

                                             )

                                             )
                                             {
                                               return SizedBox(
                                                 height: 170.h,

                                                 child: MessageVideoSideTwo(
                                                   message:state.
                                                   conversationOldMessageModel
                                                       .data![index] ,
                                                 ),
                                               );
                                             }
                                             else if(checkIsImage(state.
                                             conversationOldMessageModel.data![index].all_file,
                                                 state.
                                                 conversationOldMessageModel.data![index].localFile

                                             ))
                                             {
                                               return SizedBox(
                                                 height: 170.h,
                                                 child: MessageImageSideTwo(
                                                   message:state.
                                                   conversationOldMessageModel
                                                       .data![index] ,
                                                 ),
                                               );
                                             }
                                             else if(checkIsMusic(state.
                                             conversationOldMessageModel.data![index].all_file,
                                                 state.
                                                 conversationOldMessageModel.data![index].localFile

                                             ))
                                             {
                                               return SizedBox(
                                                 height: 100.h,
                                                 child: MessageMusicSideTwo(
                                                   message:state.
                                                   conversationOldMessageModel
                                                       .data![index] ,
                                                 ),
                                               );
                                             }
                                             else if(checkIsFile(state.
                                             conversationOldMessageModel.data![index].all_file,
                                                 state.
                                                 conversationOldMessageModel.data![index].localFile

                                             ))
                                             {
                                               return MessageFileSideTwo(
                                                 message:state.
                                                 conversationOldMessageModel
                                                     .data![index] ,
                                               );
                                             }
                                           }
                                               return MessageChatSideTwo(
                                                 message:state.
                                                 conversationOldMessageModel
                                                     .data![index] ,
                                               );
                                             }


                                           return const SizedBox(

                                           );


                                         },
                                         separatorBuilder:(context, i){
                                           return  SizedBox(
                                             height: 12.h,
                                           );

                                         },
                                       ),
                                     ),),


                                   //write message
                                   Padding(
                                     padding:  EdgeInsets.symmetric(horizontal: 15.w),
                                     child:  Row(
                                       children: [

                                         Expanded(
                                           child: Container(
                                             decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(25.w),
                                                 border: Border.all(
                                                   color: ColorManager.backgroundColor,
                                                 )
                                             ),
                                             child: Row(
                                               children: [

                                                 SizedBox(
                                                   width: 5.w,
                                                 ),
                                                 //record_not_enable
                                                 if(!state.isRecord)
                                                   Expanded(
                                                     child: Padding(
                                                       padding:  EdgeInsets.symmetric(
                                                           vertical: 2.w
                                                       ),
                                                       child: Row(
                                                         children: [

                                                           InkWell(
                                                             onTap: ()async{
                                                               if(FocusScope.of(context).hasFocus)
                                                               {
                                                                 FocusManager.instance.primaryFocus!.unfocus();
                                                               }
                                                               Future.delayed(const Duration(milliseconds: 300)).then((value) {
                                                                 bloc.onShowEmojiEvent(true);
                                                                 //installFromAssets();
                                                                 singleScrollController.jumpTo
                                                                   (singleScrollController.position.maxScrollExtent);
                                                               });

                                                             },
                                                             child: SvgPicture.asset('assets/icons/smile.svg',
                                                               width: 19.w,
                                                               color:  ColorManager.backgroundColor,
                                                             ),
                                                           ),
                                                           Expanded(
                                                             child: TextField(
                                                               keyboardType: TextInputType.multiline,
                                                               minLines: 1,
                                                               maxLines: 5,
                                                               controller: textEditingController,
                                                               onEditingComplete:(){
                                                                 FocusScope.of(context).unfocus();
                                                                 bloc.onShowEmojiEvent(false);
                                                               },
                                                               onSubmitted: (st){
                                                                 FocusScope.of(context).unfocus();
                                                                 bloc.onShowEmojiEvent(false);
                                                               },
                                                               style: TextStyle(
                                                                 fontSize: 15.sp,
                                                                 color: ColorManager.backgroundColor,
                                                                 height: 1.5.h,
                                                               ),
                                                               cursorColor: ColorManager.backgroundColor,
                                                               decoration: InputDecoration(
                                                                 contentPadding: EdgeInsets.symmetric(
                                                                   horizontal: 12.w,
                                                                 ),
                                                                 enabledBorder:  InputBorder.none,
                                                                 focusedBorder:  InputBorder.none,
                                                                 disabledBorder:InputBorder.none,
                                                                 border: InputBorder.none ,
                                                                 hintText:  tr('write message'),
                                                                 hintStyle: TextStyle(
                                                                   fontSize: 15.sp,
                                                                   color:  ColorManager.backgroundColor,
                                                                 ),
                                                                 focusColor: ColorManager.backgroundColor,
                                                                 fillColor:  ColorManager.backgroundColor,
                                                               ),


                                                             ),
                                                           ),
                                                           InkWell(
                                                             onTap: (){
                                                               showMediaBottomSheet(
                                                                 bloc: bloc,
                                                                 ctx: context,
                                                                 roomId: widget.roomId
                                                               );
                                                             },
                                                             child: SvgPicture.asset('assets/icons/media.svg',
                                                               width: 19.w,
                                                               color: ColorManager.backgroundColor,
                                                             ),
                                                           ),



                                                         ],
                                                       ),
                                                     ),
                                                   )
                                                 else
                                                   Expanded(
                                                     child: Row(
                                                       children:  [
                                                         IconButton(onPressed: () async{
                                                           bloc.onStartRecord(false);
                                                           closeTimer();
                                                           await _stop();
                                                           bloc.onSendMessageEvent('',
                                                               widget.roomId, io.File(_current!.path!));
                                                         }, icon:  SvgPicture.asset(
                                                           'assets/icons/send.svg',
                                                           color: ColorManager.primaryColor,
                                                         )),
                                                         Expanded(
                                                           child: DragTarget(
                                                             builder: (context, candidateData, rejectedData) {
                                                               return  Center(child:
                                                               Text('Slide to cancel    ${
                                                                state.recordTime
                                                               }', style:
                                                               TextStyle(color:  ColorManager.backgroundColor,
                                                                   fontSize: 15.sp),));
                                                             },
                                                             onWillAccept: (data) {
                                                               return true;
                                                             },
                                                             onAccept: (data) {
                                                               bloc.onStartRecord(false);
                                                               closeTimer();
                                                               _stop();
                                                             },
                                                           ),
                                                         ),

                                                       ],
                                                     ),
                                                   ),
                                                 if(!isKeyboardVisible)
                                                   GestureDetector(
                                                     onTap: (){
                                                       bloc.onStartRecord(true);
                                                       _start();
                                                       startTimer();
                                                     },

                                                     child: Draggable(
                                                       ignoringFeedbackSemantics: false,
                                                       data: 5,
                                                       axis: Axis.horizontal,
                                                       child: Container(

                                                         decoration:  BoxDecoration(
                                                             color:state.isRecord?
                                                             ColorManager.primaryColor:Colors.transparent,
                                                             shape: BoxShape.circle
                                                         ),
                                                         child: Padding(
                                                           padding: const EdgeInsets.all(16.0),
                                                           child: SvgPicture.asset('assets/icons/micro.svg',
                                                             width: 17.w,
                                                             color: ColorManager.backgroundColor,
                                                           ),
                                                         ),
                                                       ),
                                                       feedback:state.isRecord? Container(
                                                         decoration:  const BoxDecoration(
                                                             color:
                                                             ColorManager.primaryColor,
                                                             shape: BoxShape.circle
                                                         ),
                                                         child: Padding(
                                                           padding: const EdgeInsets.all(16.0),
                                                           child: SvgPicture.asset('assets/icons/micro.svg',
                                                               width: 17.w,
                                                               color:
                                                               ColorManager.backgroundColor
                                                           ),
                                                         ),
                                                       ):const SizedBox(),
                                                     ),
                                                   )
                                                 else
                                                   IconButton(onPressed: (){

                                                     bloc.onSendMessageEvent(
                                                         textEditingController.text,
                                                         widget.roomId,null);

                                                     if(FocusScope.of(context).hasFocus)
                                                     {
                                                       FocusManager.instance.primaryFocus!.unfocus();
                                                       textEditingController.clear();
                                                     }
                                                     bloc.onStartRecord(false);
                                                   }, icon:  Icon(
                                                     Icons.send,
                                                     color: ColorManager.backgroundColor,
                                                     size: 22.w,
                                                   )),
                                                 SizedBox(
                                                   width: 6.w,
                                                 ),
                                               ],
                                             ),
                                           ),
                                         ),
                                         SizedBox(width: 6.w,),
                                         GestureDetector(
                                           onTap: (){
                                             sendGiftBottomSheet(context,bloc);
                                           },
                                           child: Container(

                                             decoration:   BoxDecoration(
                                               gradient:  const LinearGradient(
                                                   begin: Alignment.topRight,
                                                   end: Alignment.bottomLeft,
                                                   colors: [
                                                     ColorManager.primaryColor,
                                                     ColorManager.primaryColorLight,
                                                   ]
                                               ),
                                               borderRadius: BorderRadius.circular(7.w),
                                               shape: BoxShape.rectangle,
                                             ),
                                             child: Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:   SvgPicture.asset('assets/icons/gift_three.svg',
                                                 width: 17.w,
                                               ),
                                             ),
                                           ),
                                         ),
                                         SizedBox(width: 6.w,),
                                         GestureDetector(
                                           child: Container(

                                             decoration:   BoxDecoration(
                                               gradient:  const LinearGradient(
                                                   begin: Alignment.topRight,
                                                   end: Alignment.bottomLeft,
                                                   colors: [
                                                     Color(0xff32415D),
                                                     Color(0xff32415D),
                                                   ]
                                               ),
                                               borderRadius: BorderRadius.circular(7.w),
                                               shape: BoxShape.rectangle,
                                             ),
                                             child: Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child:  SvgPicture.asset('assets/icons/heart.svg',
                                                 width: 17.w,
                                               ),
                                             ),
                                           ),
                                         ),
                                         SizedBox(width: 6.w,),


                                       ],
                                     ),
                                   ),
                                   if(isKeyboardVisible)
                                     SizedBox(height: keyboardConfig.keyboardHeight,),

                                   SizedBox(
                                     height: 20.h,
                                   ),
                                   SmileAndSticker(
                                     bloc: bloc,
                                   ),


                                 ],
                               ),
                             ),
                           ),


                         ),
                       ],
                     ),
                   ),
                 );
               },

             );
           },

         );
       },

     );
   }
}
