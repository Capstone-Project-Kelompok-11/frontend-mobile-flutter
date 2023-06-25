import 'package:flutter/material.dart';
import 'package:lms_apps/ViewModels/search_view_model.dart';
import 'package:provider/provider.dart';

class SearchAppbar extends StatefulWidget {
  const SearchAppbar({super.key});

  @override
  State<SearchAppbar> createState() => _SearchAppbarState();
}

class _SearchAppbarState extends State<SearchAppbar> {
  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchViewModel>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Row(
        children: [
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                'assets/icon/ic_arrow_left.png',
                height: 20.0,
                width: 20.0,
              )),
          const SizedBox(width: 16.0),
          Expanded(
            child: CustomSearchBar(
              autoFocus: true,
              onChanged: (value) {
                // print(searchProvider.value);
                searchProvider.setValue = value;
              },
              onFieldSubmitted: (value) {
                searchProvider.checkValue(search: value, context: context);
              },
              prefixIcon: Image.asset(
                'assets/icon/ic_search.png',
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  searchProvider.clearValue();
                },
                child: Image.asset(
                  'assets/icon/ic_stroke.png',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSearchBar extends StatelessWidget {
  final bool? readOnly;
  final String? initialValue;
  final void Function()? onTap;
  final Function(String)? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(String)? onFieldSubmitted;
  final TextEditingController? controller;
  final bool? autoFocus;
  const CustomSearchBar({
    super.key,
    this.readOnly,
    this.prefixIcon,
    this.onTap,
    this.suffixIcon,
    this.onChanged,
    this.onFieldSubmitted,
    this.controller,
    this.initialValue, this.autoFocus,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.0,
      child: TextFormField(
        autofocus: true,
        initialValue: initialValue,
        controller: controller,
        onFieldSubmitted: onFieldSubmitted,
        readOnly: readOnly ?? false,
        onTap: onTap,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          // prefixIconConstraints: const BoxConstraints(maxWidth:20.0, maxHeight:20.0,),
          suffixIcon: suffixIcon,
          hintText: 'Search',
          contentPadding: const EdgeInsets.only(top: -10.0),
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
    );
  }
}
