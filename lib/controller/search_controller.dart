import 'dart:convert';
import 'dart:developer';

import 'package:comic_hub/model/character.dart';
import 'package:comic_hub/model/teams.dart';
import 'package:comic_hub/services/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchControllerX extends GetxController {
  static SearchControllerX get to => Get.find();

  var isLoading = false.obs;
  var searchCharacters = <Character>[].obs;
  var search = Character(
          id: 0,
          image: {},
          name: '',
          origin: '',
          aliases: '',
          deck: '',
          realName: '')
      .obs;

  var textController = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    // call API
  }

  void searchCharacter() async {
    isLoading(true);
    try {
      var response = await ApiService().getSearch(textController.value.text);
      if (response.statusCode == 200) {
        ///data successfully
        List<dynamic> charactersJson = jsonDecode(response.body)['results'];
        // parsing to model
        searchCharacters.value =
            charactersJson.map((e) => Character.fromJson(e)).toList();

        Get.snackbar(
          'Data Fetched successfully',
          "${searchCharacters.length.toString()}",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 1),
        );
      } else {
        ///error
        Get.snackbar(
          'Error while Fetching',
          "${response.statusCode.toString()}",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 1),
        );
      }
    } catch (e) {
      log('Error while getting data is $e');
      Get.snackbar(
        'Error while Fetching',
        "${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 1),
      );
    } finally {
      isLoading(false);
      textController.value.clear();
    }
  }

  // void setCharacter(Character c){
  //   character(c);
  // }
}
