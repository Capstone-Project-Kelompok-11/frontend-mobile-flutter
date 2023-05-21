import 'package:flutter/material.dart';
import 'package:lms_apps/View/widgets/my_course/my_course_appbar.dart';

class MyCourseScreen extends StatelessWidget {
  const MyCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Column(
          children: [
            MyCourseAppBar(),
            Expanded(
              child: MyCourseAppBar(),
            ),
          ],
        ),
      ),
    );
  }
}
