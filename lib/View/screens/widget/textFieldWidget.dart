import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';

// ignore: camel_case_types
class textFieldWidget extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextStyle textColor;
  final String hintText;

  textFieldWidget({
    super.key,
    required this.textColor,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: greyColor),
          ),
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
