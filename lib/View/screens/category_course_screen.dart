import 'package:flutter/material.dart';
import 'package:lms_apps/View/widgets/category_course/category_appbar.dart';
import 'package:lms_apps/View/widgets/category_course/category_body.dart';

class CategoryCourseScreen extends StatelessWidget {
  const CategoryCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              children: [
                CategoryCourseAppbar(),
                SizedBox(height: 16.0),
                CategoryCourseBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
