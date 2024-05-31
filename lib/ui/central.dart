import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/authentication_controller.dart';
import 'pages/authentication/login_page.dart';
import 'pages/content/user_list_page.dart';

class Central extends StatelessWidget {
  const Central({super.key});

  //TODO change the logic to check if the user is logged
  //   Widget build(BuildContext context) {
  //   return StreamBuilder(
  //       stream: FirebaseAuth.instance.authStateChanges(),
  //       builder: (context, snapshot) {
  //         if (snapshot.hasData) {
  //           return const UserListPage();
  //         } else {
  //           return const LoginPage();
  //         }
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    AuthenticationController authenticationController = Get.find();
    return Obx(() => authenticationController.isLogged
        ? const UserListPage()
        : const LoginPage());
  }
}
