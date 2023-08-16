import 'package:comic_hub/controller/comic_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key});

  final ComicController comicController = Get.put(ComicController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Column(
            children: [
              Image.network(
                  comicController.character.value.image!['super_url']!),
              Text(comicController.character.value.name!),
              Text(comicController.character.value.deck.toString()),

            ],
          ),
        ),
      ),
    );
  }
}
