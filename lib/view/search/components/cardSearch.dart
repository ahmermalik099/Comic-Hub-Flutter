import 'package:comic_hub/model/character.dart';
import 'package:comic_hub/model/teams.dart';
import 'package:flutter/material.dart';

import '../../../styles/styleSheet.dart';

class MySearchCard extends StatelessWidget {
  //const MyHomeCard({super.key, this.character, this.teams});
  const MySearchCard({super.key, this.search, });
  final Character? search;
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
              search?.image?['screen_url'] ?? '',
              fit: BoxFit.cover,
            ),
          ),
          Text(
            search?.name?? '',
            style: cardTextStyle,
          ),
        ],
      ),
    );

  }
}
