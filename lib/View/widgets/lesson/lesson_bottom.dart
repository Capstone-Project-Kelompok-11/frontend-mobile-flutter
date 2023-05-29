import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/quiz_screen.dart';
import '../../screens/theme/theme.dart';

class LessonBottom extends StatelessWidget {
  const LessonBottom({super.key});

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
              padding: const EdgeInsets.all(8.0),
              child: Text('Score : 0'),
            ),
            Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              child: Center(child: Text('Take Quiz')),
            ),
          ],
        ),
      ),
    );
  }
}