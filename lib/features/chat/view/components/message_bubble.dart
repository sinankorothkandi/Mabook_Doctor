import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mabook_doctor/common/colors.dart';
import 'package:mabook_doctor/features/Login/controller/login_controller.dart';
import 'package:mabook_doctor/features/chat/controller/chat_controller.dart';
import 'package:mabook_doctor/features/chat/view/chatting_screen/chatting_screen.dart';
import 'package:provider/provider.dart';

Padding messageBubble(String username, String? imageUrl, String friendID,
    String? friendToken, context) {
  final chatCtrl = Provider.of<ChatController>(context);
  final authCtrl = Provider.of<LoginController>(context);
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Material(
      child: ListTile(
        onTap: () async {
          await chatCtrl.getOrCreateChat(
              authCtrl.userModel.doctorId!, friendID);

          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ChattingScreen(
                  friendId: friendID,
                ),
              ));
        },
        trailing: const Icon(Icons.navigate_next),
        leading: Container(
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
              color: AppThemeData.themeColorShade,
              borderRadius: BorderRadius.circular(50)),
          child: CircleAvatar(
            radius: 28,
            backgroundColor: Colors.black12,
            backgroundImage:
                // imageUrl == null
                //     ? const AssetImage(
                //         "assets/profile.jpeg",
                //       ) as ImageProvider
                // :
                NetworkImage(
              imageUrl!,
            ),
          ),
        ),
        title: Text(
          username,
          style: GoogleFonts.poppins(),
        ),
        subtitle: Text(
          "message",
          style: GoogleFonts.poppins(color: AppThemeData.grey),
        ),
      ),
    ),
  );
}
