import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';
import 'package:lms_apps/ViewModels/edit_profile_view_model.dart';
import 'package:provider/provider.dart';

class EditProfileAppBar extends StatefulWidget {
  const EditProfileAppBar({super.key});

  @override
  State<EditProfileAppBar> createState() => _EditProfileAppBarState();
}

class _EditProfileAppBarState extends State<EditProfileAppBar> {
  @override
  void initState() {
    final editProfileViewModel =
        Provider.of<EditProfileViewModel>(context, listen: false);
    editProfileViewModel.getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final editProfileViewModel = Provider.of<EditProfileViewModel>(context);
    return Column(
      children: [
        Stack(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(
                'assets/icon/ic_arrow_left.png',
                width: 14,
                height: 17,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Center(
                child: Text(
                  'Edit Profile',
                  style: blackTextStyle.copyWith(
                      fontSize: 25, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        ClipRRect(
          borderRadius: BorderRadius.circular(500),
          child: editProfileViewModel.imagePath != ''
              ? Image.network(
                  '${editProfileViewModel.imagePath}',
                  fit: BoxFit.cover,
                  height: 200,
                  width: 200,
                )
              : Image.asset(
                  'assets/images/img_profile.png',
                  fit: BoxFit.cover,
                  height: 200,
                  width: 200,
                ),
        ),
      ],
    );
  }
}
