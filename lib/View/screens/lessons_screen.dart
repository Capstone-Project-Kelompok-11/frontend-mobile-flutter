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
            (index) {
              var complete = widget.listModules!
                  .where((element) => element.completion == true)
                  .toList()
                  .length;
                  print(complete);
              for (var i = 0;
                  i <
                      widget.listModules!
                          .where((element) => element.completion == false)
                          .toList()
                          .length;
                  i++) {
                if (widget.listModules?[i].completion == true) {
                  return Column(
                    children: [
                      const LessonsAppbar(),
                      LessonsBody(
                        courseId: widget.courseId,
                        listModules: widget.listModules,
                        modulesName:
                            widget.listModules?[index].data?.name ?? "",
                        modulesDesc:
                            widget.listModules?[index].data?.description,
                        modulesimage:
                            widget.listModules?[index].data?.thumbnail,
                        
                      ),
                      //  if (complete == widget.listModules?.length){
                        
                      //  }
                    ],
                  );
                }
              }
              return const Center(
                child: Text('Module Belum ada'),
              );
            },
          ),
        ),
        floatingActionButton: const LessonBottom(),
      ),
    );
  }
}
