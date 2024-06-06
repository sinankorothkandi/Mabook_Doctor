import 'package:flutter/material.dart';
import 'package:mabook_doctor/common/bottomNavebar.dart';
import 'package:mabook_doctor/features/Login/View/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class mysplashScreen extends StatefulWidget {
  const mysplashScreen({super.key});

  @override
  State<mysplashScreen> createState() => _mysplashScreenState();
}

class _mysplashScreenState extends State<mysplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigationToHome();
  }

  void _navigationToHome() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    await Future.delayed(const Duration(milliseconds: 500));
    if (isLoggedIn) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (_) => const CustomBottomNavigationBar()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: SizedBox(
          height: 200,
          width: 420,
          child: Image.asset('assets/splash screen.png'),
        ),
      ),
    );
  }
}
