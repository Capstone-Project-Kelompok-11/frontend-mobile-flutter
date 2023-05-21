import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';

class MyCertificateAppBar extends StatelessWidget {
  const MyCertificateAppBar({super.key});

  @override
  Widget build(BuildContext context) {
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
                  'My Certificate',
                  style: blackTextStyle.copyWith(
                      fontSize: 25, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 42),
      ],
    );
  }
}
