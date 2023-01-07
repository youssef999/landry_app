import 'package:course_app/screens/courses/Course.dart';
import 'package:course_app/screens/landry_y_tasks/screens/history_screen.dart';
import 'package:course_app/screens/landry_y_tasks/screens/home.dart';
import 'package:course_app/screens/home/widget/notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../m_landry/profile/profile_screen.dart';


class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);
  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int myIndex = 0;
  List<Widget> widgetList = [
    HomePage(),
    HistoryScreen(),
   // MyCoursesScreen(),
    NotificationScreen(),
    ProfileScreen2()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetList[myIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              myIndex = index;
            });
          },
          currentIndex: myIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "الصفحة الرئسية".tr),
            BottomNavigationBarItem(
                icon: Icon(Icons.list_alt), label: "الطلب".tr),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: "اشعارات".tr),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "الحساب".tr),
          ]),
    );
  }
}
