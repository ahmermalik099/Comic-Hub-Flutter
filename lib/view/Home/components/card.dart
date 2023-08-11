import 'package:comic_hub/model/character.dart';
import 'package:flutter/material.dart';

class MyHomeCard extends StatelessWidget {
  const MyHomeCard({super.key, required this.character});
  final Character character;
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
              character.image['screen_url']!,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            character.name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
    ;
  }
}
