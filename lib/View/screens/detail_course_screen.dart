import 'package:flutter/material.dart';
import 'package:lms_apps/View/widgets/detail_course/detail_course_appbar.dart';
import 'package:lms_apps/View/widgets/detail_course/detail_course_body.dart';

class DetailCourseScreen extends StatelessWidget {
  const DetailCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              children: [
                DetailCourseAppbar(),
                SizedBox(height: 30.0),
                DetailCourseBody(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
        ),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text(
              'Test',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {},
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
