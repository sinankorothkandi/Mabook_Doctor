import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mabook_doctor/common/colors.dart';
import 'package:mabook_doctor/features/Login/controller/login_controller.dart';
import 'package:provider/provider.dart';



class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Consumer<LoginController>(
        
        builder: (BuildContext context, loginController, Widget? child) {  
           if (loginController.userModel!.email == '') {
      loginController.loadUserData();
    }
        return SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 185,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Login',
                        style: GoogleFonts.poppins(
                          color: blue,
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                        ),
                      ))),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Please sign in to continue',
                      style: TextStyle(color: blue, fontSize: 19),
                    ),
                  )),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  controller: loginController.usernameController,
                  decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: GoogleFonts.poppins(color: blue),
                      prefixIcon: const Icon(
                        Icons.person_outlined,
                        color: blue,
                      )),
                ),
              ),
              if (loginController.userNameError.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      loginController.userNameError,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  controller: loginController.emailController,
                  decoration: InputDecoration(
                    labelText: 'E-Mail',
                    labelStyle: GoogleFonts.poppins(color: blue),
                    prefixIcon: const Icon(
                      Icons.lock_outlined,
                      color: blue,
                    ),
                  ),
                ),
              ),
             
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  controller: loginController.imrController,
                  decoration: InputDecoration(
                    labelText: 'IMR Register No',
                    labelStyle: GoogleFonts.poppins(color: blue),
                    prefixIcon: const Icon(
                      Icons.lock_outlined,
                      color: blue,
                    ),
                  ),
                ),
              ),
              if (loginController.passwordErorr.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      loginController.passwordErorr,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                     loginController.login(context);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      'Login',
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));},
      ),
    );
  }
}
