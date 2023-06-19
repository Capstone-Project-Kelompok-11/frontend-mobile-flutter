import 'package:flutter/material.dart';
import 'package:lms_apps/Models/public_course_response.dart';
import 'package:lms_apps/Services/categories_service.dart';
import 'package:lms_apps/Services/public_course_service.dart';

class CategoryCourseViewModel with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<String> _categories = [];

  List<String> get categories => _categories;

  int _categoryIndex = 0;
  int get categoryIndex => _categoryIndex;

  //set index for category
  set setIndex(int index) {
    _categoryIndex = index;
    notifyListeners();
  }

//TO save the courses data
  List<Courses> _courses = [];

  List<Courses> get courses => _courses;

//to get data and save it to the _courses
  void getCourses({String? search}) async {
    _isLoading = true;
    await Future.delayed(const Duration(seconds: 3));

    //get the data from response
    final publicCourseResponse = await PublicCourseService()
        .getPublicCourse(search: search ?? '', category: '');
    if (publicCourseResponse.data.isEmpty) {
      _courses = [];
    }

    //assign to the courses
    _courses = publicCourseResponse.data;

    _isLoading = false;
    notifyListeners();
  }

  //to get categories data
  void getCategories() async {
    final categoriesResponse = await CategoriesService().getCategories();
    _categories = categoriesResponse.data;
    notifyListeners();
  }
}
