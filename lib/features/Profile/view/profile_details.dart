import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mabook_doctor/common/colors.dart';
import 'package:mabook_doctor/features/Login/controller/login_controller.dart';
import 'package:provider/provider.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Provider.of<LoginController>(context);
    if (ctrl.userModel.email == '') {
      ctrl.loadUserData();
    }
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: white,
          centerTitle: true,
          title: Text(
            'Personal Information',
            style:
                GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.navigate_before)),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (ctrl.userModel.profile!.isNotEmpty)
                Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              NetworkImage(ctrl.userModel.profile!),
                        ),
                      ),
                      Text(
                        'Dr.${ctrl.userModel.name}',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            color: black,
                            fontSize: 20),
                      ),
                      Text(
                        ctrl.userModel.department!,
                        style: GoogleFonts.poppins(color: black, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Education',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.blueGrey,
                          fontSize: 17),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      ' ${ctrl.userModel.education}',
                      style: GoogleFonts.poppins(color: black, fontSize: 15),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'E-mail Id',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.blueGrey,
                          fontSize: 17),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      ' ${ctrl.userModel.email}',
                      style: GoogleFonts.poppins(color: black, fontSize: 15),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Phone Number',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.blueGrey,
                          fontSize: 17),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      ' +91  ${ctrl.userModel.phoneNumber}',
                      style: GoogleFonts.poppins(color: black, fontSize: 15),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'State Medical Council',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.blueGrey,
                          fontSize: 17),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      " ${ctrl.userModel.stateMedicalCouncil} Year's",
                      style: GoogleFonts.poppins(color: black, fontSize: 15),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'IMR Register No',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.blueGrey,
                          fontSize: 17),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      " ${ctrl.userModel.imrRegisterNo}",
                      style: GoogleFonts.poppins(color: black, fontSize: 15),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'Specialize In',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blueGrey,
                                  fontSize: 17),
                            ),
                            Text(
                              ctrl.userModel.specializeIn!,
                              style: GoogleFonts.poppins(
                                  color: black, fontSize: 15),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            Text(
                              'Experience',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blueGrey,
                                  fontSize: 17),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              " ${ctrl.userModel.experience} Year's",
                              style: GoogleFonts.poppins(
                                  color: black, fontSize: 15),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'Date of Birth',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blueGrey,
                                  fontSize: 17),
                            ),
                            Text(
                              ctrl.userModel.dob!,
                              style: GoogleFonts.poppins(
                                  color: black, fontSize: 15),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            Text(
                              'Gender',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blueGrey,
                                  fontSize: 17),
                            ),
                            Text(
                              ctrl.userModel.gender!,
                              style: GoogleFonts.poppins(
                                  color: black, fontSize: 15),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Professional Bio',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.blueGrey,
                          fontSize: 17),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      ctrl.userModel.professionalBio!,
                      style: GoogleFonts.poppins(color: black, fontSize: 15),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
