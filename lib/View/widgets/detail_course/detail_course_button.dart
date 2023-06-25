import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/checkout_screen.dart';

import 'package:lms_apps/View/screens/theme/theme.dart';
import 'package:lms_apps/ViewModels/checkout_view_model.dart';
import 'package:provider/provider.dart';

class BuyButton extends StatelessWidget {
  final String? courseId;
  final int? coursePrice;
  const BuyButton({
    super.key, this.courseId, this.coursePrice,
    
  });

  @override
  Widget build(BuildContext context) {
     final checkOutProvider =
        Provider.of<CheckOutViewModel>(context, listen: false);
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
          onPressed: () async {
          await checkOutProvider.getUnpaidCheckout();
          await checkOutProvider.deleteDuplicatePaid(
              checkOutProvider.temp, checkOutProvider.checkOutUnpaid);
          await checkOutProvider.checkOut(courseId: courseId ?? '');
          if (context.mounted) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CheckoutScreen(
                  coursePrice: coursePrice ?? 0,
                ),
              ),
            );
          }
        },
          child: const Text(
            'Buy Now',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
