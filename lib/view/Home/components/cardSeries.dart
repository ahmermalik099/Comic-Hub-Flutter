//series card

import 'package:comic_hub/model/character.dart';
import 'package:comic_hub/model/teams.dart';
import 'package:flutter/material.dart';

import '../../../styles/styleSheet.dart';

class MySeriesCard extends StatelessWidget {
  //const MyTeamCard({super.key, this.character, this.teams});
  const MySeriesCard({super.key, this.serie, });
  final Character? serie;
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
              serie?.image?['screen_url']?? '',
              fit: BoxFit.cover,
            ),
          ),
          Text(
            serie?.name ?? 'NULL',
            style: cardTextStyle,
          ),
        ],
      ),
    );

  }
}
