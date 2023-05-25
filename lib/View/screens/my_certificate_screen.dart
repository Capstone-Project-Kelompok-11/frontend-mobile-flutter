import 'package:flutter/material.dart';
import 'package:lms_apps/View/widgets/my_certificate/my_certificate_appbar.dart';
import 'package:lms_apps/View/widgets/my_certificate/my_certificate_body.dart';

class MyCertificateScreen extends StatelessWidget {
  const MyCertificateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              MyCertificateAppBar(),
              MyCertificateBody(),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
