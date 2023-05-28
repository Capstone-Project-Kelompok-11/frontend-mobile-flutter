import 'package:flutter/material.dart';
import '../../screens/theme/theme.dart';

class LessonBottom extends StatelessWidget {
  const LessonBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 50),
        child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 8,top: 2),
                      decoration: const BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.all(Radius.circular(10))),
                      height: 40,
                      width: 170,
                      child: Text(
                        'Score : 0',
                        style: blackTextStyle.copyWith(
                            fontWeight: semiBold,
                            fontSize: 17.28,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      width: 170,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Take Quiz',
                          style: whiteTextStyle.copyWith(
                              fontWeight: regular, fontSize: 14.4),
                        ),
                      ),
                    )
                  ],
                ),
      );
  }
}