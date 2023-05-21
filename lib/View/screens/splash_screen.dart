import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/home_screen.dart';
import 'package:lms_apps/View/screens/onboarding_screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  void initState() {
    super.initState();
    splashscreenStart();
  }

  splashscreenStart() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Onbording()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.book,
              size: 100.0,
              color: Colors.blue,
            ),
            const SizedBox(
              height: 24.0,
            ),
            const Text(
              'AcadeMade',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const Text(
              'Learning Made Easy With AcadeMade',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 500,
            ),
            // const SpinKitWave(
            //   color: Colors.blue,
            //   size: 50,
            // ),
            LoadingAnimationWidget.staggeredDotsWave(
              color: Colors.blue,
              size: 50,
            ),
          ],
        ),
      ),
    );
  }
}
