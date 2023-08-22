import 'dart:math';

import 'package:comic_hub/view/Collection/collection_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/collection_controller.dart';

class CollectionOptions extends StatelessWidget {
  final CollectionController collectionController =
      Get.put(CollectionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset('assets/bg.jpeg', fit: BoxFit.cover),
          ),
          Transform.rotate(
            angle: -10 * (pi / 180),
            child: GestureDetector(
              onTap: () {
                collectionController.setType(1);
                Get.to(CollectionScreen());
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Transform.translate(
                  offset: const Offset(50, -50),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      // To maintain the alignment
                      Container(
                        width: 150,
                        height: 150,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          'https://i.pinimg.com/736x/08/6e/4b/086e4b3d717ff1cbbbee36699b07f9a3.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),

                      const Text(
                        'Male',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          Transform.rotate(
            angle: 10 * (pi / 180),
            child: GestureDetector(
              onTap: () {
                collectionController.setType(2);
                Get.to(CollectionScreen());
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: Transform.translate(
                  offset: const Offset(-50, -25),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      ClipOval(
                        child: Container(
                          width: 150,
                          height: 150,
                          child: Image.network(
                            'https://i.pinimg.com/736x/37/03/08/37030874ac8c12cc7b58cfc741a3b5d9.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Text(
                        'Female',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )

          // ElevatedButton(
          //   onPressed: () {
          //     collectionController.setType(1);
          //     Get.to(CollectionScreen());
          //   },
          //   child: Text('Male'),
          // ),
          // ElevatedButton(
          //   onPressed: () {
          //     collectionController.setType(2);
          //     Get.to(CollectionScreen());
          //   },
          //   child: Text('Female'),
          // ),
        ],
      ),
    );
  }
}
