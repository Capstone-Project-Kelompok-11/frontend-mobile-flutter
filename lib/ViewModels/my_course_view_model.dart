import 'package:flutter/material.dart';
import 'package:lms_apps/Models/detail_course_response.dart';
import 'package:lms_apps/Models/my_course_response.dart';
import 'package:lms_apps/Services/my_course_service.dart';

class MyCourseViewModel with ChangeNotifier {
  List<Datum> _myCourse = [];
  List<Datum> get myCourse => _myCourse;

  List<Datum> _myNewCourse = [];
  List<Datum> get myNewCourse => _myNewCourse;

  List<DetailCourseResponse> _module = [];
  List<DetailCourseResponse> get module => _module;

  var _totalComplete = [];
  get totalComplete => _totalComplete;

  DetailCourseResponse _course = DetailCourseResponse();
  DetailCourseResponse get course => _course;

  List<DetailCourseResponse> _listDetailCourse = [];
  List<DetailCourseResponse> get listDetailCourse => _listDetailCourse;

  DetailCourseResponseData _complete = DetailCourseResponseData();
  DetailCourseResponseData get complete => _complete;

  void getMyCourseProgress() async {
    final result = await MyCourseOnProgressService().getMyCourse();

    if (result.data!.isNotEmpty) {
      _myCourse = result.data!;
      for (var index = 0; index < _myCourse.length; index++) {
        final detailCourseByID =
            await getMyCourseProgressByID(_myCourse[index].course?.id ?? "");
        _listDetailCourse.add(detailCourseByID);
      }

      for (var i = 0; i < _listDetailCourse.length; i++) {
        _myCourse.forEach((element) {
          if (element.course?.id == _listDetailCourse[i].data?.id.toString()) {
            element.lessonLength = _listDetailCourse[i].data?.modules;
            element.completeModule = element.lessonLength
                ?.where((element) => element.completion == true)
                .toList();
          }
        });
      }

      _myNewCourse = _myCourse;
    } else {
      _myCourse = [];
    }
    notifyListeners();
  }

  Future<DetailCourseResponse> getMyCourseProgressByID(String courseID) async {
    _course = await MyCourseOnProgressService().getMyCourseByID(courseID);
    notifyListeners();
    return _course;
  }

  void getMyCourseComplete(String courseID) async {
    _complete = await MyCourseCompleteService().getMyCourseComplete(courseID);
    notifyListeners();
  }
}
