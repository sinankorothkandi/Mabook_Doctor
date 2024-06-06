import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mabook_doctor/common/colors.dart';

class Prescription extends StatelessWidget {
  const Prescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Prescription",
          style:
              TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: blue),
        ),
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.navigate_before,
              size: 28,
            )),
      ),
      body: const Column(
        children: [
          Row(
            children: [
              
            ],
          )
        ],
      ),
    );
  }
}
