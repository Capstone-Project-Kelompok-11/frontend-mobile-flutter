import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lms_apps/View/screens/certificate_screen.dart';
import 'package:lms_apps/View/screens/lessons_screen.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';
import 'package:lms_apps/ViewModels/my_course_view_model.dart';
import 'package:provider/provider.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

class MyCourseBody extends StatefulWidget {
  // final String courseID;
  const MyCourseBody({
    super.key,
  });

  @override
  State<MyCourseBody> createState() => _MyCourseBodyState();
}

class _MyCourseBodyState extends State<MyCourseBody> {
  @override
  Widget build(BuildContext context) {
    final myCourseViewModel = Provider.of<MyCourseViewModel>(context);
    return TabBarView(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: myCourseViewModel.myCourse.length,
          itemBuilder: (context, index) {
            var myCourse = myCourseViewModel.myCourse[index];
            var module = myCourse.lessonLength?.length;
            var moduleComplete = myCourse.completeModule?.length;
            return moduleComplete == module
                ? Container()
                : Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 31,
                      vertical: 15,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LessonsScreen(
                              courseId: myCourse.course!.id!,
                              listModules: myCourse.lessonLength,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 98,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 74,
                              height: 74,
                              margin: const EdgeInsets.all(13),
                              child: myCourse.course?.thumbnail != ''
                                  ? Image.network(
                                      '${myCourse.course?.thumbnail}',
                                    )
                                  : Image.asset(
                                      'assets/images/img_basic_microsoft_word.png',
                                    ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${myCourse.course?.name}'),
                                const SizedBox(height: 11),
                                Text(
                                    '${moduleComplete ?? 0} / ${module ?? 5} Lesson'),
                                const SizedBox(height: 11),
                                moduleComplete == 0 && module == 0
                                    ? SimpleAnimationProgressBar(
                                        height: 10,
                                        width: 200,
                                        backgroundColor:
                                            const Color(0x666EA8FE),
                                        foregrondColor: Colors.blue,
                                        ratio: 0,
                                        direction: Axis.horizontal,
                                        curve: Curves.fastLinearToSlowEaseIn,
                                        duration: const Duration(seconds: 3),
                                        borderRadius: BorderRadius.circular(10),
                                      )
                                    : SimpleAnimationProgressBar(
                                        height: 10,
                                        width: 200,
                                        backgroundColor:
                                            const Color(0x666EA8FE),
                                        foregrondColor: Colors.blue,
                                        ratio: (moduleComplete ?? 0) /
                                            (module ?? 5),
                                        direction: Axis.horizontal,
                                        curve: Curves.fastLinearToSlowEaseIn,
                                        duration: const Duration(seconds: 3),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
          },
        ),
        myCourseViewModel.isLoading
            ? const Padding(
                padding: EdgeInsets.only(top: 10),
                child: CircularProgressIndicator(strokeWidth: 1),
              )
            : ListView.builder(
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
                            horizontal: 30,
                            vertical: 15,
                          ),
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(width: 0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Container(
                                  height: 74,
                                  width: 74,
                                  margin: const EdgeInsets.all(13),
                                  child: myCourse.course?.thumbnail != ''
                                      ? Image.network(
                                          '${myCourse.course?.thumbnail}',
                                        )
                                      : Image.asset(
                                          'assets/images/img_basic_microsoft_word.png',
                                        ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      right: 10, left: 24),
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
                                          showModalBottomSheet(
                                            isScrollControlled: true,
                                            isDismissible: false,
                                            useSafeArea: true,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                top: Radius.circular(30),
                                              ),
                                            ),
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Padding(
                                                padding: EdgeInsets.only(
                                                  bottom: MediaQuery.of(context)
                                                      .viewInsets
                                                      .bottom,
                                                ),
                                                child: SizedBox(
                                                  height: 460,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      const SizedBox(
                                                        height: 22,
                                                      ),
                                                      Text(
                                                        'Review Course',
                                                        style: blackTextStyle
                                                            .copyWith(
                                                                fontWeight:
                                                                    semiBold,
                                                                fontSize: 24.88,
                                                                color: Colors
                                                                    .black),
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      Text(
                                                        'Rating for Course,',
                                                        style: blackTextStyle
                                                            .copyWith(
                                                                fontWeight:
                                                                    semiBold,
                                                                fontSize: 17.28,
                                                                color: Colors
                                                                    .black),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      RatingBar.builder(
                                                        initialRating: 0,
                                                        minRating: 1,
                                                        direction:
                                                            Axis.horizontal,
                                                        itemCount: 5,
                                                        itemPadding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 4.0,
                                                        ),
                                                        itemBuilder:
                                                            (context, _) =>
                                                                const Icon(
                                                          Icons.star,
                                                          color: Colors.amber,
                                                        ),
                                                        onRatingUpdate:
                                                            (rating) {
                                                          print(rating);
                                                        },
                                                      ),
                                                      const SizedBox(
                                                        height: 22,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 30),
                                                        child: Column(
                                                          children: [
                                                            const Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                    'Write Your Review'),
                                                                Text(
                                                                  ' *',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .red),
                                                                ),
                                                              ],
                                                            ),
                                                            TextField(
                                                              maxLength: 100,
                                                              maxLines: 4,
                                                              decoration:
                                                                  InputDecoration(
                                                                hintMaxLines:
                                                                    100,
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                    8,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 40,
                                                            ),
                                                            Row(
                                                              children: [
                                                                SizedBox(
                                                                  width: 130,
                                                                  height: 34,
                                                                  child:
                                                                      OutlinedButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    style: OutlinedButton
                                                                        .styleFrom(
                                                                      side: const BorderSide(
                                                                          color:
                                                                              Colors.blue),
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        const Text(
                                                                      'Maybe Later',
                                                                    ),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 60,
                                                                ),
                                                                SizedBox(
                                                                  width: 130,
                                                                  height: 34,
                                                                  child:
                                                                      ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                const CertificateScreen(),
                                                                          ));
                                                                    },
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        const Text(
                                                                      'Submit',
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
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
                                              'Get Certificate',
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
              ),
      ],
    );
  }
}
