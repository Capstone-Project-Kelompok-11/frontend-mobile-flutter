import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/category_course_screen.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';
import 'package:lms_apps/ViewModels/search_view_model.dart';
import 'package:provider/provider.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({super.key});

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  @override
  void initState() {
    super.initState();

    Provider.of<SearchViewModel>(context, listen: false).getSearchHistory();
  }

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchViewModel>(context, listen: true);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent',
                    style: blackTextStyle.copyWith(
                        fontSize: 14.0, fontWeight: bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      searchProvider.clearAllSearch();
                      searchProvider.getSearchHistory();
                    },
                    child: Image.asset(
                      'assets/icon/ic_stroke.png',
                    ),
                  ),
                ],
              ),
              const Divider(thickness: 1.0),
            ],
          ),
        ),
        Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: searchProvider.searchHistoryList.length,
              itemBuilder: (context, searchIndex) {
                return InkWell(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryCourseScreen(
                            search:
                                searchProvider.searchHistoryList[searchIndex]),
                      ),
                    );
                    searchProvider.addSearch(
                        search: searchProvider.searchHistoryList[searchIndex]);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 6.0,
                      horizontal: 30.0,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(searchProvider.searchHistoryList[searchIndex],
                              style: blackTextStyle.copyWith(
                                  fontSize: 14.0, fontWeight: small)),
                          GestureDetector(
                            onTap: () {
                              searchProvider.removeSearch(index: searchIndex);
                            },
                            child: Image.asset(
                              'assets/icon/ic_stroke.png',
                            ),
                          ),
                        ]),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
