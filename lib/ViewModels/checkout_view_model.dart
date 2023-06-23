import 'package:flutter/material.dart';
import 'package:lms_apps/Models/my_course_response.dart';
import 'package:lms_apps/Models/unpaid_checkout_response.dart';
import 'package:lms_apps/Services/checkout_service.dart';

class CheckOutViewModel with ChangeNotifier {
  bool _checkCourse = false;

  bool get checkCourse => _checkCourse;
  //to save checkoutunpaid for comparison id checkout
  List<CheckOut> _temp = [];

  List<CheckOut> get temp => _temp;

  set setTemp(List<CheckOut> checkOutUnpaid) {
    _temp = checkOutUnpaid;
  }

  //to checkoutUnpaid
  List<CheckOut> _checkOutUnpaid = [];

  List<CheckOut> get checkOutUnpaid => _checkOutUnpaid;
  final List<Map<String, String>> _paymentMethod = [
    {'payment': 'Gopay', 'image': 'assets/images/gopay.png'},
    {'payment': 'Dana', 'image': 'assets/images/dana.png'},
    {'payment': 'LinkAja', 'image': 'assets/images/linkaja.png'},
    {'payment': 'PayPal', 'image': 'assets/images/paypal.png'},
  ];

  List<Map<String, String>> get paymentMethod => _paymentMethod;

  int _selectedPayment = 0;

  int get selectedPayment => _selectedPayment;

  set setSelectedPayment(int index) {
    _selectedPayment = index;
    notifyListeners();
  }

  Future<void> checkOut({required String courseId}) async {
    await CheckOutService().checkOut(courseId: courseId);

    notifyListeners();
  }

  Future<void> deleteCheckOut({required String courseId}) async {
    await CheckOutService().deleteCheckOut(courseId: courseId);

    notifyListeners();
  }

  Future<void> verify(
      {required String checkOutId, required String paymentMethod}) async {
    await CheckOutService()
        .checkOutVerify(checkOutId: checkOutId, paymentMethod: paymentMethod);

    notifyListeners();
  }

  Future<void> getUnpaidCheckout() async {
    final checkOutResponse = await CheckOutService().checkOutUnpaid();
    _checkOutUnpaid = checkOutResponse.data;
    notifyListeners();
  }

  Future<void> deleteDuplicatePaid(
      List<CheckOut> temp, List<CheckOut> checkOutUnpaid) async {
    for (int i = 0; i < checkOutUnpaid.length; i++) {
      if (temp[i].id == checkOutUnpaid[i].id) {
        await deleteCheckOut(courseId: checkOutUnpaid[i].id);
      }
    }
  }

  Future<void> hadCourse(String courseName, List<Datum> checkOutUnpaid) async {
    for (int i = 0; i < checkOutUnpaid.length; i++) {
      if (courseName == checkOutUnpaid[i].course!.name) {
        _checkCourse = true;
      } else {
        _checkCourse = false;
      }
    }
    notifyListeners();
    print(_checkCourse);
  }
}
