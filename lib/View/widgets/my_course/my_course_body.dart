import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lms_apps/View/screens/certificate_screen.dart';
import 'package:lms_apps/View/screens/lessons_screen.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

class MyCourseBody extends StatelessWidget {
  const MyCourseBody({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        ListView.builder(
          itemCount: 15,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 31, vertical: 15),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LessonsScreen(),
                      ));
                },
                child: Container(
                  height: 98,
                  // margin: const EdgeInsets.symmetric(vertical: 15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.grey,
                      border: Border.all(
                        color: Colors.grey,
                      )),
                  child: Row(
                    children: [
                      Container(
                        width: 74,
                        height: 74,
                        margin: const EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('UI/UX'),
                          const SizedBox(height: 11),
                          const Text('4 / 5 Lesson'),
                          const SizedBox(height: 11),
                          SimpleAnimationProgressBar(
                            height: 8,
                            width: 181,
                            backgroundColor: const Color(0x666EA8FE),
                            foregrondColor: Colors.blue,
                            ratio: 4 / 5,
                            direction: Axis.horizontal,
                            curve: Curves.fastLinearToSlowEaseIn,
                            duration: const Duration(seconds: 3),
                            borderRadius: BorderRadius.circular(10),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
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
                      child: Image.asset(
                          'assets/images/img_basic_microsoft_word.png'),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(right: 10, left: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 104,
                                child: Text(
                                  'Basic Microsoft Word',
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
                                child: index % 2 == 0
                                    ? Text(
                                        'Completed',
                                        style: greenTextStyle.copyWith(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        textAlign: TextAlign.end,
                                      )
                                    : Text(
                                        'Not Complete',
                                        style: redTextStyle.copyWith(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        textAlign: TextAlign.end,
                                      ),
                              ),
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
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(30))),
                                context: context,
                                builder: (BuildContext context) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom),
                                    child: SizedBox(
                                      height: 460,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            height: 22,
                                          ),
                                          Text(
                                            'Review Course',
                                            style: blackTextStyle.copyWith(
                                                fontWeight: semiBold,
                                                fontSize: 24.88,
                                                color: Colors.black),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'Rating for Course,',
                                            style: blackTextStyle.copyWith(
                                                fontWeight: semiBold,
                                                fontSize: 17.28,
                                                color: Colors.black),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          RatingBar.builder(
                                            initialRating: 0,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            itemCount: 5,
                                            itemPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 4.0),
                                            itemBuilder: (context, _) =>
                                                const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          ),
                                          const SizedBox(
                                            height: 22,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30),
                                            child: Column(
                                              children: [
                                                const Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text('Write Your Review'),
                                                    Text(
                                                      ' *',
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                  ],
                                                ),
                                                TextField(
                                                  maxLength: 100,
                                                  maxLines: 4,
                                                  decoration: InputDecoration(
                                                    hintMaxLines: 100,
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
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
                                                      child: OutlinedButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        style: OutlinedButton
                                                            .styleFrom(
                                                          side:
                                                              const BorderSide(
                                                                  color: Colors
                                                                      .blue),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                        ),
                                                        child: const Text(
                                                            'Maybe Later'),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 60,
                                                    ),
                                                    SizedBox(
                                                      width: 130,
                                                      height: 34,
                                                      child: ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const CertificateScreen(),
                                                              ));
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                        ),
                                                        child: const Text(
                                                            'Submit'),
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
                                  borderRadius: BorderRadius.circular(8),
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
