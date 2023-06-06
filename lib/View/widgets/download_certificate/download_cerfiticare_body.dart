import 'package:flutter/material.dart';

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
              height: 280,
              width: 300,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Image.asset('assets/images/Achievement Certificate 1.png'),
            ),
          ),
        ),
      ],
    );
  }
}
