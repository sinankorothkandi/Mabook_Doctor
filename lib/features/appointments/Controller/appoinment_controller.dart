import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mabook_doctor/features/Login/controller/login_controller.dart';
import 'package:provider/provider.dart';

class AppointmentController extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
//  getappointmentData(LoginController Loginctrl) async {
//     try {
//       QuerySnapshot querySnapshot = await _firestore
//           .collection('appoinmentsCollection')
//           .where('doctorid', isEqualTo:Loginctrl.userModel.doctorId )
//           .get();
//       if (querySnapshot.docs.isNotEmpty) {
//         DocumentSnapshot userDoc = querySnapshot.docs.first;
//         Map<String, dynamic> data = userDoc.data() as Map<String, dynamic>;
//       String  doctor = data['doctor'];
//        String date = data['date'];
//       } else {
//         print("Error No user found with the provided ID.");
//       }
//     } catch (e) {
//       print('Error${e.toString()}');
//     }
// }
}