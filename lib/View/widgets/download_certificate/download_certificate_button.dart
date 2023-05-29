import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

import '../../screens/theme/theme.dart';

class DownloadButtonCertif extends StatelessWidget {
  const DownloadButtonCertif({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only( left: 35),
      child: SizedBox(
        width: double.infinity,
        height: 40,
        child: ElevatedButton(
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
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            'Download',
            style: whiteTextStyle.copyWith(
                fontWeight: regular, fontSize: 14.4),
          ),
        ),
      ),
    );
  }
}