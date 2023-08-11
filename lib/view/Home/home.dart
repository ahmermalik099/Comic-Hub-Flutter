import 'package:comic_hub/controller/comic_controller.dart';
import 'package:comic_hub/view/Home/components/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ComicController comicController = Get.put(ComicController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => comicController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (var character in comicController.characters)
                      MyHomeCard(character: character),
                  ],
                ),
              ),
      ),
    );
  }
}
