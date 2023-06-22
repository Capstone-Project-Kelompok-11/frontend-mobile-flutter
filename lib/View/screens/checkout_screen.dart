import 'package:flutter/material.dart';
import 'package:lms_apps/View/widgets/checkout/checkout_appbar.dart';
import 'package:lms_apps/View/widgets/checkout/checkout_body.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              children: [
                CheckoutAppBar(),
                CheckoutBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
