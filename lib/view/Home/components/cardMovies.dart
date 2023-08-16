//series card

import 'package:comic_hub/model/character.dart';
import 'package:comic_hub/model/teams.dart';
import 'package:flutter/material.dart';

import '../../../styles/styleSheet.dart';

class MyMoviesCard extends StatelessWidget {
  //const MyTeamCard({super.key, this.character, this.teams});
  const MyMoviesCard({super.key, this.movie, });
  final Character? movie;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              movie?.image?['screen_url']?? '',
              fit: BoxFit.cover,
            ),
          ),
          Text(
            movie?.name ?? 'NULL',
            style: cardTextStyle,
          ),
        ],
      ),
    );

  }
}
