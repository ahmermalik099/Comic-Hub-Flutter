import 'package:comic_hub/model/character.dart';
import 'package:comic_hub/model/teams.dart';
import 'package:flutter/material.dart';

import '../../../styles/styleSheet.dart';

class MyHomeCard extends StatelessWidget {
  //const MyHomeCard({super.key, this.character, this.teams});
  const MyHomeCard({
    super.key,
    this.character,
  });
  final Character? character;
  //final Teams? teams;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      width: 200,
      height: 200,
      margin: const EdgeInsets.all(10),
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            width: 200,
            height: 200,
            child: Image.network(
              
              character?.image?['screen_url'] ?? '',
              fit: BoxFit.cover,
              
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Text(
                character?.name ?? '',
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
