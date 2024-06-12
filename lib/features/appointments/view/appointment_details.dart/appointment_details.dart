import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mabook_doctor/Firebase/firebase_variables.dart';

import 'package:mabook_doctor/common/colors.dart';
import 'package:mabook_doctor/features/Login/controller/login_controller.dart';
import 'package:mabook_doctor/features/appointments/view/appointment_details.dart/w_appointment_details.dart';
import 'package:mabook_doctor/features/chat/controller/chat_controller.dart';
import 'package:mabook_doctor/features/chat/view/chatting_screen/chatting_screen.dart';
import 'package:provider/provider.dart';

class AppointmentDetails extends StatelessWidget {
  final Map<String, dynamic> doctorData;
  final Map<String, dynamic>? appointmentData;
  final Map<String, dynamic> userdata;

  const AppointmentDetails(
      {super.key,
      required this.doctorData,
      required this.appointmentData,
      required this.userdata});

  @override
  Widget build(BuildContext context) {
    final chatCtrl = Provider.of<ChatController>(context);
    final authCtrl = Provider.of<LoginController>(context);
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        title: Text(
          'Appointment Details',
          style: GoogleFonts.poppins(color: black),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.navigate_before, color: black)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              profileSection(userdata),
              const SizedBox(height: 46),
              Text(
                'Disease',
                style: GoogleFonts.poppins(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: black,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                appointmentData?['disease'],
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: grey,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Date',
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            EneftyIcons.calendar_2_outline,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            appointmentData?['date'],
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Text(
                        'Token No',
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        appointmentData?['token'],
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          color: grey,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Text(
                    'Payment Details',
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: black,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Paid ',
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: blue,
                    ),
                  ),
                  const Icon(
                    Icons.task_alt_rounded,
                    size: 20,
                    color: blue,
                  )
                ],
              ),
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    Text(
                      'Consultation',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: grey,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.currency_rupee,
                      size: 15,
                    ),
                    Text(
                      '${doctorData.containsKey("consultancyfees") ? doctorData["consultancyfees"] : "N/A"}.00',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    Text(
                      'Admin Fee',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: grey,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.currency_rupee,
                      size: 15,
                    ),
                    Text(
                      '-',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    Text(
                      'Total',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: black,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.currency_rupee,
                      size: 15,
                      color: blue,
                    ),
                    Text(
                      '${doctorData.containsKey("consultancyfees") ? doctorData["consultancyfees"] : "N/A"}.00',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: blue,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              const SizedBox(height: 30),
              appointmentData?['isCompleated']
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'prescription',
                          style: GoogleFonts.poppins(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          appointmentData?['prescription '],
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: grey,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'Advance',
                          style: GoogleFonts.poppins(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          appointmentData?['Advance '],
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: grey,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'Examinations',
                          style: GoogleFonts.poppins(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          appointmentData?['Examinations'],
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: grey,
                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            onPressed: () async {
                              await chatCtrl.getOrCreateChat(
                                  authCtrl.userModel.doctorId!,
                                  appointmentData?['userid']);
                              final data = await authCtrl.getUserDetailsByUId(
                                  appointmentData?['doctorid'], context);
                            
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ChattingScreen(
                                          friendId:
                                              appointmentData?["userid"])));
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(19)),
                              backgroundColor: blue,
                            ),
                            child: const Text(
                              "chat with doctor",
                              style: TextStyle(color: white, fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        const SizedBox(height: 30),
                        Text(
                          'You can see other details after finishing the consult',
                          style: GoogleFonts.poppins(
                            fontSize: 17,
                            color: blue,
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
