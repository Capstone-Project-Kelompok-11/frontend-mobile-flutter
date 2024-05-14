import 'package:flutter/material.dart';

class UnbordingContent {
  Widget image;
  String title;
  String discription;

  UnbordingContent({
    required this.image,
    required this.title,
    required this.discription,
  });
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: ' ',
      image: Image.asset('assets/images/image2.png'),
      discription: 'Grow your skill & push your limit'),
  UnbordingContent(
      title: ' ',
      image: Image.asset('assets/images/image3.png'),
      discription: 'Study from anywhere with experts'),
  UnbordingContent(
      title: ' ',
      image: Image.asset('assets/images/image4.png'),
      discription: 'Get access to unlimited educational resources'),
  UnbordingContent(
      title: ' STIKI MALANG',
      image: Image.asset('assets/images/image5.png'),
      discription:
          'Find the best teacher & upgrade your skills, start learn now with'),
];
