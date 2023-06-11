import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';

Widget textFormFieldWidget({
  required String title,
  required String hintText,
  required String errorMessage,
  required bool isValidTextField,
  required Function(String)? onChanged,
  bool isObsucreText = false,
  Widget? prefixIcon,
  Widget? suffixIcon,
  TextEditingController? controller,
  TextInputType keyboardType = TextInputType.text,
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
        controller: controller,
        onChanged: onChanged,
        obscureText: isObsucreText,
        keyboardType: keyboardType,
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
  );
}
