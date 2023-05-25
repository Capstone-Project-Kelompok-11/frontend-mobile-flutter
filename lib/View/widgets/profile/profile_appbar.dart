import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Text(
              'Profile',
              style: blackTextStyle.copyWith(
                fontSize: 24.88,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CircleAvatar(
            radius: 80,
            child: Image.asset('assets/images/img_profile.png'),
          ),
          const SizedBox(height: 15),
          Text(
            'Chandra Lion',
            style: blackTextStyle.copyWith(
              fontSize: 14.4,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12.5),
        ],
      ),
    );
  }
}
