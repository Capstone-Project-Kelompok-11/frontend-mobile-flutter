import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/my_course_screen.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';

class DownloadCertifAppbar extends StatelessWidget {
  const DownloadCertifAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Stack(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const MyCourseScreen()));
                    }, 
                    icon: Image.asset('assets/icon/ic_arrow_left.png'),),
                Center(
                  child: Text(
                    'Certificate',
                    style: blackTextStyle.copyWith(
                        fontWeight: semiBold, 
                        fontSize: 17.28, 
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 19,),
          Text('Basic Microsoft Program',style: blackTextStyle.copyWith(fontSize: 15,fontWeight: regular),),
        ],
      ),
    );
  }
}