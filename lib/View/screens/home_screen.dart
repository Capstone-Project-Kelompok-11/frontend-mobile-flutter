import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/profile_screen.dart';
import 'package:lms_apps/View/screens/my_course_screen.dart';
import 'package:lms_apps/View/screens/transaction_history_screen.dart';
import 'package:lms_apps/View/widgets/chat/chat.dart';

import '../widgets/home/home_appbar.dart';
import '../widgets/home/home_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget screenBottomNavigation(int index) {
    if (index == 0) {
      return const SingleChildScrollView(
        child: Column(
            children: [HomeAppBar(), SizedBox(height: 40.0), HomeBody()]),
      );
    } else if (index == 1) {
      return const MyCourseScreen();
    } else if (index == 2) {
      return const Login_Chat();
    } else if (index == 3) {
      return const ProfileScreen();
    } else {
      return const Center(child: Text('Index belum terpasang'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screenBottomNavigation(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            bottomNavBarWidget(
              image: 'assets/icon/ic_home.png',
              label: 'Home',
              color: _selectedIndex != 0 ? Colors.grey : Colors.blue,
            ),
            bottomNavBarWidget(
              image: 'assets/icon/ic_mycourse.png',
              label: 'My Course',
              color: _selectedIndex != 1 ? Colors.grey : Colors.blue,
            ),
            bottomNavBarWidget(
              image: 'assets/icon/ic_history.png',
              label: 'Chat',
              color: _selectedIndex != 2 ? Colors.grey : Colors.blue,
            ),
            bottomNavBarWidget(
              image: 'assets/icon/ic_profile.png',
              label: 'Profile',
              color: _selectedIndex != 3 ? Colors.grey : Colors.blue,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xff0A58CA),
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          onTap: _changeSelectedNavBar,
        ),
      ),
    );
  }

  BottomNavigationBarItem bottomNavBarWidget({
    required String image,
    Color color = Colors.blue,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Container(
        width: 20.5,
        height: 21.51,
        margin: const EdgeInsets.only(bottom: 3.49),
        child: Image.asset(
          image,
          color: color,
        ),
      ),
      label: label,
    );
  }
}
