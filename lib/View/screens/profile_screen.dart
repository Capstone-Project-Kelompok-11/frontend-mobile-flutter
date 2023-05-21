import 'package:flutter/material.dart';
import 'package:lms_apps/View/widgets/profile/profile_appbar.dart';
import 'package:lms_apps/View/widgets/profile/profile_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileAppBar(),
            ProfileBody(),
          ],
        ),
      ),
    );
  }
}
