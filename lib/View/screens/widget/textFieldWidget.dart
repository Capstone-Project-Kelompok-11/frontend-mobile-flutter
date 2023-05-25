import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';

// ignore: camel_case_types
class textFieldWidget extends StatelessWidget {
  final Function(String)? onChanged;
  final bool isValidTextField;
  final String errorMessage;
  final String hintText;
  final bool isObsucreText;
  final Widget? suffixIconWidget;
  final bool isReadOnly;
  final TextInputType? keyboardType;
  const textFieldWidget({
    super.key,
    required this.onChanged,
    required this.isValidTextField,
    required this.errorMessage,
    required this.hintText,
    this.isObsucreText = false,
    this.isReadOnly = false,
    this.suffixIconWidget,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: greyColor),
              ),
              child: TextField(
                readOnly: isReadOnly,
                keyboardType: keyboardType,
                onChanged: onChanged,
                obscureText: isObsucreText,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  suffixIcon: suffixIconWidget,
                ),
              ),
            ),
            if (!isValidTextField)
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 5),
                child: Text(
                  errorMessage,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
