import 'package:flutter/material.dart';

class SearchAppbar extends StatelessWidget {
  const SearchAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Row(
        children: [
          InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back)),
          const SizedBox(width: 16.0),
          Expanded(
            child: CustomSearchBar(
              onChanged: (value) {
                // print(searchProvider.value);
              },
              prefixIcon: Image.asset(
                'assets/icon/ic_search.png',
              ),
              suffixIcon: Image.asset(
                'assets/icon/ic_stroke.png',
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
  final void Function()? onTap;
  final Function(String)? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  const CustomSearchBar({
    super.key,
    this.readOnly,
    this.prefixIcon,
    this.onTap,
    this.suffixIcon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.0,
      child: TextField(
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
