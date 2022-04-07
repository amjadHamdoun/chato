import 'package:chato/core/utils/color_manager.dart';
import 'package:chato/feature/pages/ChatPage/chat_page.dart';
import 'package:chato/feature/pages/HomePage/bloc/home_bloc.dart';
import 'package:chato/feature/pages/HomePage/bloc/home_state.dart';
import 'package:chato/feature/pages/HomePage/home_page.dart';
import 'package:chato/feature/pages/ProfilePage/pofile_page.dart';
import 'package:chato/feature/pages/StorePage/store_page.dart';
import 'package:chato/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'RoomPage/room_page.dart';


class Pages extends StatefulWidget {
  const Pages({Key? key}) : super(key: key);

  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
   HomeBloc bloc=sl<HomeBloc>();
   PageController pageController=PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer(
      bloc:bloc ,
      listener: (context, state) {

      },
      builder: (BuildContext context, HomeState state) {
        return Scaffold(
          body: SafeArea(child:
          SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children:  [
                SizedBox(
                  height: 1.sh,
                  width: 1.sw,
                  child: PageView(
                    controller: pageController,
                    onPageChanged: (index){
                      bloc.onChangePageEvent(index);
                    },
                    children: const [
                      HomeScreen(),
                      ChatScreen(),
                      RoomScreen(),
                      StoreScreen(),
                      ProfileScreen() ,

                    ],
                  ),
                ),
              ],
            ),
          )),
          bottomNavigationBar: Theme(
            child: SizedBox(
              height: 65.h,
              child: BottomNavigationBar(


                currentIndex: state.selectedPage, //New
                onTap: (int index) {
                  pageController.jumpToPage(index);
                  bloc.onChangePageEvent(index);
                },
                items:  <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/icons/home.svg',
                      width: 20.w,

                      color: state.selectedPage==0?ColorManager.primaryColor:Theme.of(context).hintColor,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon:  SvgPicture.asset('assets/icons/chat.svg',
                      width: 20.w,
                      color: state.selectedPage==1?ColorManager.primaryColor:Theme.of(context).hintColor,
                    ),
                    label: '',

                  ),
                  BottomNavigationBarItem(
                    icon:  SvgPicture.asset('assets/icons/group_chat.svg',
                      width: 20.w,
                      color: state.selectedPage==2?ColorManager.primaryColor:Theme.of(context).hintColor,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon:  SvgPicture.asset(
                      'assets/icons/store.svg',
                      width: 20.w,
                      color: state.selectedPage==3?ColorManager.primaryColor:Theme.of(context).hintColor,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon:  SvgPicture.asset(
                      'assets/icons/profile.svg',
                      width: 20.w,
                      color:state.selectedPage==4?ColorManager.primaryColor:Theme.of(context).hintColor,
                    ),
                    label: '',
                  ),
                ],
              ),
            ),
            data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
                canvasColor: Theme.of(context).scaffoldBackgroundColor,
                // sets the active color of the `BottomNavigationBar` if `Brightness` is light
                ),
          ),
        );
      },

    );
  }
}
