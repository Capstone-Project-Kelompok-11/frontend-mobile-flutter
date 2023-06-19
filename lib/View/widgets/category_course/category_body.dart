import 'package:flutter/material.dart';

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
        .getCourses(search: widget.search);
  }

  @override
  Widget build(BuildContext context) {
    final courses = Provider.of<CategoryCourseViewModel>(context, listen: true);
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
              scrollDirection: Axis.horizontal,
              itemCount: courses.categories.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
                    //set categories index for category parameter from service
                    courses.setIndex = index;

                    //call function over and over when pressed the button
                    courses.getCourses(search: widget.search);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 16.0),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 12.0,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color:
                            courses.categoryIndex == index ? blueColor : null,
                        border: Border.all(
                          color: courses.categoryIndex == index
                              ? Colors.transparent
                              : blueColor,
                        )),
                    child: Text(
                      courses.categories[index],
                      style: TextStyle(
                        color: courses.categoryIndex == index
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
          courses.isLoading
              ? Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.3),
                  child: const CircularProgressIndicator(),
                )
              : courses.courses.isNotEmpty
                  ? GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: courses.courses.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                        mainAxisExtent: 180.0,
                      ),
                      itemBuilder: (_, index) {
                        return Material(
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: GestureDetector(
                            onTap: () {},
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
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.network(
                                        'https://ik.imagekit.io/mrggsfxta/Voyager_68_v2-keyboard.jpg?updatedAt=1682567212420',
                                        fit: BoxFit.cover,
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
                                          Text(courses.courses[index].name),
                                          const SizedBox(height: 16.0),
                                          Row(children: [
                                            Image.asset(
                                                'assets/icon/ic_star.png'),
                                            const SizedBox(width: 8.0),
                                            Text(
                                                courses.courses[index].rating
                                                    .toString(),
                                                style: blackTextStyle.copyWith(
                                                  fontWeight: small,
                                                )),
                                            const Spacer(),
                                            Text(
                                                Utility.rupiah
                                                    .format(courses
                                                        .courses[index].price)
                                                    .toString(),
                                                style: blueTextStyle.copyWith(
                                                    fontWeight: bold,
                                                    fontSize: 10.0)),
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
                  : Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.3),
                      child: const Text('Data Tidak Ada')),
        ],
      ),
    );
  }
}
