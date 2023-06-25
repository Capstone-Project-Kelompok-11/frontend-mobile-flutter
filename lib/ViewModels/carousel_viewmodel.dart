import 'package:flutter/material.dart';
import 'package:lms_apps/Models/banner_response.dart';
import 'package:lms_apps/Services/carousel_service.dart';

class CarouselViewModel with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  List<BannerImage> _banners = [];

  List<BannerImage> get banners => _banners;

  int _bannerIndex = 0;

  int get bannerIndex => _bannerIndex;

  set setBannerIndex(int index) {
    _bannerIndex = index;
    notifyListeners();
  }

  void getBanner() async {
    _isLoading = true;
    final response = await CarouselService().getBanner();
    _banners = response.data;
    _isLoading = false;
    notifyListeners();
  }
}
