import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mabook_doctor/Firebase/firebase_variables.dart';
import 'package:mabook_doctor/features/Login/controller/login_controller.dart';

class ChatController with ChangeNotifier {
  bool isLoading = false;
  String? chatId;
  final picker = ImagePicker();
  final authCtrl = LoginController();

  final chatsdb = db.collection('chats');
  final messageController = TextEditingController();

  String generateChatId(String userId1, String userId2) {
    List<String> ids = [userId1, userId2];
    ids.sort();
    return ids.join("_");
  }

  Future<String> getOrCreateChat(String userId1, String userId2) async {
    String chatId = generateChatId(userId1, userId2);
    this.chatId = chatId;
    DocumentReference chatDoc = chatsdb.doc(chatId);

    DocumentSnapshot snapshot = await chatDoc.get();
    await addUserToChatWithList(userId2);
    if (!snapshot.exists) {
      await chatDoc.set({
        'userIds': [userId1, userId2],
        'createdAt': '',
        'last_message': "",
      });
    }
    return chatId;
  }

  Future<void> addUserToChatWithList(String uid) async {
    CollectionReference users = db.collection('doctoreCollection');

    QuerySnapshot userQuerySnapshot =
        await users.where('id', isEqualTo: authCtrl.userModel.doctorId).get();
    if (userQuerySnapshot.docs.isNotEmpty) {
      DocumentSnapshot userDoc = userQuerySnapshot.docs.first;
      Map<String, dynamic> data = userDoc.data() as Map<String, dynamic>;
      List chatWith = data['chatWith'];
      if (!chatWith.contains(uid)) {
        chatWith.add(uid);
        await users.doc(userDoc.id).update({'chatWith': chatWith});
      }
    }

    QuerySnapshot querySnapshot = await users.where('id', isEqualTo: uid).get();
    if (querySnapshot.docs.isNotEmpty) {
      DocumentSnapshot userDoc = querySnapshot.docs.first;
      Map<String, dynamic> data = userDoc.data() as Map<String, dynamic>;
      List chatWith = data['chatWith'];
      if (!chatWith.contains(authCtrl.userModel.doctorId)) {
        chatWith.add(authCtrl.userModel.doctorId);
        await users.doc(userDoc.id).update({'chatWith': chatWith});
      }
    } else {
      // Handle the error
    }
  }

  Future<void> sendMessage(
      String msg, String friendID, String? friendToken) async {
    try {
      if (msg.trim().isNotEmpty) {
        await chatsdb.doc(chatId).update({
          'createdAt': FieldValue.serverTimestamp(),
          'last_message': msg,
        });
        await chatsdb.doc(chatId).collection('messages').doc().set({
          "created_on": FieldValue.serverTimestamp(),
          "msg": msg,
          "last_message": msg,
          "image_url": "",
          "fromId": auth.currentUser!.uid,
          "toID": friendID,
        });
        messageController.clear();
        notifyListeners();
      }
    } catch (e) {
      // Handle the error
    }
  }

  Future<void> pickAndUploadImage(String friendID) async {
    isLoading = true;
    notifyListeners();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('chat_images/${DateTime.now().millisecondsSinceEpoch}');
      await storageRef.putFile(File(pickedFile.path));
      final imageUrl = await storageRef.getDownloadURL();
      await sendMessageWithImage(imageUrl, friendID);
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> sendMessageWithImage(String imageUrl, String friendID) async {
    isLoading = true;
    notifyListeners();
    await chatsdb.doc(chatId).collection("messages").doc().set({
      "created_on": FieldValue.serverTimestamp(),
      "msg": "",
      "last_message": "📷",
      "image_url": imageUrl,
      "fromId": authCtrl.userModel.doctorId,
      "toID": friendID,
    });
    isLoading = false;
    notifyListeners();
  }

  Stream<QuerySnapshot> getMessages() {
    return chatsdb.snapshots();
  }

  Stream<QuerySnapshot> getChats(String friendID) {
    return chatsdb
        .doc(chatId)
        .collection('messages')
        .orderBy('created_on', descending: true)
        .snapshots();
  }

  Future<List<List<dynamic>>> getListChatWith(context) async {
    QuerySnapshot querySnapshot = await db
        .collection('doctoreCollection')
        .where('id', isEqualTo: authCtrl.userModel.doctorId)
        .get();
    List<List<dynamic>> result = [];
    if (querySnapshot.docs.isNotEmpty) {
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        for (int i = 0; i < data['chatWith'].length; i++) {
          final list =
              await authCtrl.getUserDetailsByUId(data['chatWith'][i], context);
          result.add(list);
          
        }
      }
    }

    return result;
  }
}
