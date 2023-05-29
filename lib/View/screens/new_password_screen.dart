import 'package:flutter/material.dart';
import 'package:lms_apps/View/widgets/forgot_password/new_password.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            new_password(),
          ],
        ),
      ),
    );
  }
}
