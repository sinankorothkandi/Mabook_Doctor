import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mabook_doctor/common/colors.dart';
import 'package:mabook_doctor/features/Login/controller/login_controller.dart';
import 'package:mabook_doctor/features/appointments/Controller/appoinment_controller.dart';
import 'package:mabook_doctor/features/appointments/view/prescrption/prescrption_add.dart';

Column compleatedTabBarView() {
  return const Column(
    children: [
      // Expanded(
      //   child:
      // ),
    ],
  );
}

//=============================================================================

Column UpcomingtabBarView(
    AppointmentController ctrl, LoginController Loginctrl) {
  return Column(
    children: [
      const SizedBox(
        height: 10,
      ),
      StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('appoinmentsCollection')
            .where('doctorid', isEqualTo: Loginctrl.userModel.doctorId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final appoinmentDocs = snapshot.data?.docs ?? [];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const Prescription()));
              },
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: appoinmentDocs.length,
                  itemBuilder: (context, index) {
                    final doc = appoinmentDocs[index];
                    final appointmentData = doc.data() as Map<String, dynamic>;

                    final userData =
                        appointmentData['userData'] as Map<String, dynamic>?;
                    // ignore: unused_local_variable
                    final doctorData =
                        appointmentData['doctorData'] as Map<String, dynamic>?;

                    final userName = userData?['name'] ?? 'N/A';
                    final userProfile = userData?['imageUrls'] ?? 'N/A';
                    final disease = appointmentData['disease'] ?? 'N/A';

                    return Padding(
                      padding: const EdgeInsets.only(
                        bottom: 25,
                      ),
                      child: Container(
                        height: 130,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 247, 247, 247),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            SizedBox(
                              height: 120,
                              width: 230,
                              // color: grey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "mr.$userName",
                                    style: const TextStyle(
                                        color: black, fontSize: 28),
                                  ),
                                  Text(
                                    'Diseases: $disease',
                                    style: GoogleFonts.poppins(
                                        color: Colors.grey, fontSize: 15),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        radius: 8,
                                        backgroundColor: orenge,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Pending',
                                        style: GoogleFonts.poppins(
                                            color: black, fontSize: 14),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const Spacer(),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 22,
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: bodygrey,
                                  backgroundImage: NetworkImage(userProfile),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    ],
  );
}

//==============================================================================================================================

Column canceledTabBarView() {
  return const Column(
    children: [
      // Expanded(
      //   child: ,
      // ),
    ],
  );
}
