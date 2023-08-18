import 'package:comic_hub/view/Collection/components/cardCollection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../controller/comic_controller.dart';
import '../../controller/collection_controller.dart';
import '../../styles/styleSheet.dart';



class CollectionScreen extends StatelessWidget {
  final CollectionController collectionController = Get.put(CollectionController());

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text('Collection'),
      ),
      body: Column(
        children: [
          Text('Collection Screen'),
          Obx(
                () => collectionController.isLoading.value
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Text(
                    'Heros',
                    style: headingTextStyle,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  collectionController.type.value == 1 ?
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (var character in collectionController.maleChar )
                          GestureDetector(
                            onTap: () {
                              collectionController.setCollection(character);
                              // obviously I can pass the character through constructor but im just testing the flexibility of GetX
                              Get.toNamed('/details');
                            },
                            child: MyCollectionCard(collection: character),
                          ),
                      ],
                    ),
                  ):Container(),
                  collectionController.type.value == 2 ?
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (var character in collectionController.femaleChar )
                          GestureDetector(
                            onTap: () {
                              collectionController.setCollection(character);
                              // obviously I can pass the character through constructor but im just testing the flexibility of GetX
                              Get.toNamed('/details');
                            },
                            child: MyCollectionCard(collection: character),
                          ),
                      ],
                    ),
                  ):Container(),

                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
