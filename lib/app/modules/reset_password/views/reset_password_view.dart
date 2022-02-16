import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rama_f/app/controllers/auth_controller.dart';

import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  final authC = Get.find<AuthController>();

  ResetPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Screen'),
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
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () => authC.resetPassword(
                controller.emailC.text,
              ),
              child: const Text("Reset"),
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
