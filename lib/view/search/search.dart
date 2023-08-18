import 'package:comic_hub/view/search/seaarchFunction.dart';
import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Home/components/card.dart';
import 'package:comic_hub/controller/comic_controller.dart';


class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String seacrh='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AnimSearchBar(
            width: MediaQuery.of(context).size.width - 20,
            animationDurationInMilli: 1000,
            helpText: 'Search for a character',
            textController: TextEditingController(),
            onSuffixTap: () {
              print('Search suffix tapped');
            },
            rtl: true,
            suffixIcon: Icon(Icons.search),
            prefixIcon: Icon(Icons.arrow_back),
            onSubmitted: (String ) {
              SearchComic();
            },
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
          ),

        ]
      ),
    );
  }
}

