import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/category_course_screen.dart';
import 'package:lms_apps/View/screens/detail_course_screen.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';
import 'package:lms_apps/ViewModels/carousel_viewmodel.dart';
import 'package:lms_apps/ViewModels/popular_course_view_model.dart';
import 'package:lms_apps/utils/utility.dart';
import 'package:provider/provider.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    super.initState();
    //call get course function from provider/viewmodel
    Provider.of<PopularCourseViewModel>(context, listen: false)
        .getPopularCourse();
    Provider.of<CarouselViewModel>(context, listen: false).getBanner();
  }

  final CarouselController _controller = CarouselController();
  int setIndex = 0;

  @override
  Widget build(BuildContext context) {
    final popularCourse =
        Provider.of<PopularCourseViewModel>(context, listen: true);
    final banner = Provider.of<CarouselViewModel>(context, listen: true);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          //Carousel Slider
          Column(
            children: [
              CarouselSlider.builder(
                carouselController: _controller,
                itemCount: banner.banners.length,
                itemBuilder: (context, itemIndex, _) {
                  return Container(
                    child: Image.network(banner.banners[itemIndex].src),
                  );
                },
                options: CarouselOptions(
                  height: 100.0,
                  clipBehavior: Clip.none,
                  autoPlay: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),

          //Carousel Indicator
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: carouselBoxes.asMap().entries.map((entry) {
          //     return GestureDetector(
          //       onTap: () => _controller.animateToPage(entry.key),
          //       child: Container(
          //         width: 15.0,
          //         height: 15.0,
          //         margin: const EdgeInsets.symmetric(
          //           horizontal: 4.0,
          //         ),
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(8),
          //           color: (Theme.of(context).brightness == Brightness.light
          //                   ? Colors.black
          //                   : Colors.black)
          //               .withOpacity(setIndex == entry.key ? 0.9 : 0.4),
          //         ),
          //       ),
          //     );
          //   }).toList(),
          // ),

          const SizedBox(height: 16.0),

          //Category Boxes
          SizedBox(
            height: 100.0,
            child: ListView.builder(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(14.0),
                  margin: const EdgeInsets.only(right: 16.0),
                  width: 80.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      width: 0.7,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 46.0,
                        height: 46.0,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      const Text('Test')
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16.0),

          //Popular Course
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Course',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CategoryCourseScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'View All',
                      style: TextStyle(
                          color: blueColor, fontSize: 18.0, fontWeight: small),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              popularCourse.isLoading
                  ? const SizedBox(
                      height: 180.0,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DetailCourseScreen(),
                          ),
                        );
                      },
                      child: SizedBox(
                        height: 180.0,
                        child: popularCourse.popularCourses.isNotEmpty
                            ? ListView.builder(
                                shrinkWrap: true,
                                clipBehavior: Clip.none,
                                scrollDirection: Axis.horizontal,
                                itemCount: popularCourse.popularCourses.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: Material(
                                      elevation: 2.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Container(
                                        width: 140.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 110.0,
                                              width: double.infinity,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                child: Image.network(
                                                  popularCourse
                                                      .popularCourses[index]
                                                      .thumbnail,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 8.0),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4.0),
                                              child: SizedBox(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(popularCourse
                                                        .popularCourses[index]
                                                        .name),
                                                    const SizedBox(
                                                        height: 16.0),
                                                    Row(children: [
                                                      Image.asset(
                                                          'assets/icon/ic_star.png'),
                                                      const SizedBox(
                                                          width: 8.0),
                                                      Text(popularCourse
                                                          .popularCourses[index]
                                                          .rating
                                                          .toString()),
                                                      const Spacer(),
                                                      SizedBox(
                                                        width: 60.0,
                                                        child: FittedBox(
                                                          child: Text(
                                                            Utility.rupiah.format(
                                                                popularCourse
                                                                    .popularCourses[
                                                                        index]
                                                                    .price),
                                                            style: TextStyle(
                                                              color: blueColor,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ])
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )
                            : const Center(child: Text('No Popular Courses')),
                      ),
                    ),
            ],
          ),
          const SizedBox(height: 16.0),

          //Continue Course
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Continue Course',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: bold,
                    ),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                        color: blueColor, fontSize: 18.0, fontWeight: small),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 32.0),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.3),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        SizedBox(
                          height: 80.0,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                'Test',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12.0,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Text(
                                    '4 / 5 Lessons',
                                    style: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  SimpleAnimationProgressBar(
                                    height: 8,
                                    width: 200,
                                    backgroundColor: const Color(0x666EA8FE),
                                    foregrondColor: blueColor,
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
                      ],
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
