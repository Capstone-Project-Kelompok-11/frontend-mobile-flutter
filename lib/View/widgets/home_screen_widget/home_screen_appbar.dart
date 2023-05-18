import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:44.0),
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
            child: SizedBox(
              height: 36.0,
              child: TextField(
                readOnly: true,
                onTap: (){},
                decoration: InputDecoration(
                  prefixIcon: Image.asset(
                    'assets/icon/ic_search.png',
                  ),
                  // prefixIconConstraints: const BoxConstraints(maxWidth:20.0, maxHeight:20.0,),
                  suffixIcon: Image.asset(
                    'assets/icon/ic_filter.png',
                  ),
                  hintText: 'Search',
                  contentPadding: const EdgeInsets.only(top:-10.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
