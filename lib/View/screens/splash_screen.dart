import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/Onboarding_screen.dart';
import 'package:lms_apps/ViewModels/splash_view_model.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  void initState() {
    super.initState();
    SplashViewModel().checkUserLogin(context);
    // splashscreenStart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Image.asset(
                'assets/images/image1.png',
                width: 360,
                height: 156.17,
              ),
            ),
            LoadingAnimationWidget.staggeredDotsWave(
              color: Colors.blue,
              size: 110,
            ),
          ],
        ),
      ),
    );
  }
}
