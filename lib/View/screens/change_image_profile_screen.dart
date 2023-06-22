import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/edit_profile_screen.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';
import 'package:lms_apps/ViewModels/change_image_profile_view_model.dart';
import 'package:lms_apps/ViewModels/edit_profile_view_model.dart';
import 'package:provider/provider.dart';

class ChangeImageProfileScreen extends StatefulWidget {
  const ChangeImageProfileScreen({super.key});

  @override
  State<ChangeImageProfileScreen> createState() =>
      _ChangeImageProfileScreenState();
}

class _ChangeImageProfileScreenState extends State<ChangeImageProfileScreen> {
  @override
  void initState() {
    Provider.of<EditProfileViewModel>(context, listen: false).getUserInfo();
    // Provider.of<ChangeImageProfileViewModel>(context, listen: false)
    //     .getImage(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final changeImageViewModel = Provider.of<EditProfileViewModel>(context);
    final changeViewModel = Provider.of<ChangeImageProfileViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const EditProfileScreen(),
              ),
            );
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: blackColor,
          ),
        ),
        backgroundColor: whiteColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(500),
              child: changeViewModel.isLoading == true
                  ? Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.3),
                      child: const CircularProgressIndicator(),
                    )
                  : changeImageViewModel.imagePath != ''
                      ? Image.network(
                          '${changeImageViewModel.imagePath}',
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
          ),
          GestureDetector(
            onTap: () {
              changeViewModel.getImage(context);
            },
            child: Container(
              width: 150,
              height: 50,
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: greyColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1,
                  color: greyColor,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.cloud_upload_rounded,
                    color: whiteColor,
                  ),
                  Text(
                    'Upload Image',
                    style: whiteTextStyle.copyWith(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
