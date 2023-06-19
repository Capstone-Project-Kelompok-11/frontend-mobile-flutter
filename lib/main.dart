import 'package:flutter/material.dart';
import 'package:lms_apps/ViewModels/category_course_view_model.dart';
import 'package:lms_apps/ViewModels/change_image_profile_view_model.dart';
import 'package:lms_apps/ViewModels/detail_lesson_viewmodel.dart';
import 'package:lms_apps/ViewModels/edit_profile_view_model.dart';
import 'package:lms_apps/View/screens/splash_screen.dart';
import 'package:lms_apps/ViewModels/forgot_password_view_model.dart';
import 'package:lms_apps/ViewModels/login_view_model.dart';
import 'package:lms_apps/ViewModels/my_course_view_model.dart';
import 'package:lms_apps/ViewModels/otp_view_model.dart';
import 'package:lms_apps/ViewModels/popular_course_view_model.dart';
import 'package:lms_apps/ViewModels/profile_view_model.dart';
import 'package:lms_apps/ViewModels/register_view_model.dart';
import 'package:lms_apps/ViewModels/search_view_model.dart';
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
        ChangeNotifierProvider<CategoryCourseViewModel>(
          create: (_) => CategoryCourseViewModel(),
        ),
        ChangeNotifierProvider<MyCourseViewModel>(
          create: (_) => MyCourseViewModel(),
        ),
        ChangeNotifierProvider<PopularCourseViewModel>(
          create: (_) => PopularCourseViewModel(),
        ),
        ChangeNotifierProvider<ProfileViewModel>(
          create: (_) => ProfileViewModel(),
        ),
        ChangeNotifierProvider<ChangeImageProfileViewModel>(
          create: (_) => ChangeImageProfileViewModel(),
        ),
        ChangeNotifierProvider<DetailLessonViewModel>(
            create: (_) => DetailLessonViewModel()),
        ChangeNotifierProvider<SearchViewModel>(
            create: (_) => SearchViewModel()),
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
