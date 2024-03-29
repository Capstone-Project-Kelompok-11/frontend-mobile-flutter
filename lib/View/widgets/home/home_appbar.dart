import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/search_screen.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';
import 'package:lms_apps/View/widgets/search/search_screen_appbar.dart';
import 'package:lms_apps/ViewModels/edit_profile_view_model.dart';
import 'package:provider/provider.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  void initState() {
    super.initState();

    Provider.of<EditProfileViewModel>(context, listen: false).getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    final userInfoProvider =
        Provider.of<EditProfileViewModel>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.only(top: 44.0),
      child: Column(
        children: [
          //Profile Tile
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0),
            child: Row(
              children: [
                userInfoProvider.isLoading
                    ? const CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: SizedBox(
                          height: 10.0,
                          width: 10.0,
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : userInfoProvider.imagePath == null ||
                            userInfoProvider.imagePath == ''
                        ? CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: Icon(Icons.question_mark, color: whiteColor),
                          )
                        : CircleAvatar(
                            backgroundImage:
                                NetworkImage('${userInfoProvider.imagePath}'),
                          ),
                const SizedBox(width: 10),
                Text(
                  'Welcome, ${userInfoProvider.name ?? 'Guest'}',
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w700),
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
