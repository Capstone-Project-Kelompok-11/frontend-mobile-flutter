// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: camel_case_types
class buttonWidget extends StatelessWidget {
  final Function()? onTap;
  final String? title;
  final Color? color;
  final TextStyle? textColor;
  final bool isIcon;

  const buttonWidget({
    super.key,
    required this.onTap,
    required this.title,
    required this.color,
    this.isIcon = false,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 33,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.blue),
            color: color,
          ),
          child: Center(
            child: Text(
              title ?? "-",
              style: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
