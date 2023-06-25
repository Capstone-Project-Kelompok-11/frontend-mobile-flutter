import 'package:flutter/material.dart';
import 'package:lms_apps/Models/review_response.dart';
import 'package:lms_apps/Services/review_service.dart';

class ReviewViewModel with ChangeNotifier {
  List<ReviewData> _reviews = [];

  List<ReviewData> get reviews => _reviews;
  //initial review
  void getReviews({String? courseId}) async {
    final response = await ReviewService().getReviews(courseId: courseId);
    _reviews = response.data;
    notifyListeners();
  }
}
