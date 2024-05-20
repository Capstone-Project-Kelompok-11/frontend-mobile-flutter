import 'package:flutter/material.dart';
import 'package:lms_apps/Models/detail_course_response.dart';
import 'package:lms_apps/Models/review_response.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';

import 'package:lms_apps/ViewModels/detail_course_view_model.dart';
import 'package:lms_apps/ViewModels/review_viewmodel.dart';
import 'package:lms_apps/utils/utility.dart';
import 'package:provider/provider.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

class DetailCourseBody extends StatefulWidget {
  final String? courseId;
  const DetailCourseBody({super.key, this.courseId});

  @override
  State<DetailCourseBody> createState() => _DetailCourseBodyState();
}

class _DetailCourseBodyState extends State<DetailCourseBody> {
  @override
  void initState() {
    super.initState();
    Provider.of<DetailCourseViewModel>(context, listen: false)
        .getCourseById(courseId: widget.courseId);
    Provider.of<ReviewViewModel>(context, listen: false)
        .getReviews(courseId: widget.courseId);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //set Index to 0 to make categories index at first category
      Provider.of<DetailCourseViewModel>(context, listen: false).setIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final courseProvider =
        Provider.of<DetailCourseViewModel>(context, listen: true);
    final reviewProvider = Provider.of<ReviewViewModel>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      //if loading is false then return the detail widget, else circular progress indicator
      child: RefreshIndicator(
        onRefresh: () async {
          courseProvider.getCourseById(courseId: widget.courseId);
        },
        child: courseProvider.isLoading == false
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: courseProvider.courseThumbnail.isEmpty ||
                                courseProvider.courseThumbnail == ''
                            ? Container(
                                color: Colors.grey,
                                width: double.infinity,
                                height: 150.0,
                                child: Center(
                                  child: Text('Image Not Available',
                                      style: blackTextStyle.copyWith(
                                        fontSize: 16.0,
                                        fontWeight: regular,
                                      )),
                                ),
                              )
                            : Image.network(
                                fit: BoxFit.cover,
                                courseProvider.courseThumbnail,
                                height: 150.0,
                                width: double.infinity,
                              )),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    courseProvider.courseName,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(children: [
                    Image.asset('assets/icon/ic_star.png'),
                    const SizedBox(width: 6.0),
                    Text(
                      courseProvider.courseRating.toDouble().toString(),
                    ),
                    const Spacer(),
                    // Text(
                    //   Utility.rupiah.format(
                    //     courseProvider.coursePrice,
                    //   ),
                    //   style: blueTextStyle.copyWith(
                    //       fontSize: 14.0, fontWeight: bold),
                    // )
                  ]),
                  const SizedBox(height: 22.0),

                  //overview and lessons button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          courseProvider.setIndex = 0;
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50.0, vertical: 6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: courseProvider.currentIndex == 0
                                ? blueColor
                                : Colors.transparent,
                            border: Border.all(color: blueColor),
                          ),
                          child: Text(
                            'Overview',
                            style: blackTextStyle.copyWith(
                              fontSize: 12.0,
                              color: courseProvider.currentIndex == 0
                                  ? whiteColor
                                  : blueColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      GestureDetector(
                        onTap: () {
                          courseProvider.setIndex = 1;
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50.0, vertical: 6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: courseProvider.currentIndex == 1
                                ? blueColor
                                : Colors.transparent,
                            border: Border.all(color: blueColor),
                          ),
                          child: Text(
                            'Lessons',
                            style: blackTextStyle.copyWith(
                              fontSize: 12.0,
                              color: courseProvider.currentIndex == 1
                                  ? whiteColor
                                  : blueColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),

                  if (courseProvider.currentIndex == 0) ...[
                    //OverView class
                    OverView(
                      description: courseProvider.courseDescription,
                      modulesLength: courseProvider.modulesLength,
                      level: courseProvider.courseLevel,
                      // price: courseProvider.coursePrice,
                      courseRating: courseProvider.courseRating,
                      rating1: courseProvider.reviewRating1,
                      rating2: courseProvider.reviewRating2,
                      rating3: courseProvider.reviewRating3,
                      rating4: courseProvider.reviewRating4,
                      rating5: courseProvider.reviewRating5,
                      ratingN: courseProvider.reviewRatingN,
                      reviews: reviewProvider.reviews,
                    ),
                  ] else ...[
                    Lessons(module: courseProvider.modules)
                  ],

                  const SizedBox(height: 50.0),
                ],
              )
            : Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.35),
                child: const CircularProgressIndicator(),
              ),
      ),
    );
  }
}

class Lessons extends StatelessWidget {
  const Lessons({
    super.key,
    required this.module,
  });

  final List<Module> module;

