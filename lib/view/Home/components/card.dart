import 'package:comic_hub/model/character.dart';
import 'package:comic_hub/model/teams.dart';
import 'package:flutter/material.dart';

import '../../../styles/styleSheet.dart';

class MyHomeCard extends StatelessWidget {
  //const MyHomeCard({super.key, this.character, this.teams});
  const MyHomeCard({
    super.key,
    this.character,
    // this.color = Colors.blue,
  });
  final Color color = Colors.black;
  final Character? character;
  //final Teams? teams;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 4.5,
      margin: EdgeInsets.only(bottom: 3, right: 4, top: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(.05),
              blurRadius: 5,
              spreadRadius: 5)
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            character?.image?['original_url'] == null ||
                    character?.image?['original_url'] == ""
                ? Image.asset(
                    'assets/bg.jpeg',
                    fit: BoxFit.cover,
                    //width: Image.asset("images/img2.png").width,
                    //height: Image.asset("images/img2.png").height,
                  )
                : FadeInImage.assetNetwork(
                    placeholder: 'assets/bg.jpeg',
                    image: character!.image!['original_url']!,
                    fit: BoxFit.fitHeight,
                  ),

// .network(character!.image!['screen_url']!,
//                     fit: BoxFit.cover),
            // character?.image?['screen_url'] == null ||
            //         character?.image?['screen_url'] == ""
            //     ? Center(
            //         child: CircularProgressIndicator(),
            //       )
            //     : Container(),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    // Color.fromARGB(255, 235, 235, 238).withOpacity(.4),
                    color.withOpacity(.4),
                    Colors.transparent,
                    color.withOpacity(.9),
                  ],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      character?.name ?? "",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
