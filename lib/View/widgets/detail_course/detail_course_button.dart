import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';

class BuyButton extends StatelessWidget {
  const BuyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: blueColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: const Text(
            'Buy Now',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
