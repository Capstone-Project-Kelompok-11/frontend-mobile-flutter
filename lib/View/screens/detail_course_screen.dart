import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/checkout_screen.dart';
import 'package:lms_apps/View/widgets/detail_course/detail_course_appbar.dart';
import 'package:lms_apps/View/widgets/detail_course/detail_course_body.dart';
import 'package:lms_apps/View/widgets/detail_course/detail_course_button.dart';
import 'package:lms_apps/ViewModels/checkout_view_model.dart';
import 'package:lms_apps/ViewModels/detail_course_view_model.dart';
import 'package:provider/provider.dart';

class DetailCourseScreen extends StatefulWidget {
  //for checkout
  final String? courseId;
  const DetailCourseScreen({super.key, this.courseId});

  @override
  State<DetailCourseScreen> createState() => _DetailCourseScreenState();
}

class _DetailCourseScreenState extends State<DetailCourseScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final checkOutProvider =
        Provider.of<CheckOutViewModel>(context, listen: false);
    checkOutProvider.getUnpaidCheckout();
    checkOutProvider.setTemp = [...checkOutProvider.checkOutUnpaid];
  }

  @override
  Widget build(BuildContext context) {
    final courseById =
        Provider.of<DetailCourseViewModel>(context, listen: true);
    final checkOutProvider =
        Provider.of<CheckOutViewModel>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            courseById.refreshDetail(courseId: widget.courseId);
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: [
                  const DetailCourseAppbar(),
                  const SizedBox(height: 30.0),
                  DetailCourseBody(courseId: widget.courseId),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: checkOutProvider.checkCourse
          ? BuyButton(
              onPressed: () async {
                await checkOutProvider.getUnpaidCheckout();
                await checkOutProvider.deleteDuplicatePaid(
                    checkOutProvider.temp, checkOutProvider.checkOutUnpaid);
                await checkOutProvider.checkOut(
                    courseId: widget.courseId ?? '');
                if (context.mounted) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CheckoutScreen(
                        coursePrice: courseById.coursePrice,
                      ),
                    ),
                  );
                }
              },
            )
          : Text('Sudah Punya'),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
