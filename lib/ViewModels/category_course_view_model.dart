import 'package:flutter/material.dart';
import 'package:lms_apps/Models/public_course_response.dart';
import 'package:lms_apps/Services/categories_service.dart';
import 'package:lms_apps/Services/public_course_service.dart';

class CategoryCourseViewModel with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  //loading when load more data
  bool _pageLoading = false;

  bool get pageLoading => _pageLoading;

  //to get categories
  List<String> _categories = [];

  List<String> get categories => _categories;

//to tell the _categoryIndex
  int _categoryIndex = 0;
  int get categoryIndex => _categoryIndex;
  //set index for category
  set setIndex(int index) {
    _categoryIndex = index;
    notifyListeners();
  }

  final int _size = 8;

//TO save the courses data
  List<PublicCourse> _courses = [];

  List<PublicCourse> get courses => _courses;

  int _currentPage = 1;

  int get currentPage => _currentPage;

  void resetPage() {
    _currentPage = 1;
    notifyListeners();
  }

//to get data and save it to the _courses
  void getCourses({String? search, String? category}) async {
    _isLoading = true;

    if (category == 'All') {
      category = '';
    }

    //get the data from response
    final publicCourseResponse = await PublicCourseService().getPublicCourse(
      page: _currentPage,
      search: search ?? '',
      category: category,
      size: _size,
    );

    //assign to the courses
    _courses = publicCourseResponse.data;

    _isLoading = false;

    notifyListeners();
  }

  //to get categories data
  void getCategories() async {
    final categoriesResponse = await CategoriesService().getCategories();
    _categories = ['All', ...categoriesResponse.data];

    notifyListeners();
  }

  // void refreshCourses({String? search}) {
  //   getCourses(search: search);
  //   notifyListeners();
  // }

  void loadMoreCourses(
      {ScrollController? controller, String? category, String? search}) async {
    if (_pageLoading) {
      return null;
    }
    if (controller!.position.pixels == controller.position.maxScrollExtent &&
        controller.position.atEdge) {
      _pageLoading = true;
      notifyListeners();
      _currentPage = _currentPage + 1;

      await Future.delayed(const Duration(seconds: 3));
      final publicCourseResponse = await PublicCourseService().getPublicCourse(
          page: _currentPage,
          search: search ?? '',
          category: category ?? '',
          size: _size);

      _courses = _courses + publicCourseResponse.data;

      _pageLoading = false;
      notifyListeners();
    } else {
      _currentPage = _currentPage;
      notifyListeners();
    }
    notifyListeners();
  }
}
