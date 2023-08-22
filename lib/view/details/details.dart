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
      body: Obx(
        () => Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset('assets/bg.jpeg', fit: BoxFit.cover),
            ),
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Image.network(
                    comicController.character.value.image!['super_url']!,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  comicController.character.value.name!,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 23, 20, 20),
                    fontSize: 25,
                  ),
                ),
                Text(
                  comicController.character.value.deck.toString(),
                  style: const TextStyle(
                    color: Color.fromARGB(255, 23, 20, 20),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
