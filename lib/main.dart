import 'package:comic_hub/view/Home/home.dart';
import 'package:comic_hub/view/NavBar/bottomNavBar.dart';
import 'package:comic_hub/view/details/details.dart';
import 'package:comic_hub/view/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
// import 'dart:ffi';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const LoginScreen(),
        ),
        GetPage(
          name: '/home',
          page: () => HomeScreen(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: '/bottomBar',
          page: () =>NavPage(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: '/details',
          page: () => DetailsScreen(),
          transition: Transition.fadeIn,
        ),
        //come
      ],
    );
  }
}
