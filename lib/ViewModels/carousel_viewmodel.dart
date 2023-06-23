import 'package:flutter/material.dart';
import 'package:lms_apps/Models/banner_response.dart';
import 'package:lms_apps/Services/carousel_service.dart';


class CarouselViewModel with ChangeNotifier {
  List<BannerImage> _banners = [];

  List<BannerImage> get banners => _banners;

  List<Widget> carouselBoxes = [
    Container(
      width: 260,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    Container(
        width: 260,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10.0),
        )),
    Container(
        width: 260,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10.0),
        )),
    Container(
        width: 260,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10.0),
        )),
  ];
  void getBanner() async {
    final response = await CarouselService().getBanner();
    _banners = response.data;
    print(_banners[0].src);
  }
}
