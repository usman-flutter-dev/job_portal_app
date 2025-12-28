import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:job_app/app_imports.dart';

class AuthController extends GetxController {
  Future<void> checkLoginStatusAndRedirect() async {
    Future.delayed(Duration(microseconds: 400));
    User? user = await FirebaseAuth.instance.authStateChanges().first;
    if (user == null) {
      Get.offAllNamed(AppRoutes.registerScreen);
    } else {
      Get.offAllNamed(AppRoutes.jobsList);
    }
  }

  @override
  void onReady() {
    super.onReady();
    checkLoginStatusAndRedirect();
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }
}
