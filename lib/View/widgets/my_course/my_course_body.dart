import 'package:flutter/material.dart';
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
                            onTap: () {},
                            child: Container(
                              width: double.infinity,
                              height: 34,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
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
        ),
      ],
    );
  }
}
