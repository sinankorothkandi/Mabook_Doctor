import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AppoinmentController extends ChangeNotifier {
  final PrescriptionFormKey = GlobalKey<FormState>();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController prescriptionController = TextEditingController();
  final TextEditingController examinationsController = TextEditingController();
  final TextEditingController advanceController = TextEditingController();

  Future<void> addappoinmentToFirebase(
      userdatas, appointmentData, doctorData, bool isCompleated,context) async {
    if (PrescriptionFormKey.currentState!.validate()) {
      try {
        print('================Eeeeeee:');
        print(appointmentData['appointmentId']);

        await _firestore
            .collection('appoinmentsCollection')
            .doc(appointmentData['appointmentId'])
            .update({
          'disease': appointmentData['disease'],
          'date': appointmentData['date'],
          'token': appointmentData['token'],
          'paid': appointmentData['paid'],
          'doctorid': appointmentData['doctorid'],
          'userid': userdatas['id'],
          'doctorData': doctorData,
          'userData': userdatas,
          'prescription ': prescriptionController.text,
          'Examinations': examinationsController.text,
          'Advance ': advanceController.text,
          'iscanceled': false,
          'isCompleated': isCompleated = true,
        });
        Navigator.pop(context);
      } catch (e) {
        print('================Error booking appoinmet : $e');
      }
    }
  }
}
