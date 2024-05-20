import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lms_apps/Services/constant.dart';
import 'package:lms_apps/View/screens/category_course_screen.dart';
import 'package:lms_apps/View/screens/detail_course_screen.dart';
import 'package:lms_apps/View/screens/lessons_screen.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';
import 'package:lms_apps/ViewModels/carousel_viewmodel.dart';
import 'package:lms_apps/ViewModels/category_course_view_model.dart';
import 'package:lms_apps/ViewModels/my_course_view_model.dart';
import 'package:lms_apps/ViewModels/popular_course_view_model.dart';
import 'package:lms_apps/utils/utility.dart';
import 'package:provider/provider.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

import '../../../ViewModels/edit_profile_view_model.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  CarouselController buttonCarouselController = CarouselController();
  @override
  void initState() {
    super.initState();
    //call get course function from provider/viewmodel
    Provider.of<PopularCourseViewModel>(context, listen: false)
        .getPopularCourse();
    Provider.of<CarouselViewModel>(context, listen: false).getBanner();

    Provider.of<MyCourseViewModel>(context, listen: false)
        .getMyCourseProgress();
  }

  @override
  Widget build(BuildContext context) {
    final userInfoProvider =
        Provider.of<EditProfileViewModel>(context, listen: true);
    final popularCourseProvider =
        Provider.of<PopularCourseViewModel>(context, listen: true);
    final bannerProvider =
        Provider.of<CarouselViewModel>(context, listen: true);
    final categoriesProvider =
        Provider.of<CategoryCourseViewModel>(context, listen: true);
    final myCourseProvider =
        Provider.of<MyCourseViewModel>(context, listen: true);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          //Carousel Slider
          bannerProvider.isLoading
              ? const CircularProgressIndicator()
              : bannerProvider.banners.isEmpty
                  ? SizedBox(
                      height: 100.0,
                      child: Center(
                        child: Text(
                          'Banners Not Available',
                          style: blackTextStyle.copyWith(
                            fontSize: 16.0,
                            fontWeight: bold,
                          ),
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        CarouselSlider.builder(
                          itemCount: bannerProvider.banners.length,
                          itemBuilder: (context, itemIndex, _) {
                            final banners = bannerProvider.banners[itemIndex];
                            //check if banner images is empty
                            return banners.src.isEmpty || banners.src == ''
                                ? Container(
                                    width: 260.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        10.0,
                                      ),
                                      color: Colors.grey,
                                    ),
                                    child: Center(
                                        child: Text('Image Not Available',
                                            style: blackTextStyle.copyWith(
                                                fontSize: 16.0,
                                                fontWeight: bold))))
                                : Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        10.0,
                                      ),
                                    ),
                                    width: 260.0,
                                    height: 100.0,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.network(
                                        "${APIConstant.url}/${banners.src}",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                          },
                          options: CarouselOptions(
                              height: 100.0,
                              clipBehavior: Clip.none,
                              autoPlay: true,
                              onPageChanged: (index, _) {
                                bannerProvider.setBannerIndex = index;
                              }),
                        ),
                      ],
                    ),
          const SizedBox(height: 8.0),

          // CarouselIndicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: bannerProvider.banners.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () {},
                child: Container(
                  width: 15.0,
                  height: 15.0,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 4.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: bannerProvider.bannerIndex == entry.key
                        ? blueColor
                        : const Color(0xFFD9D9D9),
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 16.0),

          //Category Boxes
          SizedBox(
            height: 100.0,
            child: ListView.builder(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: categoriesProvider.categoryList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                                'Selamat Datang, ${userInfoProvider.name ?? 'Guest'}'),
                            content: Text(categoriesProvider.categoryList[index]
                                    ['description'] ??
                                ''),
                            actions: <Widget>[
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle:
                                      Theme.of(context).textTheme.labelLarge,
                                ),
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                          // var snackBar = SnackBar(
                          //   content: Text(categoriesProvider.categoryList[index]
                          //           ['description'] ??
                          //       ''),
                          // );
                          // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(14.0),
                      margin: index < categoriesProvider.categoryList.length - 1
                          ? const EdgeInsets.only(right: 16.0)
                          : null,
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
                          Image.asset(categoriesProvider.categoryList[index]
                                  ['image'] ??
                              ''),
                          FittedBox(
                            child: Text(categoriesProvider.categoryList[index]
                                    ['category'] ??
                                ''),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
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
                      //navigate to Category Course Screen without search parameter
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
              popularCourseProvider.isLoading
                  ? const SizedBox(
                      height: 180.0,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : SizedBox(
                      height: 180.0,

                      //check if popular couse is empty
                      child: popularCourseProvider.popularCourses.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              clipBehavior: Clip.none,
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  popularCourseProvider.popularCourses.length,
                              itemBuilder: (context, index) {
                                final popularCourses =
                                    popularCourseProvider.popularCourses[index];
                                return Padding(
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: Material(
                                    elevation: 2.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DetailCourseScreen(
                                                    courseId:
                                                        popularCourses.id),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: 140.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Column(
                                          children: [
                                            //check if thumbnail is empty
                                            popularCourses.thumbnail.isEmpty ||
                                                    popularCourses.thumbnail ==
                                                        ''
                                                ? Container(
                                                    height: 110.0,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        color: Colors.grey),
                                                    child: Center(
                                                      child: Text(
                                                        'Image Not Available',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: blackTextStyle
                                                            .copyWith(
                                                          fontWeight: bold,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : SizedBox(
                                                    height: 110.0,
                                                    width: double.infinity,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      child: Image.network(
                                                        // aku gak ngubah bagian ini
                                                        "${APIConstant.url}/${popularCourses.thumbnail}",
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
                                                    Text(popularCourses.name,
                                                        style: blackTextStyle
                                                            .copyWith(
                                                          fontSize: 12.0,
                                                          fontWeight: bold,
                                                        )),
                                                    const SizedBox(
                                                        height: 16.0),
                                                    Row(children: [
                                                      Image.asset(
                                                          'assets/icon/ic_star.png'),
                                                      const SizedBox(
                                                          width: 8.0),
                                                      Text(
                                                        popularCourses.rating
                                                            .toDouble()
                                                            .toString(),
                                                        style: blackTextStyle
                                                            .copyWith(
                                                                fontSize: 10.0),
                                                      ),
                                                      const Spacer(),
                                                      // SizedBox(
                                                      //   width: 60.0,
                                                      //   child: FittedBox(
                                                      //     child: Text(
                                                      //       Utility.rupiah.format(
                                                      //           popularCourses
                                                      //               .price),
                                                      //       style: TextStyle(
                                                      //         color: blueColor,
                                                      //       ),
                                                      //     ),
                                                      //   ),
                                                      // ),
                                                    ])
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )
                          : Center(
                              child: Text(
                                'Course Not Available',
                                style: blackTextStyle.copyWith(
                                  fontSize: 16.0,
                                  fontWeight: bold,
                                ),
                              ),
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

              //Show My Course

              myCourseProvider.isLoading
                  ? const SizedBox(
                      height: 100.0,
                      child: Center(child: CircularProgressIndicator()))
                  : myCourseProvider.myCourse.isEmpty
                      ? SizedBox(
                          height: 100.0,
                          child: Center(
                            child: Text(
                              'No Enrolled Course',
                              style: blackTextStyle.copyWith(
                                fontSize: 16.0,
                                fontWeight: bold,
                              ),
                            ),
                          ),
                        )
                      : ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: myCourseProvider.myCourse.length,
                          itemBuilder: (context, index) {
                            final module = myCourseProvider
                                .myCourse[index].lessonLength?.length;
                            final moduleComplete = myCourseProvider
                                .myCourse[index].completeModule?.length;

                            final myCourses =
                                myCourseProvider.myCourse[index].course;
                            final modules =
                                myCourseProvider.myCourse[index].lessonLength;
                            /*check if module == module complete then return empty container
                                (when module is completed it won't show)*/
                            return module == moduleComplete
                                ? Container()
                                : GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LessonsScreen(
                                            courseId: myCourses.id ?? '',
                                            listModules: modules,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      margin:
                                          const EdgeInsets.only(bottom: 32.0),
                                      padding: const EdgeInsets.all(16.0),
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 0.3),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 80.0,
                                            height: 80.0,
                                            decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),

                                            //check if thumbnail is not empty
                                            child: myCourses!
                                                        .thumbnail!.isEmpty ||
                                                    myCourses.thumbnail == ''
                                                ? Center(
                                                    child: Text(
                                                      'Image Not Available',
                                                      style: blackTextStyle
                                                          .copyWith(
                                                              fontSize: 10.0,
                                                              fontWeight: bold),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  )
                                                : ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    child: Image.network(
                                                        myCourses.thumbnail !=
                                                                ''
                                                            ? "${APIConstant.url}/${myCourses.thumbnail}"
                                                            : '',
                                                        fit: BoxFit.cover),
                                                  ),
                                          ),
                                          const SizedBox(width: 16.0),
                                          SizedBox(
                                            height: 80.0,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  myCourses.name ?? '',
                                                  style:
                                                      blackTextStyle.copyWith(
                                                          fontSize: 12.0,
                                                          fontWeight: bold),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      '$moduleComplete / $module',
                                                      style: const TextStyle(
                                                        fontSize: 10.0,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 8.0),
                                                    SimpleAnimationProgressBar(
                                                      height: 8,
                                                      width: 200,
                                                      backgroundColor:
                                                          const Color(
                                                              0x666EA8FE),
                                                      foregrondColor: blueColor,
                                                      ratio: module == 0 &&
                                                              moduleComplete ==
                                                                  0
                                                          ? 0
                                                          : ((moduleComplete ??
                                                                  0) /
                                                              (module ?? 0)),
                                                      direction:
                                                          Axis.horizontal,
                                                      curve: Curves
                                                          .fastLinearToSlowEaseIn,
                                                      duration: const Duration(
                                                          seconds: 3),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
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
