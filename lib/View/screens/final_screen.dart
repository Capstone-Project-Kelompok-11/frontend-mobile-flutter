import 'package:flutter/material.dart';
import 'package:lms_apps/View/widgets/final_task/final_appbar.dart';
import 'package:lms_apps/View/widgets/final_task/final_body.dart';

class FInaltask extends StatelessWidget {
  const FInaltask({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FinalAppbar(),
            SizedBox(
              height: 29,
            ),
            FinalBody(),
          ],
        ),
      ),
    );
  }
}
