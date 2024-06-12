import 'package:flutter/material.dart';
import 'package:mabook_doctor/common/colors.dart';
import 'package:mabook_doctor/features/Login/controller/login_controller.dart';
import 'package:mabook_doctor/features/chat/controller/chat_controller.dart';
import 'package:mabook_doctor/features/chat/view/chatting_screen/components/appbar.dart';
import 'package:mabook_doctor/features/chat/view/chatting_screen/components/chat_bubble.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ChattingScreen extends StatefulWidget {
  ChattingScreen({super.key, required this.friendId, this.friendToken});
  String friendId;
  String? friendToken;
  @override
  State<ChattingScreen> createState() => _ChattingScreenState();
}

class _ChattingScreenState extends State<ChattingScreen> {
  // final chatCtrl = ChatController();
  final authCtrl = LoginController();

  List data = ['', null, '', ''];
  @override
  void initState() {
    fetchUserData();
    super.initState();
  }

  fetchUserData() async {
    data = await authCtrl.getUserDetailsByUId(widget.friendId, context);
    appbar(data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double initialX = 0.0;
    double finalX = 0.0;
    // chatCtrl.getChatId();
    return SafeArea(
      child: GestureDetector(
        onHorizontalDragStart: (details) {
          initialX = details.localPosition.dx;
        },
        onHorizontalDragUpdate: (details) {
          finalX = details.localPosition.dx;
        },
        onHorizontalDragEnd: (details) {
          if (finalX - initialX > 0) {
            Navigator.pop(context);
          } else {
            // while swiping from right to left
          }
        },
        child: Scaffold(
          appBar: appbar(data),
          body: SingleChildScrollView(
            child: Consumer<ChatController>(
              builder: (context, chatCtrl, child) {
                
              
                return chatCtrl.isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                      color: AppThemeData.themeColor,
                    ))
                  : ChatBubble(
                      friendID: widget.friendId,
                      friendToken: widget.friendToken,
                    );},
            ),
          ),
        ),
      ),
    );
  }
}
