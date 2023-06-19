import 'package:flutter/material.dart';
import 'package:lms_apps/View/widgets/lesson/lesson_body.dart';
import 'package:lms_apps/View/widgets/lesson/lesson_bottom.dart';
import '../../Models/detail_course_response.dart';
import '../widgets/lesson/lesson_appbar.dart';

class LessonsScreen extends StatefulWidget {
  const LessonsScreen({super.key, required this.courseId, this.listModules});
  final String courseId;
  final List<Module>? listModules;

  @override
  State<LessonsScreen> createState() => _LessonsScreenState();
}

class _LessonsScreenState extends State<LessonsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
            children: List.generate(
                widget.listModules?.length ?? 0,
                (index) => Column(
                      children: [
                        LessonsAppbar(),
                        LessonsBody(
                          courseId: widget.courseId,
                          listModules: widget.listModules,
                          modulesName:
                              widget.listModules?[index].data?.name ?? "",
                              modulesDesc: widget.listModules?[index].data?.description,
                              modulesimage: widget.listModules?[index].data?.thumbnail,
                        ),
                        // Text(widget.listModules?[index].data?.name ?? ""),
                        // Text(widget.listModules?[index].data?.description ?? "")
                      ],
                    ))

            //LessonsAppbar(),
            //PageView(children: [Text('Page 2')],)
//LessonsBody(courseId:widget.courseId,listModules:widget.listModules),

            ),
        floatingActionButton: LessonBottom(),
      ),
    );
  }
}
