import 'package:flutter/material.dart';
import 'package:lms_apps/View/widgets/download_certificate/download_cerfiticare_body.dart';
import 'package:lms_apps/View/widgets/download_certificate/download_certificate_appbar.dart';
import 'package:lms_apps/View/widgets/download_certificate/download_certificate_button.dart';

class CertificateScreen extends StatelessWidget {
  const CertificateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          DownloadCertifAppbar(),
          DownloadCertifBody(),
        ],
      ),
      floatingActionButton: DownloadButtonCertif(),
    );
  }
}