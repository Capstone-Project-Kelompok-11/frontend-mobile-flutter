import 'package:flutter/material.dart';

class DetailCourseAppbar extends StatelessWidget {
  const DetailCourseAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back),
          ),
          const Center(
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
