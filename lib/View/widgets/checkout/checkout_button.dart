import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/home_screen.dart';

import 'package:lms_apps/View/screens/theme/theme.dart';
import 'package:lms_apps/ViewModels/checkout_view_model.dart';
import 'package:provider/provider.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final checkOutProvider =
        Provider.of<CheckOutViewModel>(context, listen: true);
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
            'Confirm',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () async {
            await checkOutProvider.verify(
                courseId: checkOutProvider.checkOutUnpaid[0].course.id,
                paymentMethod: checkOutProvider
                            .paymentMethod[checkOutProvider.selectedPayment]
                        ['payment'] ??
                    '');
            if (context.mounted) {
              showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (context) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: AlertDialog(
                        content: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset('assets/icon/ic_payment_success.png'),
                              const SizedBox(height: 12.0),
                              Text(
                                'Successful',
                                style: blackTextStyle.copyWith(
                                    fontSize: 16.0, fontWeight: bold),
                              ),
                              const SizedBox(height: 24.0),
                              Text(
                                'Your payment request has been successful',
                                textAlign: TextAlign.center,
                                style: blackTextStyle.copyWith(
                                    fontSize: 12.0, fontWeight: regular),
                              ),
                              const SizedBox(height: 30.0),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: blueColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomeScreen()),
                                    );
                                  },
                                  child: Text(
                                    'Go to Home',
                                    style: whiteTextStyle.copyWith(
                                        fontWeight: regular),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }

            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const CheckoutScreen()),
            // );
          },
        ),
      ),
    );
  }
}
