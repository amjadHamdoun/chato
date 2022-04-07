import 'package:cached_network_image/cached_network_image.dart';
import 'package:chato/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FriendshipRequests extends StatefulWidget {
  const FriendshipRequests({Key? key}) : super(key: key);

  @override
  _FriendshipRequestsState createState() => _FriendshipRequestsState();
}

class _FriendshipRequestsState extends State<FriendshipRequests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
         leading: IconButton(
           icon: Icon(Icons.arrow_back_ios,
           color:Theme.of(context).primaryColorDark ,
           ),
           onPressed: (){
             Navigator.pop(context);
           },
         ),
        actions: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Friendship Requests',
                  style: TextStyle(
                      fontSize: 17.sp,

                      fontWeight: FontWeight.w600,
                      color: ColorManager.primaryColor
                  ) ,
                  textAlign: TextAlign.center,
                ).tr(),
            ],),
          )
        ],
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(
              height: 20.h,
            ),

            ListView.separated(
               shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
              return  Padding(
                  padding:  EdgeInsets.symmetric(
                      horizontal: 12.w
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
                      Expanded(
                        child: Text('ۦ⇜اسـۦـۦـد❪᪣❫ديـۦــرالـۦـزور⇝',
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).primaryColorDark
                          ),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      IconButton(onPressed: (){}, icon: SvgPicture.asset('assets/icons/check.svg')),
                      IconButton(onPressed: (){}, icon: SvgPicture.asset('assets/icons/trash.svg')),

                    ],
                  )
              );
            }, separatorBuilder: (context, index) {
              return  Divider(
                thickness:1,
                color: Theme.of(context).hintColor,
              );
            }, itemCount: 5),
            Divider(
              thickness:1,
              color: Theme.of(context).hintColor,
            ),
            SizedBox(
              height: 15.h,
            ),




          ],
        ),
      ),

    );
  }
}
