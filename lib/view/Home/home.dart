import 'package:comic_hub/controller/comic_controller.dart';
import 'package:comic_hub/view/Home/components/card.dart';
import 'package:comic_hub/view/Home/components/cardMovies.dart';
import 'package:comic_hub/view/Home/components/cardSeries.dart';
import 'package:comic_hub/view/Home/components/cardTeams.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../styles/styleSheet.dart';
import 'components/cardIssues.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ComicController comicController = Get.put(ComicController());

  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      leading: const Icon(Icons.arrow_back_ios),
      title: const Text("Comic Hub"),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
      ],
      headerWidget: headerWidget(context),
      headerBottomBar: headerBottomBarWidget(),
      body: [
        Container(
          child: Obx(
            () => comicController.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Text(
                          'All Heros',
                          style: headingTextStyle,
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (var character in comicController.characters)
                                GestureDetector(
                                  onTap: () {
                                    comicController.setCharacter(character);
                                    // obviously I can pass the character through constructor but im just testing the flexibility of GetX
                                    Get.toNamed('/details');
                                  },
                                  child: MyHomeCard(character: character),
                                ),
                            ],
                          ),
                        ),

                        ////////////////////////
                        //ALL TEAMS
                        Text(
                          'All Teams',
                          style: headingTextStyle,
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (var teams in comicController.teams)
                                GestureDetector(
                                  onTap: () {
                                    comicController.setCharacter(teams);
                                    // obviously I can pass the character through constructor but im just testing the flexibility of GetX
                                    Get.toNamed('/details');
                                  },
                                  child: MyTeamCard(team: teams),
                                ),
                            ],
                          ),
                        ),

                        ///////////////////////
                        //movies
                        Text(
                          'Movies',
                          style: headingTextStyle,
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (var movies in comicController.movies)
                                GestureDetector(
                                  onTap: () {
                                    comicController.setCharacter(movies);
                                    // obviously I can pass the character through constructor but im just testing the flexibility of GetX
                                    Get.toNamed('/details');
                                  },
                                  child: MyMoviesCard(movie: movies),
                                ),
                            ],
                          ),
                        ),

                        //////////////////
                        //All Series List

                        Text(
                          'Series',
                          style: headingTextStyle,
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (var series in comicController.series)
                                GestureDetector(
                                  onTap: () {
                                    comicController.setCharacter(series);
                                    // obviously I can pass the character through constructor but im just testing the flexibility of GetX
                                    Get.toNamed('/details');
                                  },
                                  child: MySeriesCard(serie: series),
                                ),
                            ],
                          ),
                        ),

                        ////////////////////////
                        //ALL ISSUES
                        Text(
                          'Issues',
                          style: headingTextStyle,
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (var issues in comicController.issues)
                                GestureDetector(
                                  onTap: () {
                                    comicController.setCharacter(issues);
                                    // obviously I can pass the character through constructor but im just testing the flexibility of GetX
                                    Get.toNamed('/details');
                                  },
                                  child: MyIssuesCard(issue: issues),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ],
      fullyStretchable: true,
      //expandedBody: const NavPage(),
      backgroundColor: Colors.white,
      appBarColor: Colors.teal,
    );
  }

  Row headerBottomBarWidget() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Icon(
          Icons.settings,
          color: Colors.white,
        ),
      ],
    );
  }

  Widget headerWidget(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            child: Image.network(
              'https://www.mundodeportivo.com/alfabeta/hero/2021/01/marvel-personajes.jpg?width=768&aspect_ratio=16:9&format=nowebp',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
