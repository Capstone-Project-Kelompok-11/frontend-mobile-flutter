import 'package:flutter/material.dart';
import 'package:lms_apps/View/widgets/edit_profile/edit_profile.body.dart';
import 'package:lms_apps/View/widgets/edit_profile/edit_profile_appbar.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EditProfileAppBar(),
              EditProfileBody(),
            ],
          ),
        ),
      ),
    );
  }
}
