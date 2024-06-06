import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mabook_doctor/Firebase/firebase_variables.dart';
import 'package:mabook_doctor/features/Login/View/email_verification.dart';
import 'package:mabook_doctor/features/Login/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends ChangeNotifier {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController imrController = TextEditingController();
   final String userNameError = '';
  final String passwordErorr = '';
  UserModel userModel = UserModel(); 
  bool isUserLoaded = false;  

  void login(BuildContext context) async {
    try {
      QuerySnapshot snapshot = await firestore
          .collection('doctoreCollection')
          .where('email', isEqualTo: emailController.text)
          .where('name', isEqualTo: usernameController.text)
          .get();

      if (snapshot.docs.isNotEmpty) {
        DocumentSnapshot userDoc = snapshot.docs.first;
        Map<String, dynamic> data = userDoc.data() as Map<String, dynamic>;

        userModel = UserModel()
          ..email = data['email']
          ..name = data['name']
          ..professionalBio = data['bio']
          ..consultingTimes = data['consulting_times']
          ..department = data['department']
          ..dob = data['dob']
          ..education = data['education']
          ..experience = data['experience']
          ..gender = data['gender']
          ..imrRegisterNo = data['imrregisterno']
          ..joiningDate = data['joiningdate']
          ..phoneNumber = data['phone_number']
          ..consultancyFees = data['consultancyfees']
          ..doctorId = userDoc.id
          ..profile = data['profile']
          ..specializeIn = data['specializein']
          ..stateMedicalCouncil = data['statemedicalcouncil'];

        setLoggedIn();
        await saveUserData();
        isUserLoaded = true;  // Set the flag to true when user data is loaded
        notifyListeners();  // Notify listeners that the user data is loaded

        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: imrController.text);
        await userCredential.user!.sendEmailVerification();

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => EmailVerificationPage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No user found with the provided email and username'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print('Error occurred while querying users: $e');
    }
  }

  void setLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isLoggedIn", true);
  }

  Future<void> saveUserData() async {
    var box = Hive.box<UserModel>('userBox');
    await box.put('user', userModel);
  }

  Future<void> loadUserData() async {
  var box = Hive.box<UserModel>('userBox');
  userModel = box.get('user')!;
  isUserLoaded = true; 
  notifyListeners();
}
}
