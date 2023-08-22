import 'package:comic_hub/controller/comic_controller.dart';
import 'package:comic_hub/model/character.dart';
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
        // IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
      ],
      backgroundColor: Color.fromARGB(255, 241, 231, 231),
      headerWidget: headerWidget(context),
      // headerBottomBar: headerBottomBarWidget(),
      body: [
        Stack(
          children: [
            Container(
              child: Obx(
                () => comicController.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'All Heros',
                                style: headingTextStyle,
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                child: ListView.builder(
                                  scrollDirection:
                                      Axis.horizontal, // Scroll horizontally
                                  itemCount: comicController.characters.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var character =
                                        comicController.characters[index];
                                    return GestureDetector(
                                      onTap: () {
                                        comicController.setCharacter(character);
                                        // Navigate to character details screen
                                        Get.toNamed('/details');
                                      },
                                      child: MyHomeCard(
                                        character: character,
                                      ),
                                    );
                                  },
                                ),
                              ),

                              //////////////////////
                              // ALL TEAMS
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'All Teams',
                                style: headingTextStyle,
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                height: 10,
                              ),

                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                child: ListView.builder(
                                  scrollDirection:
                                      Axis.horizontal, // Scroll vertically
                                  itemCount: comicController.teams.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var team = comicController.teams[index];
                                    return GestureDetector(
                                      onTap: () {
                                        comicController.setTeam(team);
                                        // Navigate to team details screen
                                        Get.toNamed('/details');
                                      },
                                      child: MyHomeCard(
                                        character: team,
                                      ),
                                    );
                                  },
                                ),
                              ),

                              ///////////////////////
                              //movies
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Movies',
                                style: headingTextStyle,
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                child: ListView.builder(
                                  scrollDirection:
                                      Axis.horizontal, // Scroll vertically
                                  itemCount: comicController.movies.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var movie = comicController.movies[index];
                                    return GestureDetector(
                                      onTap: () {
                                        comicController.setMovies(movie);
                                        // Navigate to movie details screen
                                        Get.toNamed('/details');
                                      },
                                      child: MyHomeCard(
                                        character: movie,
                                      ),
                                    );
                                  },
                                ),
                              ),

                              //////////////////
                              //All Series List
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Series',
                                style: headingTextStyle,
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                child: ListView.builder(
                                  scrollDirection:
                                      Axis.horizontal, // Scroll vertically
                                  itemCount: comicController.series.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var series = comicController.series[index];
                                    return GestureDetector(
                                      onTap: () {
                                        comicController.setSeries(series);
                                        // Navigate to series details screen
                                        Get.toNamed('/details');
                                      },
                                      child: MyHomeCard(
                                        character: series,
                                      ),
                                    );
                                  },
                                ),
                              ),

                              ////////////////////////
                              //ALL ISSUES
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Issues',
                                style: headingTextStyle,
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                child: ListView.builder(
                                  scrollDirection:
                                      Axis.horizontal, // Scroll vertically
                                  itemCount: comicController.issues.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var issue = comicController.issues[index];
                                    return GestureDetector(
                                      onTap: () {
                                        comicController.setIssues(issue);
                                        // Navigate to issue details screen
                                        Get.toNamed('/details');
                                      },
                                      child: MyHomeCard(
                                        character: issue,
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ],
      fullyStretchable: true,
      //expandedBody: const NavPage(),

      appBarColor: Colors.teal,
    );
  }

  // Row headerBottomBarWidget() {
  //   return Row(
  //     mainAxisSize: MainAxisSize.max,
  //     mainAxisAlignment: MainAxisAlignment.end,
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     children: const [
  //       Icon(
  //         Icons.settings,
  //         color: Colors.white,
  //       ),
  //     ],
  //   );
  // }

  Widget headerWidget(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            'assets/bg.jpeg',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
