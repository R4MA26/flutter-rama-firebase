import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  TextEditingController emailC =
      TextEditingController(text: "ramaismaya25@gmail.com");
  TextEditingController passC = TextEditingController(text: "qwerty123");

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    super.onClose();
  }
}
