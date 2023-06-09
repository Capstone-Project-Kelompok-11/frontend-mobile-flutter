import 'package:flutter/material.dart';
import 'package:lms_apps/ViewModels/edit_profile_view_model.dart';
import 'package:lms_apps/View/screens/splash_screen.dart';
import 'package:lms_apps/ViewModels/transaction_history_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<EditProfileViewModel>(
          create: (_) => EditProfileViewModel(),
        ),
        ChangeNotifierProvider<TransactionHistoryViewModel>(
          create: (_) => TransactionHistoryViewModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
