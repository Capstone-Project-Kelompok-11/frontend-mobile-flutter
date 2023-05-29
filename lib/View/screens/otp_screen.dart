import 'package:flutter/material.dart';
import 'package:lms_apps/View/widgets/forgot_password/otp_screen.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            otp_screen(),
          ],
        ),
      ),
    );
  }
}