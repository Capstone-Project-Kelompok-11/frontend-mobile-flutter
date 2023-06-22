import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';
import 'package:lms_apps/ViewModels/checkout_view_model.dart';
import 'package:lms_apps/utils/utility.dart';
import 'package:provider/provider.dart';

class CheckoutBody extends StatelessWidget {
  final int? price;
  const CheckoutBody({super.key, this.price});

  @override
  Widget build(BuildContext context) {
    final checkOutProvider =
        Provider.of<CheckOutViewModel>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
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

          //payment methods
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: checkOutProvider.paymentMethod.length,
            itemBuilder: (context, paymentIndex) {
              return GestureDetector(
                onTap: () {
                  checkOutProvider.setSelectedPayment = paymentIndex;
                },
                child: Padding(
                  padding: paymentIndex < checkOutProvider.paymentMethod.length
                      ? const EdgeInsets.only(bottom: 8.0)
                      : const EdgeInsets.all(0),
                  child: paymentContainer(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: checkOutProvider.paymentMethod[paymentIndex]
                                      ['image'] ==
                                  ''
                              ? Text(
                                  'Type your coupon code',
                                  style: greykTextStyle.copyWith(fontSize: 10),
                                )
                              : Image.asset(
                                  checkOutProvider.paymentMethod[paymentIndex]
                                          ['image'] ??
                                      '',
                                  fit: BoxFit.contain,
                                  width: 40,
                                  height: 40,
                                ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          checkOutProvider.paymentMethod[paymentIndex]
                                  ['payment'] ??
                              '',
                          style: blackTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semiBold,
                          ),
                        ),
                        const Spacer(),
                        checkOutProvider.selectedPayment == paymentIndex
                            ? Image.asset(
                                "assets/images/tick-circle.png",
                                width: 25,
                                fit: BoxFit.cover,
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          //course price
          paymentContainer(
            child: Row(
              children: [
                Text(
                  'Total',
                  style:
                      blackTextStyle.copyWith(fontSize: 18.0, fontWeight: bold),
                ),
                const Spacer(),
                Text(
                  Utility.rupiah.format(price),
                  style:
                      blackTextStyle.copyWith(fontSize: 18.0, fontWeight: bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget paymentContainer({Widget? child}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: blackColor,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      width: double.infinity,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: child,
      ),
    );
  }
}
