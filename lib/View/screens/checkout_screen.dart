import 'package:flutter/material.dart';
import 'package:lms_apps/View/widgets/checkout/checkout_appbar.dart';
import 'package:lms_apps/View/widgets/checkout/checkout_body.dart';
import 'package:lms_apps/View/widgets/checkout/checkout_button.dart';
import 'package:lms_apps/ViewModels/checkout_view_model.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatefulWidget {
  final int coursePrice;
  const CheckoutScreen({
    super.key,
    required this.coursePrice,
  });

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
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
    return WillPopScope(
      onWillPop: () async {
        checkOutProvider.deleteCheckOut(courseId: checkOutProvider.checkOutUnpaid[0].id);
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: [
                  const CheckoutAppBar(),
                  CheckoutBody(price: widget.coursePrice),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: const CheckoutButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
