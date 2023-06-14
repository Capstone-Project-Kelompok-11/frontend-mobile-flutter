import 'package:flutter/material.dart';
import 'package:lms_apps/View/widgets/my_course/my_course_appbar.dart';
import 'package:lms_apps/View/widgets/my_course/my_course_body.dart';

class MyCourseScreen extends StatefulWidget {
  const MyCourseScreen({super.key});

  @override
  State<MyCourseScreen> createState() => _MyCourseScreenState();
}

class _MyCourseScreenState extends State<MyCourseScreen> {
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
              child: MyCourseBody(),
            ),
          ],
        ),
      ),
    );
  }
}
