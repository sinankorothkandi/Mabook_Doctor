import 'package:flutter/material.dart';
import 'package:mabook_doctor/common/colors.dart';
import 'package:mabook_doctor/features/Login/controller/login_controller.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Provider.of<LoginController>(context);

    if (!ctrl.isUserLoaded) {
      ctrl.loadUserData();
 
    }
    return Scaffold(
      backgroundColor: white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80, right: 210, bottom: 40),
            child: Text(
              'Dr.${ctrl.userModel.name}',
              style: const TextStyle(
                  color: blue, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              const SizedBox(
                width: 25,
              ),
              SizedBox(
                height: 45,
                width: 165,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text('Patients'),
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 45,
                width: 165,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text('Appointment '),
                ),
              ),
              const SizedBox(
                width: 25,
              ),
            ],
          )
        ],
      ),
    );
  }
}
