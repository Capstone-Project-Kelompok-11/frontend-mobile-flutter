import 'package:flutter/material.dart';
import 'package:lms_apps/View/widgets/forgot_password/forgot_password.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            forgot_password(),
          ],
        ),
      ),
    );
  }
}