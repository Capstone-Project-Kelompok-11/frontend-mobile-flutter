import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';

class DownloadCertifAppbar extends StatelessWidget {
  const DownloadCertifAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 20),
          child: Stack(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  }, 
                  icon: Image.asset('assets/icon/ic_arrow_left.png')),
              Center(
                child: Text(
                  'Certificate',
                  style: blackTextStyle.copyWith(
                      fontWeight: semiBold, 
                      fontSize: 17.28, 
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 19,),
        const Text('Basic Microsoft Program'),
        const SizedBox(height:45 ,)
      ],
    );
  }
}