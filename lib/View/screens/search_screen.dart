
import 'package:flutter/material.dart';
import 'package:lms_apps/View/widgets/search/search_screen_appbar.dart';
import 'package:lms_apps/View/widgets/search/search_screen_body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Column(
              children: [
                SearchAppbar(),
                SizedBox(height: 44.0),
                SearchBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
