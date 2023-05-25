import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/edit_profile_screen.dart';
import 'package:lms_apps/View/screens/my_certificate_screen.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';
import 'package:lms_apps/View/screens/transaction_history_screen.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 57),
      child: Column(
        children: [
          buttonWidget(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfileScreen(),
                    ));
              },
              image: 'assets/icon/ic_profile.png',
              title: 'Edit Profile',
              textColor: blueTextStyle.copyWith(fontSize: 14.4)),
          buttonWidget(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyCertificateScreen(),
                    ));
              },
              image: 'assets/icon/ic_certificate.png',
              title: 'Certificate',
              textColor: blueTextStyle.copyWith(fontSize: 14.4)),
          buttonWidget(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TransactionHistoryScreen(),
                    ));
              },
              image: 'assets/icon/ic_transaction_history.png',
              title: 'Transaction History',
              textColor: blueTextStyle.copyWith(fontSize: 14.4)),
          buttonWidget(
              onTap: () {},
              image: 'assets/icon/ic_help_center.png',
              title: 'Help Center',
              textColor: blueTextStyle.copyWith(fontSize: 14.4)),
          buttonWidget(
            onTap: () {},
            image: 'assets/icon/ic_logout.png',
            title: 'Logout',
            color: redColor,
            textColor: whiteTextStyle.copyWith(fontSize: 14.4),
          ),
        ],
      ),
    );
  }

  Widget buttonWidget({
    required Function()? onTap,
    required String image,
    required String title,
    Color color = Colors.white,
    required TextStyle textColor,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 34,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.blue),
            color: color,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 11),
                child: SizedBox(
                  width: 13.2,
                  height: 16.56,
                  child: Image.asset(
                    image,
                    color: blackColor,
                  ),
                ),
              ),
              Text(
                title,
                style: textColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
