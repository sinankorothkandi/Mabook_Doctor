import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mabook_doctor/common/colors.dart';

Row profileSection(Map<String, dynamic> userData) {
  String profilePath = userData['imageUrls'];
  return Row(
    children: [
      profilePath.isNotEmpty
          ? CircleAvatar(
              backgroundColor: grey,
              backgroundImage: NetworkImage(profilePath),
              radius: 50,
            )
          : const CircleAvatar(
              backgroundColor: bodygrey,
              radius: 50,
              child: Icon(
                Icons.person,
                color: grey,
              ),
            ),
      const SizedBox(width: 26),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mr. ${userData['name'] ?? 'No Name'}',
            style: GoogleFonts.poppins(
              fontSize: 19,
              fontWeight: FontWeight.w600,
              color: black,
            ),
          ),
          Text(
            '+91 ${userData['number'] ?? 'No number'}',
            style: GoogleFonts.poppins(
              fontSize: 17,
              color: grey,
            ),
          ),
        ],
      ),
    ],
  );
}
