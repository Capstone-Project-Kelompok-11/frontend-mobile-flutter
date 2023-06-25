import 'package:flutter/material.dart';
import 'package:lms_apps/View/widgets/final_task/final_appbar.dart';
import 'package:lms_apps/View/widgets/final_task/final_body.dart';

class FinalTaskScreen extends StatefulWidget {
  final String? fileID;
  const FinalTaskScreen({super.key, this.fileID});

  @override
  State<FinalTaskScreen> createState() => _FinalTaskScreenState();
}

class _FinalTaskScreenState extends State<FinalTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            const FinalAppbar(),
            const SizedBox(
              height: 29,
            ),
            FinalBody(fileID: widget.fileID ?? ""),
          ],
        ),
      ),
    );
  }
}
