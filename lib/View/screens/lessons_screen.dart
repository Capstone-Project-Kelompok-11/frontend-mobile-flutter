import 'package:flutter/material.dart';
import 'package:lms_apps/View/widgets/lesson/lesson_body.dart';
import '../widgets/lesson/lesson_appbar.dart';

class LessonsScreen extends StatelessWidget {
  const LessonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [ 
            LessonsAppbar(),
            LessonsBody(),
          ],
        ),
      ),
    );
  }
}