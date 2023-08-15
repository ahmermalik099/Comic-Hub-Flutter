import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: width,
            height: height,
            child: Image.network(
              'https://i.pinimg.com/750x/25/41/e6/2541e6074f6863da1a2dd0f889a222fe.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed('/bottomBar');
                //Get.toNamed('/home');
              },
              child: const Text('Login'),
            )
          )
        ],
      ),
    );
  }
}
