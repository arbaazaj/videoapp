import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({Key? key, required this.name, required this.userID})
      : super(key: key);

  final String name;
  final int userID;

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final String? appID = dotenv.get('APPID');
  final String? appSign = dotenv.get('APPSIGN');

  static const int callID = 123;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ZegoUIKitPrebuiltCall(
          appID: int.parse(appID!),
          appSign: appSign!,
          callID: callID.toString(),
          userID: widget.userID.toString(),
          userName: widget.name,
          config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
            ..onOnlySelfInRoom = (context) => Navigator.pop(context),
        ),
      ),
    );
  }
}