  @override
  Widget build(BuildContext context) {
    return module.isNotEmpty
        ? ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: module.length,
            itemBuilder: (context, index) {
              return Container(
                width: 300.0,
                height: 50.0,
                margin: index < module.length - 1
                    ? const EdgeInsets.only(bottom: 16.0)
                    : null,
                padding: const EdgeInsets.only(
                  left: 12.0,
                  right: 120.0,
                ),
                decoration: BoxDecoration(
                  border: Border.all(width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    textAlign: TextAlign.start,
                    module[index].data?.name ?? '',
                    style: const TextStyle(
                        fontSize: 12.0, fontWeight: FontWeight.w700),
                  ),
                ),
              );
            },
          )
        : Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.18),
            child: Center(
              child: Text(
                'Modul Belum Tersedia',
                style:
                    blackTextStyle.copyWith(fontSize: 20.0, fontWeight: bold),
              ),
            ),
          );
  }
}

class OverView extends StatelessWidget {
  // final int price;
  final String description;
  final int modulesLength;
  final String level;
  final int courseRating;
  final int rating1;
  final int rating2;
  final int rating3;
  final int rating4;
  final int rating5;
  final int ratingN;
  final List<ReviewData> reviews;
  const OverView({
    super.key,
    required this.description,
    // required this.price,
    required this.modulesLength,
    required this.level,
    required this.rating1,
    required this.rating2,
    required this.rating3,
    required this.rating4,
    required this.rating5,
    required this.ratingN,
    required this.courseRating,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Description
        Text('Description',
            style: blackTextStyle.copyWith(
              fontSize: 12.0,
              fontWeight: bold,
            )),
        const SizedBox(height: 10.0),
        Text(
          description,
          style: blackTextStyle.copyWith(
            fontSize: 10.0,
            fontWeight: regular,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Lesson container
            Container(
              width: 90.0,
              height: 60.0,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
              child: Column(
                children: [
                  Image.asset(
                    'assets/icon/ic_lesson.png',
                    width: 30.0,
                    height: 30.0,
                  ),
                  FittedBox(
                    child: Text(
                      '$modulesLength Lessons',
                      style: blackTextStyle.copyWith(
                          fontSize: 10.0, fontWeight: bold),
                    ),
                  ),
                ],
              ),
            ),

            //Level container
            Container(
              width: 90.0,
              height: 60.0,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
              child: Column(
                children: [
                  Image.asset(
                    'assets/icon/ic_level.png',
                    height: 30.0,
                    width: 30.0,
                  ),
                  FittedBox(
                    child: Text(
                      level,
                      style: blackTextStyle.copyWith(
                        fontSize: 10.0,
                        fontWeight: bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //Language Container
            Container(
              width: 90.0,
              height: 60.0,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
              child: Column(
                children: [
                  Image.asset(
                    'assets/icon/ic_language.png',
                    width: 30.0,
                    height: 30.0,
                  ),
                  FittedBox(
                    child: Text(
                      'Indonesia',
                      style: blackTextStyle.copyWith(
                          fontSize: 10.0, fontWeight: bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20.0),

        // Reviews
        Text(
          'Reviews',
          style: blackTextStyle.copyWith(fontSize: 12.0, fontWeight: bold),
        ),

        const SizedBox(height: 16.0),
        Row(
          children: [
            Text(
              courseRating.toDouble().toString(),
              style: blackTextStyle.copyWith(fontSize: 24.0, fontWeight: bold),
            ),
            const SizedBox(width: 30.0),
            Expanded(
              child: Column(
                children: [
                  reviewBar('5', rating5, ratingN),
                  const SizedBox(height: 12.0),
                  reviewBar('4', rating4, ratingN),
                  const SizedBox(height: 12.0),
                  reviewBar('3', rating3, ratingN),
                  const SizedBox(height: 12.0),
                  reviewBar('2', rating2, ratingN),
                  const SizedBox(height: 12.0),
                  reviewBar('1', rating1, ratingN),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0),

        Text(
          'FeedBack',
          style: blackTextStyle.copyWith(
            fontSize: 12.0,
            fontWeight: bold,
          ),
        ),
        const SizedBox(height: 16.0),
        //reviews
        reviews.isEmpty
            ? SizedBox(
                height: 40.0,
                child: Center(
                  child: Text(
                    'Comments Not Available',
                    style: blackTextStyle.copyWith(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              )
            : ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: reviews.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final review = reviews[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          review.user.image.isEmpty
                              ? const CircleAvatar(
                                  child: Icon(Icons.question_mark,
                                      color: Colors.grey),
                                )
                              : CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(review.user.image),
                                ),
                          const SizedBox(width: 8.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                review.user.name,
                                style: blackTextStyle.copyWith(
                                  fontWeight: bold,
                                ),
                              ),
                              SizedBox(
                                width: 280.0,
                                child: Text(review.comment),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            'assets/icon/ic_star.png',
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            review.rating.toDouble().toString(),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              )
      ],
    );
  }

  Row reviewBar(String ratingText, int rating, int ratingN) {
    return Row(
      children: [
        Text(ratingText),
        const SizedBox(width: 6.0),
        SimpleAnimationProgressBar(
          height: 10.0,
          width: 250.0,
          backgroundColor: const Color(0x666EA8FE),
          foregrondColor: blueColor,
          ratio: rating == 0 || ratingN == 0 ? 0 : rating / ratingN,
          direction: Axis.horizontal,
          curve: Curves.fastLinearToSlowEaseIn,
          duration: const Duration(seconds: 3),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ],
    );
  }
}
