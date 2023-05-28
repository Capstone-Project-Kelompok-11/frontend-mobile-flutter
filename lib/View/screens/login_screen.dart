import 'package:flutter/material.dart';
import 'package:lms_apps/View/widgets/login/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            login_screen(),
          ],
        ),
      ),
    );
  }
}
