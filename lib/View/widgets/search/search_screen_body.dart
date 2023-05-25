import 'package:flutter/material.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({super.key});

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  final List<String> _searchHistory = ['test', 'apa1', 'apa2', 'apa3'];
  @override
  Widget build(BuildContext context) {
    // final searchProvider = Provider.of<SearchProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Recent'),
              Image.asset(
                'assets/icon/ic_stroke.png',
              ),
            ],
          ),
          const Divider(),
          ListView.builder(
            shrinkWrap: true,
            itemCount: _searchHistory.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 22.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _searchHistory[index],
                      ),
                      Image.asset(
                        'assets/icon/ic_stroke.png',
                      ),
                    ]),
              );
            },
          ),
        ],
      ),
    );
  }
}
