import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/change_image_profile_screen.dart';
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
                editProfileViewModel.nameController.text == '';
                editProfileViewModel.phoneController.text == '';
                editProfileViewModel.confirmPasswordController.text == '';
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
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(500),
              child: editProfileViewModel.isLoading
                  ? Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.3),
                      child: const CircularProgressIndicator(),
                    )
                  : editProfileViewModel.imagePath != ''
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
            Positioned(
              right: 5,
              bottom: 5,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(500),
                    color: Colors.grey),
                child: IconButton(
                  splashRadius: 20,
                  iconSize: 20,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChangeImageProfileScreen(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
