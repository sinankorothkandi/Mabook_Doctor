import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mabook_doctor/common/colors.dart';
import 'package:mabook_doctor/features/chat/controller/chat_controller.dart';
import 'package:provider/provider.dart';


Row messageField(BuildContext context, String friendID, String? friendToken) {
      final chatCtrl = Provider.of<ChatController>(context);

  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.01,
              vertical: 5),
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            color: AppThemeData.background,
          ),
          child: TextField(
            controller: chatCtrl.messageController,
            style: GoogleFonts.poppins(
                color: AppThemeData.themeColor, fontSize: 20),
            decoration: InputDecoration(
              prefix: const SizedBox(width: 10),
              suffixIcon: GestureDetector(
                  onTap: () async {
                    await chatCtrl.pickAndUploadImage(friendID);
                  },
                  child: const Icon(Icons.attachment_outlined)),
              suffixIconColor: AppThemeData.themeColor,
              hintText: "Type here ...",
              hintStyle: GoogleFonts.poppins(color: AppThemeData.themeColor),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            ),
          )),
      // const Spacer(),
      CircleAvatar(
        radius: 25,
        backgroundColor: AppThemeData.themeColor,
        child: Center(
          child: IconButton(
            onPressed: () async {
              chatCtrl.getChats(friendID);
              await chatCtrl.sendMessage(
                  chatCtrl.messageController.text, friendID, friendToken);
            },
            icon: Icon(
              Icons.send,
              size: 25,
              color: AppThemeData.background,
            ),
          ),
        ),
      ),
    ],
  );
}
