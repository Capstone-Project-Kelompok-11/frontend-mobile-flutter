import 'package:flutter/material.dart';
import 'package:lms_apps/View/widgets/category_course/category_appbar.dart';
import 'package:lms_apps/View/widgets/category_course/category_body.dart';

class CategoryCourseScreen extends StatelessWidget {
  final String? search;
  const CategoryCourseScreen({super.key, this.search});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              children: [
                const CategoryCourseAppbar(),
                const SizedBox(height: 16.0),
                CategoryCourseBody(search: search),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
