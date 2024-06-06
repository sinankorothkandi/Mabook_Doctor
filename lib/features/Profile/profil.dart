// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mabook_doctor/common/colors.dart';
import 'package:mabook_doctor/features/Login/View/login_screen.dart';
import 'package:mabook_doctor/features/Login/controller/login_controller.dart';
import 'package:mabook_doctor/features/Profile/profile_details.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    final ctrl = Provider.of<LoginController>(context);

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        title: const Text(
          "Profile",
          style:
              TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: blue),
        ),
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    Container(
                        child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        ctrl.userModel.profile!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    )),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          'Dr.${ctrl.userModel.name}',
                          style: TextStyle(
                              color: blue,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 40,
                          width: 200,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 25,
                              ),
                              FaIcon(
                                FontAwesomeIcons.heartPulse,
                                color: blue,
                                size: 18,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                ctrl.userModel.department!,
                                style: TextStyle(
                                  color: blue,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          width: 200,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 25,
                              ),
                              FaIcon(
                                FontAwesomeIcons.phone,
                                color: blue,
                                size: 16,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                '+91 ${ctrl.userModel.phoneNumber}',
                                style: TextStyle(
                                  color: blue,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          width: 200,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 25,
                              ),
                              FaIcon(
                                FontAwesomeIcons.school,
                                color: blue,
                                size: 16,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                ctrl.userModel.education!,
                                style: TextStyle(
                                  color: blue,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: 365,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => DoctorDetailsScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      'VIEW PROFILE ',
                      style: GoogleFonts.poppins(fontSize: 19),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListTile(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (_) => hospital_details()));
              },
              leading: Icon(Icons.list_alt_rounded, color: blue),
              title: Text(
                'Appointments',
                style: TextStyle(
                  color: blue,
                  fontSize: 20,
                ),
              ),
              trailing: Icon(Icons.navigate_next, color: blue),
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListTile(
              onTap: () {
                //  Navigator.push(
                //       context, MaterialPageRoute
                //   (builder:(_)=> select_deparment() ));
              },
              leading: Icon(Icons.help_outline_outlined, color: blue),
              title: Text(
                'Help Center',
                style: TextStyle(color: blue, fontSize: 20),
              ),
              trailing: Icon(Icons.navigate_next, color: blue),
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListTile(
              onTap: () {
                // Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //         builder: (_) => staff_List()));
              },
              leading: Icon(Icons.feedback_outlined, color: blue),
              title: Text(
                'User Feedback',
                style: TextStyle(color: blue, fontSize: 20),
              ),
              trailing: Icon(Icons.navigate_next, color: blue),
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListTile(
              onTap: () {
                showSignOutDialog(context);
              },
              leading: Icon(Icons.login_outlined, color: blue),
              title: Text(
                'Logout',
                style: TextStyle(color: blue, fontSize: 20),
              ),
              trailing: Icon(Icons.navigate_next, color: blue),
            ),
          ),
        ],
      ),
    );
  }
}

void showSignOutDialog(
  BuildContext context,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: bodygrey,
        title: const Text(
          "sign out",
          style: TextStyle(color: white),
        ),
        content: const Text('Are You Sure You Want To Signout?',
            style: TextStyle(color: white)),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No', style: TextStyle(color: white))),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
                signOut(context);
              },
              child: const Text('Yes', style: TextStyle(color: white)))
        ],
      );
    },
  );
}

void signOut(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isLoggedIn', false);
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => LoginPage()));
}
