import 'package:comic_hub/controller/comic_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_gradient/animate_gradient.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key});

  final ComicController comicController = Get.put(ComicController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  AnimateGradient(
        duration: const Duration(seconds: 2),
        primaryColors: const [
          Colors.pink,
          Colors.pinkAccent,
          Colors.white,
        ],
        secondaryColors: const [
          Colors.blue,
          Colors.blueAccent,
          Colors.white,
        ],
        child: Container(
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
      ),
    );
  }
}


