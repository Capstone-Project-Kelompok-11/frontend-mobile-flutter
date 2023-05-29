import 'package:flutter/material.dart';
import 'package:lms_apps/View/widgets/register/register_body.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [registration_screen()],
        ),
      ),
    );
  }
}
