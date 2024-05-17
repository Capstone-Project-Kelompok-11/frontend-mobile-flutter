import 'package:flutter/material.dart';
import 'package:lms_apps/Services/constant.dart';
import 'package:lms_apps/View/screens/certificate_screen.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';
import 'package:lms_apps/ViewModels/my_course_view_model.dart';
import 'package:provider/provider.dart';

class MyCertificateBody extends StatefulWidget {
  const MyCertificateBody({super.key});

  @override
  State<MyCertificateBody> createState() => _MyCertificateBodyState();
}

class _MyCertificateBodyState extends State<MyCertificateBody> {
  @override
  void initState() {
    Provider.of<MyCourseViewModel>(context, listen: false)
        .getMyCourseProgress();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final myCourseViewModel = Provider.of<MyCourseViewModel>(context);
    return myCourseViewModel.isLoading
        ? Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.only(top: 10),
            child: const CircularProgressIndicator(),
          )
        : ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: myCourseViewModel.myCourse.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var myCourse = myCourseViewModel.myCourse[index];
              var module = myCourse.lessonLength?.length;
              var moduleComplete = myCourse.completeModule?.length;
              return moduleComplete != module
                  ? Container()
                  : Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      height: 100,
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.5),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: SizedBox(
                              height: 74,
                              width: 74,
                              child: myCourse.course?.thumbnail != ''
                                  ? Image.network(
                                      myCourse.course?.thumbnail != ""
                                          ? "${APIConstant.url}/${myCourse.course?.thumbnail}"
                                          : "",
                                    )
                                  : Image.asset(
                                      'assets/images/img_basic_microsoft_word.png',
                                    ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding:
                                  const EdgeInsets.only(right: 10, left: 24),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        width: 104,
                                        child: Text(
                                          '${myCourse.course?.name}',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: blackTextStyle.copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                      SizedBox(
                                          width: 104,
                                          child: Text(
                                            'Completed',
                                            style: greenTextStyle.copyWith(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            textAlign: TextAlign.end,
                                          )),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const CertificateScreen(),
                                          ));
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 34,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.blue),
                                      child: Center(
                                        child: Text(
                                          'See Certificate',
                                          style: whiteTextStyle,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
            },
          );
  }
}
