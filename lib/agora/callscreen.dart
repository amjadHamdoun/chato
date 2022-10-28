import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:chato/agora/log_sink.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permission_handler/permission_handler.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({Key? key}) : super(key: key);

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  late final RtcEngine _engine;
  String channelId = '';
  bool isJoined = false,
      openMicrophone = true,
      enableSpeakerphone = true,
      playEffect = false;
  bool enableInEarMonitoring = false;

  late TextEditingController controller;
  ChannelProfileType channelProfileType =
      ChannelProfileType.channelProfileLiveBroadcasting;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: channelId);
    _initEngine();
  }

  @override
  void dispose() {
    super.dispose();
    _dispose();
  }

  Future<void> _dispose() async {
    await _engine.leaveChannel();
    await _engine.release();
  }

  Future<void> _initEngine() async {
    _engine = createAgoraRtcEngine();
    await _engine.initialize(const RtcEngineContext(
      appId: "config.appId",
    ));

    _engine.registerEventHandler(RtcEngineEventHandler(
      onError: (ErrorCodeType err, String msg) {
        logSink.log('[onError] err: $err, msg: $msg');
      },
      onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
        logSink.log(
            '[onJoinChannelSuccess] connection: ${connection.toJson()} elapsed: $elapsed');
        setState(() {
          isJoined = true;
        });
      },
      onLeaveChannel: (RtcConnection connection, RtcStats stats) {
        logSink.log(
            '[onLeaveChannel] connection: ${connection.toJson()} stats: ${stats.toJson()}');
        setState(() {
          isJoined = false;
        });
      },
    ));

    await _engine.enableAudio();
    await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await _engine.setAudioProfile(
      profile: AudioProfileType.audioProfileDefault,
      scenario: AudioScenarioType.audioScenarioGameStreaming,
    );
  }

  _joinChannel() async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      await Permission.microphone.request();
    }
    try {
      await _engine.joinChannel(
          token: "config.token",
          channelId: "channelId",
          uid: 0,
          options: ChannelMediaOptions(
            channelProfile: channelProfileType,
            clientRoleType: ClientRoleType.clientRoleBroadcaster,
          ));
    } catch (e) {
      print(e);
    }
  }

  _leaveChannel() async {
    await _engine.leaveChannel();
    setState(() {
      isJoined = false;
      openMicrophone = true;
      enableSpeakerphone = true;
      playEffect = false;
      enableInEarMonitoring = false;
    });
    Navigator.pop(context);
  }

  _switchMicrophone() async {
    // await await _engine.muteLocalAudioStream(!openMicrophone);
    await _engine.enableLocalAudio(!openMicrophone);
    setState(() {
      openMicrophone = !openMicrophone;
    });
  }

  _switchSpeakerphone() async {
    await _engine.setEnableSpeakerphone(!enableSpeakerphone);
    setState(() {
      enableSpeakerphone = !enableSpeakerphone;
    });
  }

  _switchEffect() async {
    if (playEffect) {
      await _engine.stopEffect(1);
      setState(() {
        playEffect = false;
      });
    } else {
      final path =
      (await _engine.getAssetAbsolutePath("assets/Sound_Horizon.mp3"))!;
      await _engine.playEffect(
          soundId: 1,
          filePath: path,
          loopCount: 0,
          pitch: 1,
          pan: 1,
          gain: 100,
          publish: true);
      // .then((value) {
      setState(() {
        playEffect = true;
      });
    }
  }

  _toggleInEarMonitoring(value) async {
    try {
      await _engine.enableInEarMonitoring(
          enabled: value,
          includeAudioFilters: EarMonitoringFilterType.earMonitoringFilterNone);
      enableInEarMonitoring = value;
      setState(() {});
    } catch (e) {
      // Do nothing
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black,
          ),
          isJoined ? Container(
            height: 0.6.sh,

            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [  Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 25.sp,
                ),],
              ),
                Column(
                  children: [
                    Text(
                      "Aghyad",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),

                  ],
                ),
                Container(
                  height: 200.h,
                  width: 200.h,
                  decoration:
                      const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                )
              ],
            ),
          )
          :Container(
           width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 60.h),
            child: Container(
              height: 0.28.sh,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 120.h,
                    width: 120.h,
                    decoration:
                    BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                  ),
                  Text(
                    "Aghyad",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold),
                  ),

                  Text(
                    "calling",
                    style: TextStyle(color: Colors.grey, fontSize: 20.sp),
                  )
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,

            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.blueGrey.shade800,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.sp),
                        topRight: Radius.circular(15.sp))),
                height: 0.14.sh,
                child:  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: (){
                        if(isJoined){
                             _leaveChannel();
                          }
                        else{
                          Navigator.pop(context);
                        }
                      },
                      child: Container(
                        height: 50.h,
                        width: 50.h,
                        child: Icon(Icons.call_end,color: Colors.white,size: 30.sp,),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red),
                      ),
                    ),Container(
                      height: 50.h,
                      width: 50.h,
                      child: Icon(Icons.mic_off,color: Colors.white,size: 35.sp,),
                      decoration:const BoxDecoration(
                        shape: BoxShape.circle,),
                    ),
                    Container(
                      height: 50.h,
                      width: 50.h,
                      child: Icon(Icons.volume_up,color: Colors.white,size: 30.sp,),
                      decoration:const BoxDecoration(
                        shape: BoxShape.circle,),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    ));
  }

}
