import 'package:cached_network_image/cached_network_image.dart';
import 'package:chato/Globals.dart';
import 'package:chato/feature/Conversation/widget/show_media_bottom_sheet.dart';
import 'package:chato/feature/RoomConversation/widget/send_gift_bottom_sheet.dart';
import 'package:chato/feature/RoomConversation/widget/setting/room_settings.dart';
import 'package:chato/feature/RoomConversation/widget/smile&sticker/smile_and_sticker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keyboard_utils/keyboard_aware/keyboard_aware.dart';
import '../../../core/utils/color_manager.dart';
import '../../injection.dart';
import '../User/user.dart';
import 'bloc/room_conversation_bloc.dart';
import 'bloc/room_conversation_state.dart';


 class RoomConversationScreen extends StatefulWidget {
   final int roomId;
  const RoomConversationScreen({
     Key? key,
     required this.roomId}) : super(key: key);

  @override
  _RoomConversationScreenState createState() => _RoomConversationScreenState();
}

class _RoomConversationScreenState extends State<RoomConversationScreen> {
   ScrollController scrollController=ScrollController();
   ScrollController singleScrollController=ScrollController();
   TextEditingController textEditingController= TextEditingController();
   RoomConversationBloc bloc=sl<RoomConversationBloc>();

   @override
  void initState() {
     bloc.onAddUserRoomEvent(Global.userId!, widget.roomId);
     bloc.onGetConversationMessage(widget.roomId);
     bloc.onGetAllTypeEvent('',widget.roomId);


    super.initState();
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
              Future.delayed(const Duration(seconds: 0)).then
                ((value) {
                scrollController.jumpTo(scrollController
                    .position.maxScrollExtent);
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
                         return true;
                       }
                     },
                     child: Stack(
                       children: [
                         Row(
                           children: [
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
                             toolbarHeight: 80.h,
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
                                                     SizedBox(
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
                                                     SizedBox(width: 6.w,),
                                                     Text("الوطن العربي",
                                                       style: TextStyle(
                                                           fontWeight: FontWeight.w700,
                                                           fontSize: 17.sp,
                                                           color: ColorManager.backgroundColor,
                                                           fontFamily: 'Roboto'
                                                       ),
                                                       textAlign: TextAlign.center,
                                                     ),
                                                     SizedBox(width: 6.w,),
                                                     Padding(
                                                       padding: const EdgeInsets.all(4.0),
                                                       child: SizedBox(
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
                                                   Navigator.push(context,
                                                       MaterialPageRoute(builder: (context) =>
                                                           RoomSettings(bloc: bloc,
                                                             roomId: widget.roomId,
                                                           ) ,));
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

                                           Container(
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
                                           if(Global.userId==state.
                                           conversationOldMessageModel
                                               .data![index].user.id)
                                           {
                                             return Row(
                                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                               children: [
                                                 GestureDetector(
                                                   onTap: (){
                                                     Navigator.push(
                                                       context,
                                                       MaterialPageRoute(builder: (context) =>
                                                       const UserScreen(id: 2,)),
                                                     );
                                                   },
                                                   child: SizedBox(
                                                     width: 50.h,
                                                     height: 50.h,
                                                     child: CachedNetworkImage(
                                                       imageUrl:state.
                                                       conversationOldMessageModel
                                                           .data![index].user.img?? "http://via.placeholder.com/200x150",
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
                                                                   child: Text(state.
                                                                   conversationOldMessageModel
                                                                       .data![index].user.name!,
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
                                                                   child: Text(state.conversationOldMessageModel.
                                                                   data![index].message!,
                                                                     style: TextStyle(
                                                                         color: ColorManager.backgroundColor,
                                                                         fontSize: 13.sp,
                                                                         fontWeight: FontWeight.w600
                                                                     ),textAlign: TextAlign.start,),
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
                                             );
                                           }
                                           else{
                                             return Row(
                                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                                                                     state.
                                                                     conversationOldMessageModel
                                                                         .data![index].user.name!,
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
                                                                   child: Text(state.conversationOldMessageModel.
                                                                   data![index].message!
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
                                                 SizedBox(
                                                   width: 6.w,
                                                 ),
                                                 SizedBox(
                                                   width: 50.h,
                                                   height: 50.h,
                                                   child: CachedNetworkImage(
                                                     imageUrl:state.
                                                     conversationOldMessageModel
                                                         .data![index].user.img?? "http://via.placeholder.com/200x150",
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
                                                                 FocusManager.instance.primaryFocus!.unfocus(

                                                                 );
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
                                                               decoration:  InputDecoration(

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
                                                               showMediaBottomSheet(context);
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
                                                         IconButton(onPressed: (){
                                                           bloc.onStartRecord(false);
                                                         }, icon:  SvgPicture.asset(
                                                           'assets/icons/send.svg',
                                                           color: ColorManager.primaryColor,

                                                         )),

                                                         Expanded(


                                                           child: DragTarget(
                                                             builder: (context, candidateData, rejectedData) {
                                                               return  Center(child:
                                                               Text('Slide to cancel    01.00', style:
                                                               TextStyle(color:  ColorManager.backgroundColor,
                                                                   fontSize: 15.sp),));
                                                             },
                                                             onWillAccept: (data) {
                                                               return true;
                                                             },
                                                             onAccept: (data) {

                                                               bloc.onStartRecord(false);

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
                                                         widget.roomId);

                                                     if(FocusScope.of(context).hasFocus)
                                                     {
                                                       FocusManager.instance.primaryFocus!.unfocus(
                                                       );
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
