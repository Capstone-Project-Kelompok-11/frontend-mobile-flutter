import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/detail_course_screen.dart';

import 'package:lms_apps/View/screens/theme/theme.dart';
import 'package:lms_apps/ViewModels/category_course_view_model.dart';
import 'package:lms_apps/utils/utility.dart';

import 'package:provider/provider.dart';

class CategoryCourseBody extends StatefulWidget {
  //get the value from SearchScreen
  final String? search;
  const CategoryCourseBody({super.key, this.search});

  @override
  State<CategoryCourseBody> createState() => _CategoryCourseBodyState();
}

class _CategoryCourseBodyState extends State<CategoryCourseBody> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // executes after build

      //set categoryIndex to 0 to make categories index at first category
      Provider.of<CategoryCourseViewModel>(context, listen: false).setIndex = 0;
    });

    //call categories
    Provider.of<CategoryCourseViewModel>(context, listen: false)
        .getCategories();

    //call get course function from provider/viewmodel
    Provider.of<CategoryCourseViewModel>(context, listen: false)
        .getCourses(search: widget.search, category: '');
  }

  @override
  Widget build(BuildContext context) {
    final courseProvider =
        Provider.of<CategoryCourseViewModel>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: Column(
        children: [
          //custom category bar
          SizedBox(
            height: 34.0,
            width: double.infinity,
            child: ListView.builder(
              clipBehavior: Clip.none,
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: courseProvider.categories.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
                    //set categories index for category parameter from service
                    courseProvider.setIndex = index;
                    courseProvider.resetPage();
                    //call function over and over when pressed the button
                    courseProvider.getCourses(
                      search: widget.search,
                      category: courseProvider
                          .categories[courseProvider.categoryIndex],
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 16.0),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 12.0,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: courseProvider.categoryIndex == index
                            ? blueColor
                            : null,
                        border: Border.all(
                          color: courseProvider.categoryIndex == index
                              ? Colors.transparent
                              : blueColor,
                        )),
                    child: Text(
                      courseProvider.categories[index],
                      style: TextStyle(
                        color: courseProvider.categoryIndex == index
                            ? whiteColor
                            : blueColor,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 30.0),

          //check if loading true, return Circular loading, else data
          courseProvider.isLoading
              ? Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.3,
                  ),
                  child: const Center(child: CircularProgressIndicator()),
                )
              : courseProvider.courses.isNotEmpty
                  ? SizedBox(
                      child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: courseProvider.pageLoading
                              ? courseProvider.courses.length + 1
                              : courseProvider.courses.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16.0,
                            mainAxisSpacing: 16.0,
                            mainAxisExtent: 180.0,
                          ),
                          itemBuilder: (_, index) {
                            if (index < courseProvider.courses.length) {
                              return Material(
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
                                                courseId: courseProvider
                                                    .courses[index].id),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 140.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 110.0,
                                          width: double.infinity,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: courseProvider.courses[index]
                                                    .thumbnail.isNotEmpty
                                                ? Image.network(
                                                    courseProvider
                                                        .courses[index]
                                                        .thumbnail,
                                                    fit: BoxFit.cover,
                                                  )
                                                : Container(
                                                    color: Colors.grey,
                                                    child: Center(
                                                      child: Text(
                                                        'Image Belum Tersedia',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: blackTextStyle
                                                            .copyWith(
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    regular),
                                                      ),
                                                    ),
                                                  ),
                                          ),
                                        ),
                                        const SizedBox(height: 8.0),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4.0),
                                          child: SizedBox(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  courseProvider
                                                      .courses[index].name,
                                                  style:
                                                      blackTextStyle.copyWith(
                                                          fontWeight: bold,
                                                          fontSize: 12.0),
                                                ),
                                                const SizedBox(height: 16.0),
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                        'assets/icon/ic_star.png'),
                                                    const SizedBox(width: 8.0),
                                                    Text(
                                                        courseProvider
                                                            .courses[index]
                                                            .rating
                                                            .toString(),
                                                        style: blackTextStyle
                                                            .copyWith(
                                                          fontWeight: small,
                                                        )),
                                                    const Spacer(),
                                                    Text(
                                                        Utility.rupiah.format(
                                                            courseProvider
                                                                .courses[index]
                                                                .price),
                                                        style: blueTextStyle
                                                            .copyWith(
                                                                fontWeight:
                                                                    bold,
                                                                fontSize:
                                                                    10.0)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                            return null;
                          }),
                    )
                  : Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.28),
                      child: Text(
                        'Course Tidak Tersedia',
                        style: blackTextStyle.copyWith(
                            fontSize: 16.0, fontWeight: bold),
                      ),
                    ),
        ],
      ),
    );
  }
}
