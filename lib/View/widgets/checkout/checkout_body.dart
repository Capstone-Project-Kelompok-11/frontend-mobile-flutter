import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';

class CheckoutBody extends StatefulWidget {
  const CheckoutBody({super.key});

  @override
  State<CheckoutBody> createState() => _CheckoutBodyState();
}

class _CheckoutBodyState extends State<CheckoutBody> {
  int selectedPayment = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Payment',
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: semiBold,
            ),
          ),
          customPaymentCardButton("assets/images/gopay.png", 1, 'Gopay'),
          customPaymentCardButton("assets/images/dana.png", 2, 'Dana'),
          customPaymentCardButton("assets/images/linkaja.png", 3, 'LinkAja'),
          customPaymentCardButton("assets/images/paypal.png", 4, 'PayPal'),
          SizedBox(height: MediaQuery.of(context).size.height * 0.4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            height: 40,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Confirm',
                style:
                    whiteTextStyle.copyWith(fontSize: 15, fontWeight: regular),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget customPaymentCardButton(String assetName, int index, String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: Row(
          children: [
            OutlinedButton(
              onPressed: () {
                setState(() {
                  selectedPayment = index;
                });
              },
              style: OutlinedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                side: BorderSide(
                    width: (selectedPayment == index) ? 2.0 : 0.5,
                    color:
                        (selectedPayment == index) ? Colors.green : blackColor),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: assetName == ''
                          ? Text(
                              'Type your coupon code',
                              style: greykTextStyle.copyWith(fontSize: 10),
                            )
                          : Image.asset(
                              assetName,
                              fit: BoxFit.contain,
                              width: 40,
                              height: 40,
                            ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      name,
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.35),
                    if (selectedPayment == index)
                      Positioned(
                        top: 5,
                        right: 5,
                        child: Image.asset(
                          "assets/images/tick-circle.png",
                          width: 25,
                          fit: BoxFit.cover,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
