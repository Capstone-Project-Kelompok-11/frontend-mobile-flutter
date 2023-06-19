import 'package:flutter/material.dart';
import 'package:lms_apps/Models/my_course_response.dart';
import 'package:lms_apps/Services/detail_course_service.dart';

import '../Models/detail_course_response.dart';

class DetailLessonViewModel with ChangeNotifier{

  DetailCourseResponse _lesson = DetailCourseResponse();
  DetailCourseResponse get Lesson => _lesson;

  
  List<DetailCourseResponse> _module = [];
  List<DetailCourseResponse> get module => _module;
  
  Future<DetailCourseResponse>getLessonCourse (String courseId) async {
  _lesson = await DetailLessonService().getLessonCourse(courseId);
  print('hello${_lesson.data?.id}');
  notifyListeners();
  return _lesson;
  } 
}