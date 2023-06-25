import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';
import 'package:lms_apps/ViewModels/checkout_view_model.dart';
import 'package:provider/provider.dart';

class CheckoutAppBar extends StatefulWidget {
  const CheckoutAppBar({
    super.key,
  });

  @override
  State<CheckoutAppBar> createState() => _CheckoutAppBarState();
}

class _CheckoutAppBarState extends State<CheckoutAppBar> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<CheckOutViewModel>(context, listen: false).getUnpaidCheckout();
  }

  @override
  Widget build(BuildContext context) {
    final checkOutProvider =
        Provider.of<CheckOutViewModel>(context, listen: true);
    return Column(
      children: [
        Stack(
          children: [
            IconButton(
              onPressed: () async {
                await checkOutProvider.deleteCheckOut(
                    courseId: checkOutProvider.checkOutUnpaid[0].id);
                if (context.mounted) {
                  Navigator.pop(context);
                }
              },
              icon: Image.asset(
                'assets/icon/ic_arrow_left.png',
                width: 14,
                height: 17,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Center(
                child: Text(
                  'Checkout',
                  style: blackTextStyle.copyWith(
                      fontSize: 25, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
