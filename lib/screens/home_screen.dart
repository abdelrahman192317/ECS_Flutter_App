import 'package:flutter/material.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

import 'package:provider/provider.dart';
import 'package:app2m/provider/my_provider.dart';

import 'package:app2m/screens/dates_list_screen.dart';
import 'package:app2m/screens/archive_screen.dart';
import 'package:app2m/screens/profile.dart';

import 'package:app2m/screens/add/add_doctor_date.dart';
import 'package:app2m/screens/add/add_medication_date.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _widgetList = const [
    DatesListScreen(),
    ArchiveScreen(),
    Profile()
  ];

  final List<String> _appBarList = const [
    'Dates',
    'Archive',
    'Profile'
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<MyPro>(
      builder: (ctx, val, _) => Scaffold(
        appBar: AppBar(
          title: Text(_appBarList[selectedIndex]),
          actions: [
            IconButton(
                onPressed: (){},
                icon: const Icon(Icons.notifications_active_outlined)
            ),
          ],
        ),
        body: _widgetList[selectedIndex],
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: selectedIndex,
          onItemSelected: (index) => setState(() => selectedIndex = index),
          items: [
            BottomNavyBarItem(
                icon: const Icon(Icons.home),
                title: const Text('Home')
            ),
            BottomNavyBarItem(
                icon: const Icon(Icons.archive_outlined),
                title: const Text('Archive')
            ),
            BottomNavyBarItem(
                icon: const Icon(Icons.person_outline),
                title: const Text('Profile')
            ),
          ],
        ),
        floatingActionButton: SpeedDial(
            icon: Icons.add,
            activeIcon: Icons.close,
            children: [
              SpeedDialChild(
                  label: 'Medication Date',
                  child: const Icon(Icons.medical_services_outlined),
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const AddShift()));
                  }
              ),
              SpeedDialChild(
                  label: 'Doctor Date',
                  child: const Icon(Icons.more_time_outlined),
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const AddAds()));
                  }
              ),
            ]
        ),
      )
    );
  }
}
