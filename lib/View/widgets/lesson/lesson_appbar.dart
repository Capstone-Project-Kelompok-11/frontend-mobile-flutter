import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';

class LessonsAppbar extends StatefulWidget {
  const LessonsAppbar({super.key});

  @override
  State<LessonsAppbar> createState() => _LessonsAppbarState();
}

class _LessonsAppbarState extends State<LessonsAppbar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 20),
          child: Stack(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  }, 
                  icon: Image.asset('assets/icon/ic_arrow_left.png')),
              Center(
                child: Text(
                  'Lessons',
                  style: blackTextStyle.copyWith(
                      fontWeight: semiBold, 
                      fontSize: 25, 
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
