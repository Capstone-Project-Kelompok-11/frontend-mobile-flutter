import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/OnBoarding_screen.dart';
import 'package:lms_apps/View/screens/home_screen.dart';
import 'package:lms_apps/utils/shared_pref.dart';

class SplashViewModel with ChangeNotifier {
  void checkUserLogin(BuildContext context) async {
    Timer(
      const Duration(seconds: 5),
      () async {
        var cekDataLogin = await SharedPref.getToken();

        if (cekDataLogin != null) {
          // ignore: use_build_context_synchronously
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
              (route) => false);
        } else {
          // ignore: use_build_context_synchronously
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => Onbording(),
              ),
              (route) => false);
        }
      },
    );
  }
}
