import 'package:comic_hub/controller/comic_controller.dart';
import 'package:comic_hub/view/Home/components/card.dart';
import 'package:comic_hub/view/Home/components/cardMovies.dart';
import 'package:comic_hub/view/Home/components/cardSeries.dart';
import 'package:comic_hub/view/Home/components/cardTeams.dart';
// import 'package:comic_hub/view/Home/components/cardIssues.dart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../styles/styleSheet.dart';


import 'package:comic_hub/view/Home/home.dart';
import 'package:comic_hub/view/NavBar/bottomNavBar.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';

//import 'camera_preview.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      leading: const Icon(Icons.arrow_back_ios),
      title: const Text("Draggable Home"),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
      ],
      headerWidget: headerWidget(context),
      headerBottomBar: headerBottomBarWidget(),
      body: [

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
      color: Colors.blue,
      child: Center(
        child: Text(
          "Title",
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: Colors.white70),
        ),
      ),
    );
  }

}