import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimSearchBar(
      width: MediaQuery.of(context).size.width - 20,
      animationDurationInMilli: 5000,
      helpText: 'Search for a character',
      textController: TextEditingController(),
      onSuffixTap: () {
        print('Search suffix tapped');
      },
      rtl: true,
      suffixIcon: Icon(Icons.search),
      prefixIcon: Icon(Icons.arrow_back),
      onSubmitted: (String ) {  },
      //suffixIconColor: Colors.white,
      // onSearchQueryChanged: (query) {
      //   print(query);
      // },
      // searchDecoration: InputDecoration(
      //   hintText: 'Search',
      //   hintStyle: TextStyle(
      //     color: Colors.white,
      //   ),
      //   border: InputBorder.none,
      // ),
      // searchStyle: TextStyle(
      //   color: Colors.white,
      // ),
      // style: TextStyle(
      //   color: Colors.white,
      // ), onSubmitted: (String ) {  },
    );
  }
}

