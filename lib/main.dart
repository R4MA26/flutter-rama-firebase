import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rama_f/app/controllers/auth_controller.dart';
import 'package:rama_f/app/modules/home/views/home_view.dart';
import 'package:rama_f/app/modules/login/views/login_view.dart';
import 'package:rama_f/app/utils/loading.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyCs5HcAq1ltnr9Jw0q6ohB1yxA0jvUdB_I',
        appId: '1:536153284914:web:16d99f8864c3f5c59db72b',
        messagingSenderId: '536153284914',
        projectId: 'rama-firebase',
        storageBucket: 'rama-firebase.appspot.com',
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authC = Get.put(AuthController(), permanent: true);
    return StreamBuilder<User?>(
      stream: authC.streamAuthStatus,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          print(snapshot.data);
          return GetMaterialApp(
            title: "Application",
            initialRoute:
                snapshot.data != null && snapshot.data!.emailVerified == true
                    ? Routes.HOME
                    : Routes.LOGIN,
            getPages: AppPages.routes,
            // home: snapshot.data != null ? HomeView() : LoginView(),
          );
        }
        return const LoadingView();
      },
    );
  }
}
