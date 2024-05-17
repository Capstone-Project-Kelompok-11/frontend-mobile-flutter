import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';
import 'package:lms_apps/ViewModels/profile_view_model.dart';
import 'package:provider/provider.dart';

import '../../../Services/constant.dart';

class ProfileAppBar extends StatefulWidget {
  const ProfileAppBar({super.key});

  @override
  State<ProfileAppBar> createState() => _ProfileAppBarState();
}

class _ProfileAppBarState extends State<ProfileAppBar> {
  @override
  void initState() {
    final profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);
    profileViewModel.getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final profileViewModel = Provider.of<ProfileViewModel>(context);
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
          ClipRRect(
            borderRadius: BorderRadius.circular(500),
            child: profileViewModel.isLoading == true
                ? Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.3),
                    child: const CircularProgressIndicator(),
                  )
                : profileViewModel.imagePath != ''
                    ? Image.network(
                        '${APIConstant.url}/${profileViewModel.imagePath}',
                        fit: BoxFit.cover,
                        height: 180,
                        width: 180,
                      )
                    : Image.asset(
                        'assets/images/img_profile.png',
                        fit: BoxFit.cover,
                        height: 180,
                        width: 180,
                      ),
          ),
          const SizedBox(height: 15),
          Text(
            '${profileViewModel.nama}',
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12.5),
        ],
      ),
    );
  }
}
