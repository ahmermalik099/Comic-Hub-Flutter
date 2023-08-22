import 'package:comic_hub/controller/comic_controller.dart';
import 'package:comic_hub/view/Home/components/card.dart';
import 'package:comic_hub/view/Home/components/cardMovies.dart';
import 'package:comic_hub/view/Home/components/cardSeries.dart';
import 'package:comic_hub/view/Home/components/cardTeams.dart';
import 'package:comic_hub/view/profile/settings.dart';
// import 'package:comic_hub/view/Home/components/cardIssues.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';
import 'package:get/get.dart';

import '../../styles/styleSheet.dart';


import 'package:comic_hub/view/Home/home.dart';
import 'package:comic_hub/view/NavBar/bottomNavBar.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';

//import 'camera_preview.dart';



class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  final _controller = SideMenuController();
  int _currentIndex = 0;

  final List<Widget> tabBarPages = [
    // ProfilePage(),
    //SettingPage()
    Text('1'),
    SettingPage(),
    Text('2'),
    Text('3'),
    Text('4'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Row(
        children: [
          SideMenu(
            controller: _controller,
            backgroundColor: Colors.white10,
            mode: SideMenuMode.compact,
            builder: (data) {
              return SideMenuData(
                header: const Text('Profile'),
                items: [
                  SideMenuItemDataTile(
                    isSelected: _currentIndex == 0,
                    onTap: () => setState(() => _currentIndex = 0),
                    title: 'User Profile',
                    hoverColor: Colors.blue,
                    titleStyle: const TextStyle(color: Colors.white),
                    icon: const Icon(Icons.home_outlined),
                    selectedIcon: const Icon(Icons.home),
                    badgeContent: const Text(
                      '23',
                      style: TextStyle(
                        fontSize: 8,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SideMenuItemDataTile(
                    isSelected: _currentIndex == 1,
                   // onTap: () => setState(() => _currentIndex = 1),
                    onTap: () => setState(() => _currentIndex = 1),
                    title: 'Settings',
                    selectedTitleStyle:
                    const TextStyle(fontWeight: FontWeight.w700,color: Colors.yellow),
                    icon: const Icon(Icons.table_bar_outlined),
                    selectedIcon: const Icon(Icons.settings),
                    titleStyle: const TextStyle(color: Colors.deepPurpleAccent),
                  ),

                  const SideMenuItemDataTitle(
                    title: 'Account',
                    textAlign: TextAlign.center,
                  ),
                  SideMenuItemDataTile(
                    isSelected: _currentIndex == 2,
                    onTap: () => setState(() => _currentIndex = 2),
                    title: 'Item 3',
                    icon: const Icon(Icons.play_arrow),
                  ),
                  SideMenuItemDataTile(
                    isSelected: _currentIndex == 3,
                    onTap: () => setState(() => _currentIndex = 3),
                    title: 'Item 4',
                    icon: const Icon(Icons.car_crash),
                  ),
                ],
                footer: Text('$_currentIndex.toString()'),
              );
            },
          ),

          //Main body
          Expanded(
              child: tabBarPages[_currentIndex],
          )

        ],
      ),
    );

  }
}



class UserDetails extends StatefulWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {

  String email = 'Your Name';
  String phoneNumber = '+123 456 7890';

  void _editProfile() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController emailController =
        TextEditingController(text: email);
        TextEditingController phoneController =
        TextEditingController(text: phoneNumber);

        return AlertDialog(
          title: Text('Edit Profile'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(labelText: 'Phone Number'),
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                setState(() {
                  email = emailController.text;
                  phoneNumber = phoneController.text;
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 100,
                  backgroundImage: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHFXcvkgaVetaFH-J4M2yOrIUCBCUVRhkMcA&usqp=CAU').image,
                ),
                SizedBox(height: 10),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text(email),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text(phoneNumber),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _editProfile,
                  child: Text('Edit Profile'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}



