import 'dart:async';
import 'dart:typed_data';


import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:secure_fitness_comp/resources/fonts.dart';
import 'package:sizer/sizer.dart';

import '../../resources/height_width.dart';
import '../../resources/imagesPaths.dart';
import '../../utils/notficationsBar.dart';

class VideoCallScreen extends StatefulWidget {
  String? videoId;
  String? role;
  VideoCallScreen({Key? key, this.videoId, this.role})
      : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen>
    with WidgetsBindingObserver {
  var appKey = "7377927f1fa14951bfd57e3f05a54a61";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      channelName = "${widget.videoId}";
    });
    WidgetsBinding.instance.addObserver(this);

    _initEngine();
  }

  @override
  void dispose() async {
    leave();
    WidgetsBinding.instance.removeObserver(this);
    time.cancel();
    super.dispose();
  }

  var _notification;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    setState(() {
      _notification = state.name;
    });
    if (_notification == 'inactive') {
      setState(() {
        remoteUids = null;
      });
      Navigator.pop(context);
      await agoraEngine?.leaveChannel();
      // Navigator.pop(context);
    }
  }

  late Timer time;

  bool isWindUp = false;


  String channelName = "";
  int? remoteUids;
  bool isJoined = false;
  bool isCamera = false;
  bool isRemoteCamera = false;
  bool isSwitchCamera = false;
  RtcEngine? agoraEngine;

  bool isMuteLocal = false;
  bool isMuteRemote = false;

  Future<void> _initEngine() async {
    print("1");
    agoraEngine = await RtcEngine.create(appKey);
    print("2");

    await [Permission.microphone, Permission.camera].request();
    print("3");

    await agoraEngine?.initialize(RtcEngineContext(
      appKey,
    ));
    print("4");

    // await agoraEngine?.setChannelProfile(ChannelProfile.LiveBroadcasting);
    // await agoraEngine?.setClientRole(widget.role!);

    agoraEngine?.setEventHandler(RtcEngineEventHandler(
      error: (err) {
        print("Error is ");
        print(err);
      },

      leaveChannel: (stats) {
        setState(() {
          remoteUids = null;
        });
      },
      connectionStateChanged: (state, reason) {
        print("Fail");
        print("$reason");
        if (reason == ConnectionChangedReason.LeaveChannel) {
          setState(() {
            remoteUids = null;
            isJoined = false;
          });
        }
        //   // Notify the UI
        // Map<String, dynamic> eventArgs = {};
        // eventArgs["state"] = state;
        // eventArgs["reason"] = reason;
        // eventCallback("onConnectionStateChanged", eventArgs);
        //
      },

      // Occurs when a local user joins a channel

      joinChannelSuccess: (channel, uid, elapsed) {
        setState(() {
          isJoined = true;
          print(elapsed);
          print("elapsed Time");
          print(
              "elapsed Time convert ${DateTime.fromMillisecondsSinceEpoch(elapsed)}");
          // videoDuration = elapsed;
          print("Joined$uid");
        });
        setState(() {
          // remoteUids = uid;
          print("Id is on join  $remoteUids");
        });
        Utils.toastMessage("Local user uid:${uid} joined the channel");
        // Notify the UI
        Map<String, dynamic> eventArgs = {};
        eventArgs["connection"] = channel;
        eventArgs["elapsed"] = elapsed;
      },

      userJoined: (uid, elapsed) {
        setState(() {
          remoteUids = uid;
          print("Id is $remoteUids");
        });
        Utils.toastMessage("Remote user uid:$uid joined the channel");
        // Notify the UI
        Map<String, dynamic> eventArgs = {};
        eventArgs["remoteUid"] = uid;
        eventArgs["elapsed"] = elapsed;
        setState(() {});
      },

      // Occurs when a remote user leaves the channel

      localVideoStateChanged: (localVideoState, error) {
        print(localVideoState.name);
        print("localVideoState.name");
      },
      remoteVideoStateChanged: (uid, state, reason, elapsed) {
        print(state.name);
        print("Remote State is");
        setState(() {
          if (state.name == 'Stopped') {
            isRemoteCamera = true;
          } else {
            isRemoteCamera = false;
          }
        });
      },

      userOffline: (uid, reason) {
        // remoteUids = null;
        setState(() {
          remoteUids = null;
        });
        Utils.flushBarErrorMessage("User leave this meeting", context);
        // Utils.toastMessage("Remote user uid:$uid left the channel");
        Map<String, dynamic> eventArgs = {};
        eventArgs["remoteUid"] = uid;
        eventArgs["reason"] = reason;
      },
    ));
    print("5");

    await agoraEngine?.enableVideo();
    print("6");

    await agoraEngine?.enableAudio();
    print("7");

    await agoraEngine?.setVideoEncoderConfiguration(
      VideoEncoderConfiguration(
        dimensions: const VideoDimensions(width: 1280, height: 720),
        frameRate: VideoFrameRate.Fps15,
        bitrate: 1130,

      ),
    );
    print("8");

    await agoraEngine?.startPreview();
    print("9");
    await _joinChannel();

    // setState(() {
    //   _isReadyPreview = true;
    // });
  }

  // Clean up the resources when you leave

  Future<void> _joinChannel() async {
    print("before joined");

    await agoraEngine?.joinChannel(
      "",
      widget.videoId!,
      "",
      0,
      ChannelMediaOptions(
        autoSubscribeVideo: true,
        publishLocalVideo: true,
        autoSubscribeAudio: true,
        publishLocalAudio: true,
      ),
    );
    print("joined");
  }

  Future<void> leave() async {
    print(remoteUids);
    print("remoteUids");
    isJoined = false;
    // Destroy the Agora engine instance
    await agoraEngine?.leaveChannel();
    await agoraEngine?.destroy();
    agoraEngine = null;
  }

  @override
  Widget build(BuildContext context) {
    print("_notification");
    print(_notification);
    return Scaffold(
      body: SizedBox(
        height: 100.h,
        width: double.infinity,
        child: Stack(
          children: [
            remoteUids == null
                ? Container()
                : Container(
              color: Colors.green,
              height: 100.h,
              width: 100.w,
              child: isRemoteCamera
                  ? const Icon(
                Icons.mic,
                color: Colors.white,
              )
                  : RtcRemoteView.SurfaceView(
                channelId: widget.videoId!,
                uid: remoteUids ?? 0,
              ),
            ),

            Positioned(
                bottom: 0,
                width: 100.w,
                child: Container(
                  padding: EdgeInsets.all(1.h),
                  child: Center(child: _status()),
                )),
            Positioned(
              top: isWindUp ? 15.h : 7.h,
              right: 7.w,
              child: InkWell(
                  onTap: () {
                    agoraEngine?.switchCamera();

                    setState(() {
                      isSwitchCamera = !isSwitchCamera;
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(0.4),
                    child: Icon(
                      isSwitchCamera
                          ? CupertinoIcons.switch_camera
                          : CupertinoIcons.switch_camera_solid,
                      color: Colors.white,
                    ),
                  )),
            ),

            Positioned(
                bottom: 10.h,
                width: 100.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        await agoraEngine?.muteLocalAudioStream(isMuteRemote);
                        setState(() {
                          isMuteRemote = !isMuteRemote;
                        });
                      },
                      child: !isMuteRemote
                          ? CircleAvatar(
                        backgroundColor: Colors.grey.withOpacity(0.4),
                        child: const Icon(
                          Icons.mic_off,
                          color: Colors.white,
                        ),
                      )
                          :  const Icon(
                        Icons.mic,
                        color: Colors.white,
                      ),
                    ),
                    width(5),
                    InkWell(
                      onTap: () {
                        agoraEngine?.leaveChannel().then((value) {
                          print("value of leave is");
                          setState(() {
                            remoteUids = null;
                          });
                          Navigator.pop(context);
                        }).onError((error, stackTrace) {
                          print(error);
                        });

                        // agoraEngine?.destroy();
                        // Navigator.pop(context);
                      },
                      child:  const Icon(
                        Icons.call_end,
                        color: Colors.red,
                      ),
                    ),
                    width(5),
                    InkWell(
                      onTap: () async {
                        await agoraEngine
                            ?.enableLocalVideo(isCamera)
                            .then((value) {});
                        // await agoraEngine?.muteRemoteVideoStream(remoteUids!, isRemoteCamera);
                        setState(() {
                          isCamera = !isCamera;
                        });
                        // if (isCamera) {
                        //   setState(() {
                        //     print(isCamera);
                        //     print("isCamera");
                        //     agoraEngine?.enableVideo();
                        //     isCamera = false;
                        //     print(isCamera);
                        //     print("isCamera");
                        //   });
                        // } else {
                        //   setState(() {
                        //     agoraEngine?.disableVideo();
                        //     isCamera = true;
                        //   });
                        // }
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.grey.withOpacity(0.4),
                        child: Icon(
                          isCamera ? Icons.cameraswitch : Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    width(5),
                    // InkWell(
                    //   onTap: () async {
                    //     if (isRemoteCamera) {
                    //       setState(() {
                    //         print(isRemoteCamera);
                    //         print("isCamera");
                    //         agoraEngine?.enableVideo();
                    //         isRemoteCamera = false;
                    //         print(isRemoteCamera);
                    //         print("isCamera");
                    //       });
                    //     } else {
                    //       setState(() {
                    //         agoraEngine?.disableVideo();
                    //         isRemoteCamera = true;
                    //       });
                    //     }
                    //   },
                    //   child: CircleAvatar(
                    //     backgroundColor: Colors.grey.withOpacity(0.4),
                    //     child: Icon(
                    //       isRemoteCamera
                    //           ? Icons.cameraswitch
                    //           : Icons.camera_alt,
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    // ),
                  ],
                )),
            Positioned(
                height: 20.h,
                width: 30.w,
                top: isWindUp ? 15.h : 7.h,
                left: 7.w,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.shade400,
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: isCamera
                          ? Icon(
                        isMuteRemote ? Icons.mic_off : Icons.mic,
                        color: Colors.white,
                      )
                          : RtcLocalView.SurfaceView(
                        channelId: widget.videoId,
                      )),
                )),
          ],
        ),
      ),
    );
  }

  Widget _status() {
    String statusText;

    if (!isJoined) {
      statusText = 'Join a channel';
    } else if (remoteUids == null) {
      statusText = 'Waiting for a remote user to join...';
    } else {
      statusText = 'Connected to remote user, uid:${remoteUids}';
    }

    return Text(
      statusText,
      style: TextFonts.textW5(),
    );
  }
}
