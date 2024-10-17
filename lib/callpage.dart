import 'package:flutter/material.dart';
import 'package:health_connect/constant.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallPage extends StatelessWidget {
  const CallPage({super.key, required this.callID});
  final String callID;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID: AppInfo.appId, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign: AppInfo.appSign, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: userIDCommandKey.toString(),
      userName: 'UserName $userIDCommandKey',
      callID: callID,
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
    );
  }
}
