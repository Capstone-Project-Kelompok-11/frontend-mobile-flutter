import 'package:flutter/material.dart';
import 'package:lms_apps/Models/my_course_response.dart';
import 'package:lms_apps/Services/constant.dart';
import 'package:lms_apps/View/screens/quiz_screen.dart';
import '../../screens/theme/theme.dart';

import '../../../Models/detail_course_response.dart';

class LessonBottom extends StatefulWidget {
  final String moduleId;
  final List<Module>? listModules;
  const LessonBottom({super.key, required this.moduleId, this.listModules});

  @override
  State<LessonBottom> createState() => _LessonBottomState();
}

class _LessonBottomState extends State<LessonBottom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: Container(
        width: double.infinity,
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.grey),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                'Score : 0',
                style: blackTextStyle.copyWith(fontWeight: bold, fontSize: 17),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizScreen(
                      moduleId: widget.moduleId,
                    ),
                  ),
                );
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  'Take Quiz',
                  style:
                      whiteTextStyle.copyWith(fontWeight: small, fontSize: 15),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
