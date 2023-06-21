import 'package:flutter/material.dart';
import 'package:lms_apps/View/widgets/detail_course/detail_course_appbar.dart';
import 'package:lms_apps/View/widgets/detail_course/detail_course_body.dart';
import 'package:lms_apps/View/widgets/detail_course/detail_course_button.dart';
import 'package:lms_apps/ViewModels/detail_course_view_model.dart';
import 'package:provider/provider.dart';

class DetailCourseScreen extends StatelessWidget {
  final String? courseId;
  const DetailCourseScreen({super.key, this.courseId});

  @override
  Widget build(BuildContext context) {
    final courseById =
        Provider.of<DetailCourseViewModel>(context, listen: true);
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            courseById.refreshDetail(courseId: courseId);
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: [
                  const DetailCourseAppbar(),
                  const SizedBox(height: 30.0),
                  DetailCourseBody(courseId: courseId),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: const BuyButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
