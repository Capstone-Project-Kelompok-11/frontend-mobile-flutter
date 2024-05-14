import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:lms_apps/Models/public_course_response.dart';
import 'package:lms_apps/Services/categories_service.dart';
import 'package:lms_apps/Services/public_course_service.dart';

class CategoryCourseViewModel with ChangeNotifier {
  final List<Map<String, String>> _categoryList = [
    {
      'category': 'TI',
      'image': 'assets/images/ti.png',
      'description':
          'Teknik Informatika adalah jurusan yang condong membahas dan mengulas berbagai teknologi komputer. Maksudnya bagaimana? Ya, mulai dari prinsip-prinsip ilmu komputer, analisa matematis, evaluasi sistem operasi, hingga software development atau pengembangan perangkat lunak.'
    },
    {
      'category': 'SI',
      'image': 'assets/images/si.png',
      'description':
          'Sistem informasi adalah suatu sistem di dalam suatu organisasi yang mempertemukan kebutuhan pengolahan transaksi harian, mendukung operasi, bersifat manajerial dan kegiatan strategi dari suatu organisasi dan menyediakan pihak luar tertentu dengan laporan-laporan yang diperlukan.'
    },
    {
      'category': 'MI',
      'image': 'assets/images/mi.png',
      'description':
          'Manajemen Informatika adalah ilmu yang mempelajari teori-teori dalam teknologi informasi serta penggunaannya dalam membuat bisnis perusahaan menjadi lebih mudah.'
    },
    {
      'category': 'DKV',
      'image': 'assets/images/dkv.png',
      'description':
          'Jurusan Desain Komunikasi Visual (DKV) adalah studi yang mempelajari ilmu tentang penyampaian pesan dengan menggunakan elemen desain grafis, seperti huruf, warna, gambar, dan lay out.'
    },
  ];

  List<Map<String, String>> get categoryList => _categoryList;

  //check is public course data is empty
  bool _isDataEmpty = false;

  bool get isDataEmpty => _isDataEmpty;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  //loading when load more data
  bool _pageLoading = false;

  bool get pageLoading => _pageLoading;

  //to get categories
  List<String> _categories = [];

  List<String> get categories => _categories;

  // List<String> get

//to tell the _categoryIndex
  int _categoryIndex = 0;
  int get categoryIndex => _categoryIndex;
  //set index for category
  set setIndex(int index) {
    _categoryIndex = index;
    notifyListeners();
  }

  final int _size = 8;

//TO save the courses data
  List<PublicCourse> _courses = [];

  List<PublicCourse> get courses => _courses;

  int _currentPage = 1;

  int get currentPage => _currentPage;

  void resetPage() {
    _currentPage = 1;
    notifyListeners();
  }

//to get data and save it to the _courses
  void getCourses({String? search, String? category}) async {
    _isLoading = true;

    if (category == 'All') {
      category = '';
    }

    //get the data from response
    final publicCourseResponse = await PublicCourseService().getPublicCourse(
      page: _currentPage,
      search: search ?? '',
      category: category,
      size: _size,
    );

    //assign to the courses
    _courses = publicCourseResponse.data;

    //check if courses < size then _isDataEmpty to false for not showing check
    if (courses.length < _size) {
      _isDataEmpty = false;
      notifyListeners();
    }

    _isLoading = false;

    notifyListeners();
  }

  //to get categories data
  void getCategories() async {
    final categoriesResponse = await CategoriesService().getCategories();
    _categories = ['All', ...categoriesResponse.data];

    notifyListeners();
  }

  // void refreshCourses({String? search}) {
  //   getCourses(search: search);
  //   notifyListeners();
  // }

  void loadMoreCourses(
      {ScrollController? controller, String? category, String? search}) async {
    if (_pageLoading) {
      return null;
    }
    if (controller!.position.pixels == controller.position.maxScrollExtent &&
        controller.position.atEdge) {
      _pageLoading = true;
      notifyListeners();

      _currentPage = _currentPage + 1;

      final publicCourseResponse = await PublicCourseService().getPublicCourse(
          page: _currentPage,
          search: search ?? '',
          category: category ?? '',
          size: _size);

      if (publicCourseResponse.data.isEmpty) {
        _isDataEmpty = true;
        _pageLoading = false;
        _currentPage = _currentPage - 1;

        notifyListeners();
        return null;
      }

      if (courses.length < _size) {
        _isDataEmpty = false;
        notifyListeners();
      }

      _courses = _courses + publicCourseResponse.data;

      _pageLoading = false;
      notifyListeners();
    } else {
      _currentPage = _currentPage;
      notifyListeners();
    }
    notifyListeners();
  }
}
