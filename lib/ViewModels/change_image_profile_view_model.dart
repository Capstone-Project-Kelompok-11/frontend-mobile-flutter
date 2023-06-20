import 'package:flutter/material.dart';
import 'package:lms_apps/Services/change_image_profile_service.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';

class ChangeImageProfileViewModel with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  getImage(BuildContext context) async {
    _isLoading = true;
    final result = await ChangeImageProfileService().changeImage();
    if (result == true) {
      // ignore: use_build_context_synchronously
      scaffoldMessenger(
        context: context,
        title: 'Berhasil Upload Image',
        color: greenColor,
        result: result,
      );
      await Future.delayed(const Duration(milliseconds: 1000));
    } else {
      // ignore: use_build_context_synchronously
      scaffoldMessenger(
        context: context,
        title: 'Gagal Upload Image',
        color: redColor,
        result: result,
      );
    }
    _isLoading = false;
    notifyListeners();
  }

  scaffoldMessenger({
    required BuildContext context,
    required String title,
    required Color color,
    required bool result,
  }) {
    if (result == true) {
      // Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: color,
          content: Text(title),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: color,
          content: Text(title),
        ),
      );
    }
  }
}
