import 'package:flutter/material.dart';
import 'package:lms_apps/View/widgets/profile/profile_appbar.dart';
import 'package:lms_apps/View/widgets/profile/profile_body.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
