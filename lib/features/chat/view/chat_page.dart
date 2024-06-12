import 'package:flutter/material.dart';
import 'package:mabook_doctor/common/colors.dart';
import 'package:mabook_doctor/features/chat/view/components/chat_list.dart';



import 'components/appbar.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeData.background,
      appBar: appbar(),
      body: ChatList(),
    );
  }
}
