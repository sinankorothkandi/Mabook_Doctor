import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mabook_doctor/common/bottomNavebar.dart';
import 'package:mabook_doctor/common/colors.dart';

class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({super.key});

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  // final AuthController ctrl = Get.find<AuthController>();
  Timer? timer;
  bool showProgressIndicator = true;
  var isEmailVerified = false;
  bool emailVerified = false;

  @override
  void initState() {
    super.initState();
    checkEmailVerified();
    startTimer();
  }

  checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser?.reload();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (isEmailVerified) {
      // Get.snackbar('Success', 'Email Successfully Verified.',
      //     snackPosition: SnackPosition.BOTTOM);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login successful!'),
          backgroundColor: Color.fromARGB(255, 114, 212, 118),
        ),
      );
      print('++++++++++++++++++++++++++Success');
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (_) => const CustomBottomNavigationBar()));
    } else {
      // Get.snackbar('Error', 'Please verify your email. Check your mail',
      //     colorText: Colors.red, snackPosition: SnackPosition.BOTTOM);
      print('==================error');
    }
  }

  startTimer() {
    timer = Timer(const Duration(seconds: 2), () {
      setState(() {
        showProgressIndicator = false;
      });
    });
  }

  restartTimer() {
    timer?.cancel();
    setState(() {
      showProgressIndicator = true;
    });
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: isEmailVerified
                ? Center(
                    child: Text(
                      "Email Successfully Verified",
                      style: GoogleFonts.poppins(fontSize: 30),
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 35),
                        const SizedBox(height: 30),
                        Center(
                          child: Text(
                            'Check your Email',
                            style: GoogleFonts.poppins(
                                fontSize: 31,
                                fontWeight: FontWeight.w600,
                                color: blue),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32.0),
                          child: Center(
                            child: Text(
                              'We have sent you an email on ${FirebaseAuth.instance.currentUser?.email}',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  fontSize: 18, color: bodygrey),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Center(
                          child: emailVerified
                              ? Text(
                                  "verified",
                                  style: GoogleFonts.poppins(
                                      fontSize: 30, color: blue),
                                )
                              : showProgressIndicator
                                  ? const CircularProgressIndicator(
                                      color: blue,
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        restartTimer();
                                        checkEmailVerified();
                                      },
                                      child: const Icon(
                                        Icons.refresh_rounded,
                                        size: 30,
                                        color: blue,
                                      ),
                                    ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32.0),
                          child: Center(
                            child: Text(
                              showProgressIndicator
                                  ? 'Verifying email....'
                                  : "Retry...",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  fontSize: 13, color: black),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        // GestureDetector(
                        //   onTap: () {},
                        //   child: const Icon(
                        //     Icons.refresh_rounded,
                        //     size: 30,
                        //     color: Color(0xFF00704A),
                        //   ),
                        // ),
                        const SizedBox(height: 10),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all<Color>(
                                blue,
                              ),
                            ),
                            child: Text(
                              'Resend',
                              style: GoogleFonts.poppins(
                                  fontSize: 20, color: white),
                            ),
                            onPressed: () {
                              try {
                                FirebaseAuth.instance.currentUser
                                    ?.sendEmailVerification();
                              } catch (e) {
                                debugPrint('$e');
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  )));
  }
}
