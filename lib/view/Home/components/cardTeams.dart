import 'package:comic_hub/model/character.dart';
import 'package:comic_hub/model/teams.dart';
import 'package:flutter/material.dart';

class MyTeamCard extends StatelessWidget {
  //const MyTeamCard({super.key, this.character, this.teams});
  const MyTeamCard({super.key, this.team, });
  final Character? team;
  //final Teams? teams;
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
              //teams!.image['screen_url']!,
              team?.image?['screen_url']?? '',
              fit: BoxFit.cover,
            ),
          ),
          Text(
            //teams!.name,
            team?.name ?? 'NULL',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );

  }
}
