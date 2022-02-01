import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rama_f/app/controllers/auth_controller.dart';
import 'package:rama_f/app/routes/app_pages.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final authC = Get.find<AuthController>();

  SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignupView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            TextField(
              controller: controller.emailC,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: controller.passC,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () =>
                  authC.signup(controller.emailC.text, controller.passC.text),
              child: const Text("Daftar"),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Sudah punya akun?."),
                TextButton(
                  onPressed: () => Get.back(),
                  child: const Text("Login"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
