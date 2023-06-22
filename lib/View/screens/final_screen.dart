import 'package:flutter/material.dart';
import 'package:lms_apps/View/widgets/final_task/final_appbar.dart';
import 'package:lms_apps/View/widgets/final_task/final_body.dart';

class FinalTaskScreen extends StatelessWidget {
  const FinalTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
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
