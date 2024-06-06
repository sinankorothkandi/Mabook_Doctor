import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mabook_doctor/common/colors.dart';

class ProfileItems extends StatelessWidget {
  final String titleText;
  final int  currentIndex;
  final IconData? suffixIcon;
  final IconData? prefixIcon;

  const ProfileItems({
    super.key,
    required this.titleText,
    this.suffixIcon,
    this.prefixIcon, 
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      // const homePage(),
      // const patient_Page(),
      // const chatHome(),
      // const Profile_Page(),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => _pages[currentIndex]));
        },
        leading: Icon(prefixIcon),
        title: Text(
          titleText,
          style: GoogleFonts.poppins(
            color: blue,
            fontSize: 20,
          ),
        ),
        trailing: Icon(suffixIcon),
      ),
    );
  }
}
