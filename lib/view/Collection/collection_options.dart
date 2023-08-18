import 'package:comic_hub/view/Collection/collection_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/collection_controller.dart';


class CollectionOptions extends StatelessWidget {
  final CollectionController collectionController = Get.put(CollectionController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Button Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  collectionController.setType(1);
                  Get.to(CollectionScreen());
                },
                child: Text('Male'),
              ),
              ElevatedButton(
                onPressed: () {
                  collectionController.setType(2);
                  Get.to(CollectionScreen());
                },
                child: Text('Female'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


