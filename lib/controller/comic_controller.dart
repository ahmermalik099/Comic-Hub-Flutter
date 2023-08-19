import 'dart:convert';
import 'dart:developer';

import 'package:comic_hub/model/character.dart';
import 'package:comic_hub/model/teams.dart';
import 'package:comic_hub/services/api.dart';
import 'package:comic_hub/view/Home/components/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComicController extends GetxController {
  /// You do not need that. I recommend using it just for ease of syntax.
  /// with static method: Controller.to.increment();
  /// with no static method: Get.find<Controller>().increment();
  /// There is no difference in performance, nor any side effect of using either
  /// syntax. Only one does not need the type,
  /// and the other the IDE will autocomplete it.
  ///
  static ComicController get to => Get.find();

  var isLoading = false.obs;
  var characters = <Character>[].obs;
  var teams = <Character>[].obs;
  var issues = <Character>[].obs;
  var series = <Character>[].obs;
  var movies = <Character>[].obs;
  var searches = <Character>[].obs;
  var character = Character(
          id: 0,
          image: {},
          name: '',
          origin: '',
          aliases: '',
          deck: '',
          realName: '')
      .obs;
  var search = Character(
          id: 0,
          image: {},
          name: '',
          origin: '',
          aliases: '',
          deck: '',
          realName: '')
      .obs;
  var team = Character(
          id: 0,
          image: {},
          name: '',
          origin: '',
          aliases: '',
          deck: '',
          realName: '')
      .obs;
  var issue = Character(
          id: 0,
          image: {},
          name: '',
          origin: '',
          aliases: '',
          deck: '',
          realName: '')
      .obs;
  var serie = Character(
          id: 0,
          image: {},
          name: '',
          origin: '',
          aliases: '',
          deck: '',
          realName: '')
      .obs;

  var movie = Character(
          id: 0,
          image: {},
          name: '',
          origin: '',
          aliases: '',
          deck: '',
          realName: '')
      .obs;

  @override
  void onInit() {
    super.onInit();
    // call API
    buildGridCards(10);
    getCharacters();
    getTeams();
    getIssues();
    getSeries();
    getMovies();
  }

  void buildGridCards(int count) {
    List<Character> cards = List.generate(
      count,
      (index) => Character(id: 0, image: {'screen_url': ''}, name: ''),
    );
    characters(cards);
    teams(cards);
    issues(cards);
    series(cards);
    movies(cards);

  }

  void getCharacters() async {
    isLoading(true);
    try {
      var response = await ApiService().getCharacters();
      if (response.statusCode == 200) {
        ///data successfully
        List<dynamic> charactersJson = jsonDecode(response.body)['results'];
        // parsing to model
        characters.value =
            charactersJson.map((e) => Character.fromJson(e)).toList();

        Get.snackbar(
          'Data Fetched successfully',
          "${characters.length.toString()}",
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
    }
  }

  void setCharacter(Character c) {
    character(c);
  }

  //get teams

  void getTeams() async {
    isLoading(true);
    try {
      var response = await ApiService().getTeams();
      if (response.statusCode == 200) {
        ///data successfully
        List<dynamic> teamsJson = jsonDecode(response.body)['results'];

        List<Character> ts = [];
        for (var team in teamsJson) {
          ts.add(Character.fromJson(team));
        }
        teams(ts);
        // Get.snackbar(
        //   'Data Fetched successfully',
        //   "${teams.value.length.toString()}",
        //   snackPosition: SnackPosition.BOTTOM,
        //   duration: const Duration(seconds: 1),
        // );
      } else {
        ///error
        Get.snackbar(
          'Error while Fetching',
          "${response.statusCode.toString()}",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
        );
      }
    } catch (e) {
      log('Error while getting data is $e');
      Get.snackbar(
        'Error while Fetching',
        "${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    } finally {
      isLoading(false);
    }
  }

  void setTeam(Character t) {
    team(t);
  }

  //get Issues

  void getIssues() async {
    isLoading(true);
    try {
      var response = await ApiService().getIssues();
      if (response.statusCode == 200) {
        ///data successfully
        List<dynamic> issuesJson = jsonDecode(response.body)['results'];

        List<Character> iss = [];
        for (var issue in issuesJson) {
          iss.add(Character.fromJson(issue));
        }

        issues(iss);

        // Get.snackbar(
        //   'Data Fetched successfully',
        //   "${teams.value.length.toString()}",
        //   snackPosition: SnackPosition.BOTTOM,
        //   duration: const Duration(seconds: 1),
        // );
      } else {
        ///error
        Get.snackbar(
          'Error while Fetching',
          "${response.statusCode.toString()}",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
        );
      }
    } catch (e) {
      log('Error while getting data is $e');
      Get.snackbar(
        'Error while Fetching',
        "${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    } finally {
      isLoading(false);
    }
  }

  void setIssues(Character i) {
    issue(i);
  }

  //series List

  void getSeries() async {
    isLoading(true);
    try {
      var response = await ApiService().getSeries();
      if (response.statusCode == 200) {
        ///data successfully
        List<dynamic> seriesJson = jsonDecode(response.body)['results'];

        List<Character> iss = [];
        for (var series in seriesJson) {
          iss.add(Character.fromJson(series));
        }

        series(iss);

        // Get.snackbar(
        //   'Data Fetched successfully',
        //   "${teams.value.length.toString()}",
        //   snackPosition: SnackPosition.BOTTOM,
        //   duration: const Duration(seconds: 1),
        // );
      } else {
        ///error
        Get.snackbar(
          'Error while Fetching',
          "${response.statusCode.toString()}",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
        );
      }
    } catch (e) {
      log('Error while getting data is $e');
      Get.snackbar(
        'Error while Fetching',
        "${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    } finally {
      isLoading(false);
    }
  }

  void setSeries(Character i) {
    serie(i);
  }

  //Movies

  void getMovies() async {
    isLoading(true);
    try {
      var response = await ApiService().getMovies();
      if (response.statusCode == 200) {
        ///data successfully
        List<dynamic> moviesJson = jsonDecode(response.body)['results'];

        List<Character> mov = [];
        for (var movies in moviesJson) {
          mov.add(Character.fromJson(movies));
        }

        movies(mov);

        // Get.snackbar(
        //   'Data Fetched successfully',
        //   "${teams.value.length.toString()}",
        //   snackPosition: SnackPosition.BOTTOM,
        //   duration: const Duration(seconds: 1),
        // );
      } else {
        ///error
        Get.snackbar(
          'Error while Fetching',
          "${response.statusCode.toString()}",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
        );
      }
    } catch (e) {
      log('Error while getting data is $e');
      Get.snackbar(
        'Error while Fetching',
        "${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    } finally {
      isLoading(false);
    }
  }

  void setMovies(Character i) {
    movie(i);
  }

  ////////////////////////////////
  ///Serach

  // void getSearch() async {
  //   isLoading(true);
  //   try {
  //     var response = await ApiService().getSearch(searchC);
  //     if (response.statusCode == 200) {
  //       ///data successfully
  //       List<dynamic> searchJson = jsonDecode(response.body)['results'];
  //       // parsing to model
  //       characters.value =
  //           searchJson.map((e) => Character.fromJson(e)).toList();
  //       print(searchJson);

  //       Get.snackbar(
  //         'Data Fetched successfully',
  //         "${characters.length.toString()}",
  //         snackPosition: SnackPosition.BOTTOM,
  //         duration: const Duration(seconds: 1),
  //       );
  //     } else {
  //       ///error
  //       Get.snackbar(
  //         'Error while Fetching',
  //         "${response.statusCode.toString()}",
  //         snackPosition: SnackPosition.BOTTOM,
  //         duration: const Duration(seconds: 1),
  //       );
  //     }
  //   } catch (e) {
  //     log('Error while getting data is $e');
  //     Get.snackbar(
  //       'Error while Fetching',
  //       "${e.toString()}",
  //       snackPosition: SnackPosition.BOTTOM,
  //       duration: const Duration(seconds: 1),
  //     );
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  // void setSearch(Character c){
  //   search(c);
  // }
}
