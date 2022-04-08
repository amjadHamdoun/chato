import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chato/feature/Conversation/bloc/conversation_state.dart';
import 'package:chato/feature/Conversation/widget/show_media_bottom_sheet.dart';
import 'package:chato/feature/Conversation/widget/show_menu_bottom_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/utils/color_manager.dart';
import '../../Globals.dart';
import '../../injection.dart';
import 'bloc/conversation_bloc.dart';

class ConversationScreen extends StatefulWidget {
  const ConversationScreen({Key? key}) : super(key: key);

  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {

   ScrollController scrollController=ScrollController();
   ScrollController singleScrollController=ScrollController();
   TextEditingController textEditingController= TextEditingController();

   ConversationBloc bloc=sl<ConversationBloc>();


   @override
  void initState() {
  
     Future.delayed(const Duration(seconds: 1)).then((value) {
       scrollController.jumpTo(scrollController.position.maxScrollExtent);
     });


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConversationBloc,ConversationState>(
      bloc:bloc ,
      listener: (context, state) {

      },
      builder: (context, state) {
        return  KeyboardVisibilityBuilder(

          builder: (context , bool isKeyboardVisible) {
            if(isKeyboardVisible)
              {

                    bloc.onShowEmojiEvent(false);

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
                child: Scaffold(

                  appBar: AppBar(
                    toolbarHeight: 80.h,
                    actions: [
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
                              horizontal: 15.w,
                              vertical: 12.h
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  InkWell(
                                    onTap: (){
                                      Navigator.pop(context);
                                    },
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      size: 20.w,
                                      color: ColorManager.backgroundColor,
                                    ),
                                  ),
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
                                  Expanded(child:
                                  Text('ۦ⇜اسـۦـۦـد❪᪣❫ديـۦــرالـۦـزور⇝ۦ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 17.sp,
                                        color: ColorManager.backgroundColor,
                                        fontFamily: 'Roboto'
                                    ),
                                  ),),
                                  SizedBox(width: 15.w,),
                                  InkWell(
                                    onTap: (){

                                    },
                                    child: SvgPicture.asset('assets/icons/phone.svg',
                                      width: 19.w,
                                    ),
                                  ),
                                  SizedBox(width: 25.w,),
                                  InkWell(
                                    onTap: (){
                                      showMenuBottomSheet(context);
                                    },
                                    child: SvgPicture.asset(
                                      'assets/icons/menu.svg',
                                      width: 4.5.w,
                                    ),
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
                    const BouncingScrollPhysics(),
                    child: SizedBox(
                      height: 1.sh-80.h,
                      child: Column(
                        children: [
                          //appBar


                          SizedBox(
                            height: 45.h,
                          ),


                          //المحادثة
                          Expanded(

                            child:
                            ListView.separated(
                              controller: scrollController,

                              physics: const AlwaysScrollableScrollPhysics(
                                  parent: BouncingScrollPhysics()
                              ),
                              itemCount: 5,

                              shrinkWrap: true,
                              itemBuilder: (context, index){
                                if(index%2==0)
                                {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(

                                        decoration: BoxDecoration(
                                            gradient: const LinearGradient(
                                                begin: Alignment.topRight,
                                                end: Alignment.bottomLeft,
                                                colors: [
                                                  ColorManager.primaryColor,
                                                  ColorManager.primaryColorLight,
                                                ]
                                            ),
                                            borderRadius: BorderRadius.only(
                                              topRight:  Radius.circular(12.w),
                                              bottomLeft: Radius.circular(12.w),
                                              topLeft: Radius.circular(12.w),

                                            )
                                        ),
                                        child:  Padding(
                                          padding:  EdgeInsets.symmetric(horizontal: 18.w,vertical: 6.h),
                                          child: Row(
                                            children: [
                                              Text('مرحبا سامي',style: TextStyle(
                                                  color: ColorManager.backgroundColor,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600
                                              )),
                                            ],
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
                                      SizedBox(
                                        width: 0.4.sw,
                                      ),
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(

                                              gradient:Global.darkMode?  LinearGradient(
                                                  begin: Alignment.topRight,
                                                  end: Alignment.bottomLeft,
                                                  colors: [
                                                    Theme.of(context).primaryColor,
                                                    Theme.of(context).primaryColorLight,
                                                  ]
                                              ):null,
                                              borderRadius: BorderRadius.only(
                                                topRight:  Radius.circular(12.w),
                                                bottomLeft: Radius.circular(12.w),
                                                topLeft: Radius.circular(12.w),

                                              ),
                                              border: Border.all(
                                                  color: const Color(0xffDEDEDE)
                                              )
                                          ),
                                          child:  Padding(
                                            padding:  EdgeInsets.symmetric(horizontal: 18.w,vertical: 6.h),
                                            child: Text('الحمدلله لقد كانت عطلة جميلة واستمتعت كثيرا.',style: TextStyle(
                                              color: Theme.of(context).primaryColorDark,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600,

                                            ),



                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                }


                              },
                              separatorBuilder:(context, i){
                                return  SizedBox(
                                  height: 5.h,
                                );

                              },
                            ),),



                          //write message
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 15.w),
                            child:  Row(
                              children: [
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
                                          color:state.isRecord?
                                              ColorManager.backgroundColor:
                                          Theme.of(context).cursorColor,
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
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                //record_not_enable
                                if(!state.isRecord)
                                Expanded(
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          showMediaBottomSheet(context);
                                        },
                                        child: SvgPicture.asset('assets/icons/media.svg',
                                          width: 19.w,
                                          color: Theme.of(context).cursorColor,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Expanded(
                                        child: TextField(
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
                                            color: Theme.of(context).primaryColorDark,
                                            height: 1.5.h,

                                          ),
                                          cursorColor: Theme.of(context).primaryColorDark,
                                          decoration:  InputDecoration(

                                            contentPadding: EdgeInsets.symmetric(
                                              horizontal: 12.w,
                                            ),


                                            enabledBorder:  UnderlineInputBorder(
                                              borderSide: BorderSide(color: Theme.of(context).cursorColor),
                                            ),
                                            focusedBorder:  UnderlineInputBorder(
                                              borderSide: BorderSide(color: Theme.of(context).cursorColor),
                                            ),
                                            disabledBorder:UnderlineInputBorder(
                                              borderSide: BorderSide(color: Theme.of(context).cursorColor),
                                            ) ,
                                            border: UnderlineInputBorder(
                                              borderSide: BorderSide(color: Theme.of(context).cursorColor),
                                            ) ,


                                            hintText:  tr('write message'),
                                            hintStyle: TextStyle(
                                              fontSize: 15.sp,
                                              color: Theme.of(context).cursorColor,
                                            ),
                                            focusColor: Theme.of(context).cursorColor,
                                            fillColor: Theme.of(context).cursorColor,


                                          ),


                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      InkWell(
                                        onTap: ()async{
                                          if(FocusScope.of(context).hasFocus)
                                          {
                                          FocusManager.instance.primaryFocus!.unfocus(

                                            );
                                          }




                                          Future.delayed(const Duration(milliseconds: 300)).then((value) {
                                            bloc.onShowEmojiEvent(true);

                                          });

                                        },
                                        child: SvgPicture.asset('assets/icons/smile.svg',
                                          width: 19.w,
                                          color: Theme.of(context).cursorColor,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 6.w,
                                      ),
                                    ],
                                  ),
                                ),

                                //record_enable
                                if(state.isRecord)
                                  Expanded(
                                  child: Row(
                                    children:  [


                                      Expanded(


                                        child: DragTarget(
                                          builder: (context, candidateData, rejectedData) {
                                            return  Center(child:
                                            Text('Slide to cancel    01.00', style:
                                            TextStyle(color: Theme.of(context).primaryColorDark,
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
                                      IconButton(onPressed: (){
                                        bloc.onStartRecord(false);
                                      }, icon: const Icon(
                                        Icons.send,
                                        color: ColorManager.primaryColor,

                                      ))
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                          if(
                          isKeyboardVisible)
                            SizedBox(height: 250.h,),
                          SizedBox(
                            height: 20.h,
                          ),
                          Offstage(
                            offstage: !state.showEmoji,
                            child: SizedBox(
                              height: 250.h,
                              child: EmojiPicker(
                                  onEmojiSelected: (Category category, Emoji emoji) {
                                    textEditingController
                                      ..text += emoji.emoji
                                      ..selection = TextSelection.fromPosition(
                                          TextPosition(offset: textEditingController.text.length));
                                  },
                                  onBackspacePressed: (){
                                    bloc.onShowEmojiEvent(false);

                                  },
                                  config: Config(
                                      columns: 7,
                                      // Issue: https://github.com/flutter/flutter/issues/28894
                                      emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
                                      verticalSpacing: 0,
                                      horizontalSpacing: 0,
                                      initCategory: Category.RECENT,
                                      bgColor: const Color(0xFFF2F2F2),
                                      indicatorColor: Colors.blue,
                                      iconColor: Colors.grey,
                                      iconColorSelected: Colors.blue,
                                      progressIndicatorColor: Colors.blue,
                                      backspaceColor: Colors.blue,
                                      skinToneDialogBgColor: Colors.white,
                                      skinToneIndicatorColor: Colors.grey,
                                      enableSkinTones: true,
                                      showRecentsTab: true,
                                      recentsLimit: 28,
                                      noRecentsText: tr('No Recents'),
                                      noRecentsStyle:  TextStyle(
                                          fontSize: 20.sp, color: Colors.black26),
                                      tabIndicatorAnimDuration: kTabScrollDuration,
                                      categoryIcons: const CategoryIcons(),
                                      buttonMode: ButtonMode.MATERIAL)),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),


                ),
              ),
            );
          },

        );
      },

    );
  }
}
