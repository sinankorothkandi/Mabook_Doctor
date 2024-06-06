// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mabook_doctor/common/colors.dart';

class ChatHome extends StatelessWidget {
  const ChatHome({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        title: const Text(
          "   Message",
          style:
              TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: blue),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: blue,
              ))
        ],
      ),
      body: Center(
        child: DefaultTabController(
          length: 3,
          initialIndex: 1,
          child: Column(
            children: [
              TabBar(
                dividerColor: Colors.white,
                labelColor: blue,
                unselectedLabelColor: blueg,
                indicatorColor: blue,
                indicatorWeight: 4,
                tabs: [
                  Tab(
                    child: tabText(
                      'Patient',
                    ),
                  ),
                  Tab(
                    child: tabText('Hospital'),
                  ),
                  Tab(
                    child: tabText('Calls'),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // Tab 1: All Tasks
                    Column(
                      children: [
                        // Expanded(
                        //   child:
                        // ),
                      ],
                    ),
                    // Tab 2: Completed Tasks
                    Column(
                      children: [
                        // Expanded(
                        //   child:
                        // ),
                      ],
                    ),
                    // Tab 3: Completed Tasks
                    Column(
                      children: [
                        // Expanded(
                        //   child: ,
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    
    );
  }

  Widget tabText(String data) {
    return Container(
      height: 35,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(data,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      ),
    );
  }
}
