// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lms_apps/Services/final_task_service.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';

class FinalTaskViewModel with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  final List<String> _data = [
    'Pilih Topik Aplikasi: Pilihlah topik aplikasi yang menarik dan relevan. Anda dapat memilih topik seperti aplikasi perjalanan, aplikasi kesehatan, aplikasi keuangan, atau topik lain sesuai minat Anda.',
    'Rancang Wireframe: Buat wireframe untuk antarmuka aplikasi Anda. Tentukan tata letak halaman, penempatan elemen-elemen penting, dan alur navigasi yang intuitif.',
    'Desain Visual: Berdasarkan wireframe, buat desain visual yang menarik dan sesuai dengan tema aplikasi Anda. Pertimbangkan pemilihan warna, tipografi, ikon, dan elemen grafis lainnya untuk menciptakan tampilan yang konsisten dan menarik.'
  ];
  List<String> get data => _data;

  uploadFile(String fileID, BuildContext context) async {
    _isLoading = true;
    final result = await FinalTaskService().uploadFile(fileID);
    if (result) {
      scaffoldMessenger(
        context: context,
        title: 'Berhasil Upload File',
        color: greenColor,
        result: result,
      );
      await Future.delayed(const Duration(milliseconds: 1000));
    } else {
      scaffoldMessenger(
        context: context,
        title: 'Gagal Upload File',
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
