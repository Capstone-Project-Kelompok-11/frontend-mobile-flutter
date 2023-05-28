import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';

class DownloadCertifBody extends StatelessWidget {
  const DownloadCertifBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: Center(
            
            child: Container(
              height: 220,
              width: 300,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Image.asset('assets/images/Achievement Certificate 1.png'),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.8,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Positioned(
            bottom: 0,
            child: TextButton(
              onPressed: () {
                CoolAlert.show(
                  context: context,
                  type: CoolAlertType.success,
                  title: 'Successfull',
                  text: 'congratulations you have a new skill',
                  confirmBtnText: 'Go To HomePage',
                  onConfirmBtnTap: () {},
                  confirmBtnColor: Colors.white,
                  backgroundColor: Colors.white,
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Download',
                style: whiteTextStyle.copyWith(
                    fontWeight: regular, fontSize: 14.4, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
