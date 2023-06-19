import 'package:flutter/material.dart';
import 'package:lms_apps/Models/my_course_response.dart';
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
  const LessonsBody({super.key, required this.courseId, this.listModules, this.modulesName, this.modulesDesc, this.modulesimage});

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
    final _controller = PageController(initialPage: 0);
    final detailLessonViewModel = Provider.of<DetailLessonViewModel>(context);
    List<String> datalesson = [
      'Keterbacaan: Desain antarmuka pengguna harus mudah dibaca dan dipahami oleh pengguna. Ini meliputi penggunaan font yang jelas dan mudah dibaca, tata letak yang jelas dan terorganisir, serta warna yang mudah dibaca dan kontras.',
      'Navigasi yang mudah: Antarmuka pengguna harus memiliki navigasi yang mudah dipahami dan dapat membantu pengguna mencapai tujuan mereka dengan cepat dan efisien.',
      'Konsistensi: Desain antarmuka pengguna harus konsisten dalam seluruh produk digital. Ini termasuk konsistensi dalam tata letak, warna, font, dan interaksi pengguna.',
      'Estetika visual: Antarmuka pengguna harus menarik secara visual dan menunjukkan identitas merek yang jelas. Ini dapat dicapai melalui penggunaan warna, gambar, dan ilustrasi yang menarik.',
      'Responsivitas: Desain antarmuka pengguna harus responsif dan dapat menyesuaikan dengan berbagai ukuran layar, baik di desktop maupun di perangkat mobile.'
    ];
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
                  child: Image.network("${widget.modulesimage ?? ""}"),
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
              // Text(
              //   'Prinsip-prinsip desain antarmuka pengguna:',
              //   style: blackTextStyle.copyWith(
              //       fontWeight: semiBold, fontSize: 14, color: Colors.black),
              // ),
              // const SizedBox(
              //   height: 8,
              // ),
              // ListView.builder(
              //   physics: const NeverScrollableScrollPhysics(),
              //   shrinkWrap: true,
              //   itemCount: datalesson.length,
              //   itemBuilder: (context, index) {
              //     return Row(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           '${index + 1}. ',
              //           style: const TextStyle(height: 1.65),
              //         ),
              //         Expanded(
              //           child: Text(
              //             '${datalesson[index]}',
              //             textAlign: TextAlign.justify,
              //             style: const TextStyle(height: 1.65),
              //           ),
              //           // flex: 6,
              //         ),
              //       ],
              //     );
              //   },
              // ),
              const SizedBox(
                height: 60,
              ),
              // Container(height: 300,
              //   child: ListView.builder(shrinkWrap: true,itemCount: widget.listModules?.length,itemBuilder: (context, index){
              //     return Text(widget.listModules?[index].data?.id ?? "");
              //   },),
              // )
              
            ],
          ),
        ],
      ),
    );
  }
}
