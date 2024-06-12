import 'package:dot_curved_bottom_nav/dot_curved_bottom_nav.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:mabook_doctor/common/colors.dart';
import 'package:mabook_doctor/features/chat/view/chat_page.dart';
import 'package:mabook_doctor/features/Home/view/home.dart';
import 'package:mabook_doctor/features/appointments/view/appoinment_display/appointments.dart';
import 'package:mabook_doctor/features/Profile/view/profil.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const Appointments(),
    const ChatPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _pages[currentIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: DotCurvedBottomNav(
              //  scrollController: _scrollController,
              // hideOnScroll: true,
              indicatorColor: blue,
              backgroundColor: blue,
              animationDuration: const Duration(milliseconds: 400),
              animationCurve: Curves.ease,
              selectedIndex: currentIndex,
              indicatorSize: 5,
              borderRadius: 25,
              height: 70,
              onTap: (index) {
                setState(() => currentIndex = index);
              },
              items: [
                Icon(
                  currentIndex == 0
                      ? EneftyIcons.home_2_bold
                      : EneftyIcons.home_2_outline,
                  color: currentIndex == 0 ? white : grey,
                ),
                Icon(
                  currentIndex == 1
                      ? EneftyIcons.document_normal_bold
                      : EneftyIcons.document_normal_outline,
                  color: currentIndex == 1 ? white : grey,
                ),
                Icon(
                  currentIndex == 2
                      ? EneftyIcons.message_2_bold
                      : EneftyIcons.message_2_outline,
                  color: currentIndex == 2 ? white : grey,
                ),
                Icon(
                  currentIndex == 3
                      ? EneftyIcons.profile_bold
                      : EneftyIcons.profile_outline,
                  color: currentIndex == 3 ? white : grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
