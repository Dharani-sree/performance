import 'package:flutter/material.dart';
import 'package:machine_performance/components/dashboard/dashboard.dart';
import 'package:machine_performance/components/department/department.dart';
import 'package:machine_performance/components/homeScreen/homescreen.dart';

class HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  static List<Widget> widgetOptions = <Widget>[
    DashboardPage(),
    DepartmentPage(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        
        items: const <BottomNavigationBarItem>[
           BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon:  Icon(Icons.factory_rounded),
            label: 'Departments',
            
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
         selectedLabelStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
        unselectedItemColor: Colors.grey,
        onTap: onItemTapped,
      ),
    );
  }
}