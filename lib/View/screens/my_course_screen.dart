import 'package:flutter/material.dart';
import 'package:lms_apps/View/widgets/my_course/my_course_appbar.dart';
import 'package:lms_apps/View/widgets/my_course/my_course_body.dart';
import 'package:lms_apps/ViewModels/my_course_view_model.dart';
import 'package:provider/provider.dart';

class MyCourseScreen extends StatefulWidget {
  const MyCourseScreen({super.key});

  @override
  State<MyCourseScreen> createState() => _MyCourseScreenState();
}

class _MyCourseScreenState extends State<MyCourseScreen> {
  @override
  void initState() {
    final myCourseViewModel =
        Provider.of<MyCourseViewModel>(context, listen: false);
    myCourseViewModel.getMyCourseProgress();
    // myCourseViewModel.getMyCourseProgressByID();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final myCourseViewModel = Provider.of<MyCourseViewModel>(context);
    return Scaffold(
      body: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Column(
          children: [
            const MyCourseAppBar(),
            myCourseViewModel.isLoading
                ? Container(
                    width: 50,
                    height: 50,
                    padding: const EdgeInsets.only(top: 10),
                    child: const CircularProgressIndicator(),
                  )
                : const Expanded(
                    child: MyCourseBody(),
                  ),
          ],
        ),
      ),
    );
  }
}
