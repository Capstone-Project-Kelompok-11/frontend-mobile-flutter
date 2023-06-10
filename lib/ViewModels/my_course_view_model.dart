import 'package:flutter/material.dart';
import 'package:lms_apps/Models/detail_course_response.dart';
import 'package:lms_apps/Models/my_course_response.dart';
import 'package:lms_apps/Services/my_course_service.dart';

class MyCourseViewModel with ChangeNotifier {
  List<Datum> _myCourse = [];
  List<Datum> get myCourse => _myCourse;

  DetailCourseResponse _course = DetailCourseResponse();
  DetailCourseResponse get course => _course;

  DetailCourseResponseData _complete = DetailCourseResponseData();
  DetailCourseResponseData get complete => _complete;

  void getMyCourseProgress() async {
    final result = await MyCourseOnProgressService().getMyCourse();

    if (result.data!.isNotEmpty) {
      _myCourse = result.data!;
      notifyListeners();
    } else {
      _myCourse = [];
    }
  }

  void getMyCourseProgressByID(String courseID) async {
    _course = await MyCourseOnProgressService().getMyCourseByID(courseID);
    notifyListeners();
  }

  void getMyCourseComplete(String courseID) async {
    _complete = await MyCourseCompleteService().getMyCourseComplete(courseID);
    notifyListeners();
  }
}
