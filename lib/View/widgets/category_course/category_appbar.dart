import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/search_screen.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';
import 'package:lms_apps/View/widgets/search/search_screen_appbar.dart';
import 'package:lms_apps/ViewModels/category_course_view_model.dart';
import 'package:provider/provider.dart';

class CategoryCourseAppbar extends StatelessWidget {
  final String? search;
  const CategoryCourseAppbar({super.key, this.search});

  @override
  Widget build(BuildContext context) {
    final courseProvider =
        Provider.of<CategoryCourseViewModel>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Stack(children: [
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  courseProvider.resetPage();
                },
                child: const Icon(Icons.arrow_back)),
            Center(
              child: Text(
                'Category',
                style: blackTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 24.0,
                ),
              ),
            ),
          ]),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40.0,
            ),
            child: CustomSearchBar(
              readOnly: true,
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchScreen(),
                  ),
                );
              },
              initialValue: search,
              prefixIcon: Image.asset(
                'assets/icon/ic_search.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
