import 'package:flutter/material.dart';
import 'package:lms_apps/Models/popular_course_response.dart';
import 'package:lms_apps/Services/popular_course_service.dart';

class PopularCourseViewModel with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<PopularCourse> _popularCourses = [];

  List<PopularCourse> get popularCourses => _popularCourses;

  void getPopularCourse() async {
    _isLoading = true;
    final popularCourseResponse =
        await PopularCourseService().getPopularCourse();
    _popularCourses = popularCourseResponse.data;
    _isLoading = false;
    notifyListeners();
  }
}
