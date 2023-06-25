import 'package:flutter/material.dart';
import 'package:lms_apps/Models/detail_course_response.dart';
import 'package:lms_apps/Services/public_course_service.dart';

class DetailCourseViewModel with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  //get course name
  String _courseName = '';

  String get courseName => _courseName;

  //get course description
  String _courseDescription = '';

  String get courseDescription => _courseDescription;

  //get course price
  int _coursePrice = 0;

  int get coursePrice => _coursePrice;

  //get course rating
  int _courseRating = 0;

  int get courseRating => _courseRating;

  //get course modules
  List<Module> _modules = [];

  List<Module> get modules => _modules;

  //get modules length
  int _modulesLength = 0;

  int get modulesLength => _modulesLength;

  //get level course
  String _courseLevel = '';

  String get courseLevel => _courseLevel;

  //get course thumbnail
  String _courseThumbnail = '';

  String get courseThumbnail => _courseThumbnail;

  //get course id
  String _courseId = '';

  String get courseId => _courseId;

  //get rating
  int _reviewRating1 = 0;

  int get reviewRating1 => _reviewRating1;

  int _reviewRating2 = 0;

  int get reviewRating2 => _reviewRating2;

  int _reviewRating3 = 0;

  int get reviewRating3 => _reviewRating3;

  int _reviewRating4 = 0;

  int get reviewRating4 => _reviewRating4;

  int _reviewRating5 = 0;

  int get reviewRating5 => _reviewRating5;

  int _reviewRatingN = 0;

  int get reviewRatingN => _reviewRatingN;

  void getCourseById({String? courseId}) async {
    _isLoading = true;
    await Future.delayed(const Duration(seconds: 1));

    final detailCourseResponse =
        await PublicCourseService().getCourseById(courseId: courseId);
    _courseName = detailCourseResponse.data?.name ?? '';
    _courseRating = detailCourseResponse.data?.rating ?? 0;
    _coursePrice = detailCourseResponse.data?.price ?? 0;
    _courseDescription = detailCourseResponse.data?.description ?? '';
    _modules = detailCourseResponse.data?.modules ?? [];
    _modulesLength = _modules.length;
    _courseLevel = detailCourseResponse.data?.level ?? '';
    _courseThumbnail = detailCourseResponse.data?.thumbnail ?? '';
    _courseId = detailCourseResponse.data?.id ?? '';
    _reviewRating1 = detailCourseResponse.data?.rating1 ?? 0;
    _reviewRating2 = detailCourseResponse.data?.rating2 ?? 0;
    _reviewRating3 = detailCourseResponse.data?.rating3 ?? 0;
    _reviewRating4 = detailCourseResponse.data?.rating4 ?? 0;
    _reviewRating5 = detailCourseResponse.data?.rating5 ?? 0;
    _reviewRatingN = detailCourseResponse.data?.ratingN ?? 0;
    _isLoading = false;

    notifyListeners();
  }
  
  void refreshDetail({String? courseId}) {
    getCourseById(courseId: courseId);
    notifyListeners();
  }
}
