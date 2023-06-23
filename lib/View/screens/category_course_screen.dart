import 'package:flutter/material.dart';
import 'package:lms_apps/View/widgets/category_course/category_appbar.dart';
import 'package:lms_apps/View/widgets/category_course/category_body.dart';
import 'package:lms_apps/ViewModels/category_course_view_model.dart';
import 'package:provider/provider.dart';

class CategoryCourseScreen extends StatefulWidget {
  final String? search;
  const CategoryCourseScreen({super.key, this.search});

  @override
  State<CategoryCourseScreen> createState() => _CategoryCourseScreenState();
}

class _CategoryCourseScreenState extends State<CategoryCourseScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    final courseProvider =
        Provider.of<CategoryCourseViewModel>(context, listen: false);
    super.initState();
    _scrollController.addListener(() {
      courseProvider.loadMoreCourses(
          controller: _scrollController, search: widget.search, category: '');
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final courseProvider =
        Provider.of<CategoryCourseViewModel>(context, listen: true);
    return Scaffold(
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              courseProvider.getCourses(
                  search: widget.search,
                  category:
                      courseProvider.categories[courseProvider.categoryIndex]);
              courseProvider.resetPage();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ScrollConfiguration(
                behavior: const ScrollBehavior().copyWith(overscroll: false),
                child: ListView(
                  controller: _scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  clipBehavior: Clip.none,
                  children: [
                    CategoryCourseAppbar(search: widget.search),
                    const SizedBox(height: 16.0),
                    CategoryCourseBody(search: widget.search),
                  ],
                ),
              ),
            ),
          ),
        ));
        // floatingActionButton: courseProvider.listCheck
        //     ? courseProvider.pageLoading
        //         ? const CircularProgressIndicator()
        //         : null
        //     : const Text('No More Data'),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
