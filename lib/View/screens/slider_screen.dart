import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SliderScreen extends StatelessWidget {
  final String title;
  final String image;

  const SliderScreen({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            image,
            width: width * 0.6,
          ),
          const SizedBox(
            height: 60,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 80),
          ),
          const SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}
