import 'package:comic_hub/view/search/components/cardSearch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:comic_hub/controller/comic_controller.dart';

import '../Home/components/card.dart';

class SearchComic extends StatelessWidget {
  //String search;
 // SearchComic({required this.search});
  final ComicController comicController = Get.put(ComicController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text('Search'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                for (var search in comicController.searches())
                    GestureDetector(
                      onTap: () {
                        comicController.setCharacter(search);
                        // obviously I can pass the character through constructor but im just testing the flexibility of GetX
                        Get.toNamed('/details');
                      },
                      child: MySearchCard(search: search),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
