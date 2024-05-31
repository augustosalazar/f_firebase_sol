import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import '../../domain/use_case/authentication_usecase.dart';

class AuthenticationController extends GetxController {
  final logged = false.obs;

  bool get isLogged => logged.value;

  Future<bool> login(email, password) async {
    logInfo('Controller Login');
    var rta = await Get.find<AuthenticationUseCase>().login(email, password);
    logged.value = rta;
    return rta;
  }

  Future<bool> signUp(email, password) async {
    logInfo('Controller Sign Up');
    await Get.find<AuthenticationUseCase>().signUp(email, password);
    return true;
  }

  Future<void> logOut() async {
    logInfo('Controller Log Out');
    await Get.find<AuthenticationUseCase>().logOut();
    logged.value = false;
  }
}
