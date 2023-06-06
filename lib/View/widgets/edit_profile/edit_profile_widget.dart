import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';

Widget textFormFieldWidget({
  required String title,
  required String hintText,
  Widget? prefixIcon,
  Widget? suffixIcon,
  bool readOnly = false,
  TextEditingController? controller,
  bool obscureText = false,
  String? prefixText,
  TextInputType? keyboardType,
  List<TextInputFormatter>? inputFormatters,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 15),
      Text(
        title,
        style: blackTextStyle.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ),
      const SizedBox(height: 5),
      TextFormField(
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        obscureText: obscureText,
        readOnly: readOnly,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          contentPadding: const EdgeInsets.only(left: 16),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    ],
  );
}
