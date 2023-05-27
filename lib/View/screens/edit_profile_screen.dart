import 'package:flutter/material.dart';
import 'package:lms_apps/View/widgets/edit_profile/edit_profile.body.dart';
import 'package:lms_apps/View/widgets/edit_profile/edit_profile_appbar.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

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
