import 'package:comic_hub/model/character.dart';
import 'package:comic_hub/model/teams.dart';
import 'package:flutter/material.dart';

import '../../../styles/styleSheet.dart';

class MyIssuesCard extends StatelessWidget {
  //const MyTeamCard({super.key, this.character, this.teams});
  const MyIssuesCard({super.key, this.issue, });
  final Character? issue;
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
              issue?.image?['screen_url']?? '',
              fit: BoxFit.cover,
            ),
          ),
          Text(
            issue?.name ?? 'NULL',
            style: cardTextStyle,
          ),
        ],
      ),
    );

  }
}
