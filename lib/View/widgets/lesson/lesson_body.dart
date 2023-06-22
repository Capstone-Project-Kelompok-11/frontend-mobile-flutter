import 'package:flutter/material.dart';
import 'package:lms_apps/Services/constant.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';
import 'package:provider/provider.dart';

import '../../../Models/detail_course_response.dart';
import '../../../ViewModels/detail_lesson_viewmodel.dart';

class LessonsBody extends StatefulWidget {
  final String courseId;
  final List<Module>? listModules;
  final String? modulesName;
  final String? modulesDesc;
  final String? modulesimage;
  const LessonsBody(
      {super.key,
      required this.courseId,
      this.listModules,
      this.modulesName,
      this.modulesDesc,
      this.modulesimage});

  @override
  State<LessonsBody> createState() => _LessonsBodyState();
}

class _LessonsBodyState extends State<LessonsBody> {
  void getLessonDetail() async {
    final detailLessonViewModel =
        Provider.of<DetailLessonViewModel>(context, listen: false);
    detailLessonViewModel.getLessonCourse(widget.courseId);
  }

  @override
  void initState() {
    getLessonDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 150,
                  width: 300,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: widget.modulesimage != ''
                      ? Image.network(
                          "${APIConstant.url}/public/image/${widget.modulesimage ?? ""}")
                      : Image.asset('assets/images/Rectangle 26.png'),
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              Text(
                widget.modulesName ?? "",
                style: blackTextStyle.copyWith(
                    fontWeight: semiBold, fontSize: 14.4, color: Colors.black),
              ),
              const SizedBox(
                height: 18,
              ),
              Text(
                'Pengantar:',
                style: blackTextStyle.copyWith(
                    fontWeight: semiBold, fontSize: 14.4, color: Colors.black),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                widget.modulesDesc ?? "",
                style: blackTextStyle.copyWith(
                    fontWeight: regular, fontSize: 12, color: Colors.black),
              ),
              const SizedBox(
                height: 18,
              ),
              cekPerkondisian(),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget cekPerkondisian() {
    if (widget.listModules?.lastWhere((element) => element.data != null) != null) {
      return ElevatedButton(onPressed: () {}, child: Text('Final Task'));
    }else{
      return Container();
    }
    // for (var i = 0; i < widget.listModules?.where((element) => element.data.id.l); i++) {
      
    // }
  }
}
