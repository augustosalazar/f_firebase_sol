import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/datasources/remote/authentication/authentication_fire_source.dart';
import '../data/datasources/remote/authentication/i_authentication_source.dart';
import '../data/datasources/remote/users/i_remote_user_source.dart';
import '../data/datasources/remote/users/remote_user_source.dart';
import '../data/repositories/repository.dart';
import '../domain/repositories/i_repository.dart';
import '../domain/use_case/authentication_usecase.dart';
import '../domain/use_case/user_usecase.dart';
import 'central.dart';
import 'controller/authentication_controller.dart';
import 'controller/user_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO change the source to AuthenticationFireSource
    Get.put<IAuthenticationSource>(AuthenticationFireSource());
    //TODO change the source to RemoteFirebaseUserSource
    Get.put<IRemoteUserSource>(RemoteUserSource());
    Get.put<IRepository>(Repository(Get.find(), Get.find()));
    Get.put(AuthenticationUseCase(Get.find()));
    Get.put(UserUseCase(Get.find()));
    Get.put(AuthenticationController());
    Get.put(UserController());

    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Firebase demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Central());
  }
}
