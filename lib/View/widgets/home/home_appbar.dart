
import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/search_screen.dart';
import 'package:lms_apps/View/widgets/search/search_screen_appbar.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 44.0),
      child: Column(
        children: [
          //Profile Tile
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0),
            child: Row(
              children: [
                const CircleAvatar(),
                const SizedBox(width: 10),
                const Text(
                  'Welcome, Chandra',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                Image.asset(
                  'assets/icon/ic_setting.png',
                  width: 20.0,
                  height: 20.0,
                ),
                const SizedBox(width: 10.0),
                Image.asset(
                  'assets/icon/ic_notification.png',
                  width: 20.0,
                  height: 20.0,
                ),
              ],
            ),
          ),
          const SizedBox(height: 36.0),

          //Search Box
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48.0),
            child: CustomSearchBar(
              readOnly: true,
              prefixIcon: Image.asset(
                'assets/icon/ic_search.png',
              ),
              suffixIcon: Image.asset(
                'assets/icon/ic_filter.png',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


