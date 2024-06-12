import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mabook_doctor/common/colors.dart';
import 'package:mabook_doctor/features/appointments/Controller/appoinment_controller.dart';
import 'package:provider/provider.dart';

class Prescription extends StatelessWidget {
  final Map<String, dynamic>? userData;
  final Map<String, dynamic>? doctorData;
  final Map<String, dynamic>? appointmentData;

  const Prescription(
      {super.key,
      required this.userData,
      required this.doctorData,
      this.appointmentData});

  @override
  Widget build(BuildContext context) {
    final ctrl = Provider.of<AppoinmentController>(context);
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        title: const Text(
          "Prescription",
          style:
              TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: blue),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.navigate_before,
              size: 28,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: ctrl.PrescriptionFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 80,
                            width: 180,
                            child: Image.asset('assets/mabookimg.png'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Blood Group',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: blue,
                                fontSize: 17),
                          ),
                          Text(
                            '${userData?['bloodGroup'] ?? 'N/A'}',
                            style:
                                GoogleFonts.poppins(color: black, fontSize: 15),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 19,
                          ),
                          Text(
                            'Patient Name',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: blue,
                                fontSize: 17),
                          ),
                          Text(
                            '${userData?['name'] ?? 'N/A'}',
                            style:
                                GoogleFonts.poppins(color: black, fontSize: 15),
                          ),
                          const SizedBox(
                            height: 28,
                          ),
                          Text(
                            'Date Of Birth',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: blue,
                                fontSize: 17),
                          ),
                          Text(
                            '${userData?['dob'] ?? 'N/A'}',
                            style:
                                GoogleFonts.poppins(color: black, fontSize: 15),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'prescription',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600, color: blue, fontSize: 17),
                ),
                const SizedBox(
                  height: 7,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        minLines: null,
                        maxLines: 8,
                        controller: ctrl.prescriptionController,
                        decoration: InputDecoration(
                          hintText: 'Type here ',
                          hintStyle:
                              GoogleFonts.poppins(color: grey, fontSize: 20),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: blue, width: 1.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: blue, width: 3),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter prescription ';
                          }
                          return null;
                        },
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Examinations',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600, color: blue, fontSize: 17),
                ),
                const SizedBox(
                  height: 7,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        minLines: null,
                        maxLines: 8,
                        controller: ctrl.examinationsController,
                        decoration: InputDecoration(
                          hintText: 'Type here ',
                          hintStyle:
                              GoogleFonts.poppins(color: grey, fontSize: 20),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: blue, width: 1.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: blue, width: 3),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Examinations ';
                          }
                          return null;
                        },
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Advance ',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600, color: blue, fontSize: 17),
                ),
                const SizedBox(
                  height: 7,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        minLines: null,
                        maxLines: 8,
                        controller: ctrl.advanceController,
                        decoration: InputDecoration(
                          hintText: 'Type here ',
                          hintStyle:
                              GoogleFonts.poppins(color: grey, fontSize: 20),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: blue, width: 1.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: blue, width: 3),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Advance ';
                          }
                          return null;
                        },
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        ctrl.addappoinmentToFirebase(
                            userData, appointmentData, doctorData, true,context);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        'Submit',
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
