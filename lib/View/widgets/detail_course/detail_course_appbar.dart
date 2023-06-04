import 'package:flutter/material.dart';

class DetailCourseAppbar extends StatelessWidget {
  const DetailCourseAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal:16.0),
      child: Stack(
        children: [
          Icon(Icons.arrow_back),
          Center(
            child: Text(
              'Category',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
