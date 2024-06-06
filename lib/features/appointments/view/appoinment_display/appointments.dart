import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mabook_doctor/common/colors.dart';
import 'package:mabook_doctor/features/Login/controller/login_controller.dart';
import 'package:mabook_doctor/features/appointments/Controller/appoinment_controller.dart';
import 'package:mabook_doctor/features/appointments/view/appoinment_display/appointment_display_widgets.dart';
import 'package:provider/provider.dart';

class Appointments extends StatelessWidget {
  const Appointments({super.key});

  @override
  Widget build(BuildContext context) {
        final ctrl = Provider.of<AppointmentController>(context);
final Loginctrl = Provider.of<LoginController>(context);
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        title: const Text(
          "Appointments",
          style:
              TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: blue),
        ),
      ),
      body: Center(
        child: DefaultTabController(
          length: 3,
          initialIndex: 1,
          child: Column(
            children: [
              TabBar(
                dividerColor: white,
                labelColor: blue,
                unselectedLabelColor: grey,
                indicatorColor: blue,
                indicatorWeight: 4,
                unselectedLabelStyle:
                    GoogleFonts.poppins(fontWeight: FontWeight.w500),
                labelStyle: GoogleFonts.poppins(
                  fontSize: 16,
                ),
                tabs: const [
                  Tab(
                    child: Text(
                      'Compleated',
                    ),
                  ),
                  Tab(
                    child: Text('Upcoming'),
                  ),
                  Tab(
                    child: Text('Canceled'),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    //compleated tab bar view
                    compleatedTabBarView(),

                    // upcoming tab Bar View
                    UpcomingtabBarView(ctrl,Loginctrl),

                    //canceledTabBarView
                    canceledTabBarView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
