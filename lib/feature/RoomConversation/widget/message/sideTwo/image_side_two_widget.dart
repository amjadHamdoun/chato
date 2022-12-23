import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/widget/photo_view.dart';
import '../../../../User/user.dart';
import '../../../model/conversationMessage/conversation_old_message_data_model.dart';





class MessageImageSideTwo extends StatefulWidget {
  final ConversationOldMessageDataModel message;
  const MessageImageSideTwo({Key? key,required this.message}) :
        super(key: key);

  @override
  _MessageImageSideTwoState createState() => _MessageImageSideTwoState();
}

class _MessageImageSideTwoState extends State<MessageImageSideTwo> {

  File? file ;

  @override
  void initState() {
    isLocal();


    super.initState();
  }


  Future isLocal() async{
    var dir;
    if(Platform.isAndroid) {
      dir = await getExternalStorageDirectory();
    } else {
      dir = await getTemporaryDirectory();
    }
    String fileName=widget.message.all_file!.substring(50,
        widget.message.all_file!.length);
  String  filePath = dir.path + "/" + fileName;
     file = File(filePath);
    if (await file!.exists()) {
          setState(() {
          });
    }
    else{

      Dio dio=Dio();
      download(dio, widget.message.all_file!, filePath);
    }
  }

  Future download(Dio dio, String url, String savePath) async {
    try {
      Response response = await dio.get(
        url,
        onReceiveProgress: showDownloadProgress,
        //Received data with List<int>
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) { return status! < 500; }
        ),
      );

      File file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
    } catch (e) {
      print(e);
    }
  }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,

      children: [

         SizedBox(
           width: 50.w,
         ),

        file!=null?
            Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:
                        (context) => PhotoViewWidget(
                          file: file!,
                          networkImage: null,

                        ) ,));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.file(file!,
                      fit: BoxFit.fill,
                        width: 0.5.sw,
                        height: 0.2.sh,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 0.5.sw,
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                      color: Colors.transparent.withOpacity(0.6),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),bottomRight:Radius.circular(5) )
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        DateFormat('hh:mm a', 'en')
                            .format(DateTime.parse(widget.message.created_at!)),
                        style: TextStyle(
                            fontSize: 12.sp, color: ColorManager.hintText),
                      ),

                    ],
                  ),
                )
              ],
            ):
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:
                    (context) => PhotoViewWidget(
                      file: null,
                      networkImage: widget.message.all_file??
                          "https://chato.vip/WI.jpeg",
                    ) ,));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.message.all_file??
                        "https://chato.vip/WI.jpeg",
                    imageBuilder: (context, imageProvider) => Container(

                      decoration: BoxDecoration(

                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fill,

                        ),
                      ),
                    ),
                    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ],
              ),
            ),
        SizedBox(
          width: 6.w,
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
                  UserScreen(id: widget.message.user!.id!,)),
            );
          },
          child: Stack(
            alignment: Alignment.center,
            children: [

              SizedBox(
                width: 50.h,
                height: 50.h,
                child: CachedNetworkImage(
                  imageUrl:widget.message.user!.img??
                      "https://chato.vip/WI.jpeg",
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
              if(widget.message.user!.vip_user!=null)
                SizedBox(
                  width:widget.message.user!.vip_user!.vip_id=="1"?64.h: 75.h,
                  height: widget.message.user!.vip_user!.vip_id=="1"?64.h: 75.h,
                  child:Image.asset(
                    widget.message.user!.vip_user!.vip_id=="1"?
                    'assets/images/solider_frame.png':
                    widget.message.user!.vip_user!.vip_id=="2"?
                    'assets/images/knight_frame.png':
                    widget.message.user!.vip_user!.vip_id=="3"?
                    'assets/images/minister_frame.png':
                    'assets/images/king_frame.png',
                    fit: BoxFit.fill,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }



}
