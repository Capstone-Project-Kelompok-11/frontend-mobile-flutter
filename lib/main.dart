import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/provider/forgotPassword_provider.dart';
import 'package:lms_apps/View/screens/provider/login_provider.dart';
import 'package:lms_apps/View/screens/provider/newPassword_provider.dart';
import 'package:lms_apps/View/screens/provider/otp_provider.dart';
import 'package:lms_apps/View/screens/provider/register_provider.dart';
import 'package:lms_apps/View/screens/register_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginProvider>(
          create: (_) => LoginProvider(),
        ),
        ChangeNotifierProvider<RegisterProvider>(
          create: (_) => RegisterProvider(),
        ),
        ChangeNotifierProvider<ForgotPasswordProvider>(
          create: (_) => ForgotPasswordProvider(),
        ),
        ChangeNotifierProvider<OTPProvider>(
          create: (_) => OTPProvider(),
        ),
        ChangeNotifierProvider<newPasswordProvider>(
          create: (_) => newPasswordProvider(),
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
      home: registration_screen(),
    );
  }
}
