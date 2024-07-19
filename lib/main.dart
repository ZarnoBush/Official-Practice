import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:official_practice/Firestore/preview.dart';
import 'package:official_practice/Firestore/registration_page.dart';
import 'package:official_practice/dataView.dart';
import 'package:official_practice/home.dart';
import 'package:official_practice/splash.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => SplashScreen(),
        ),
        GetPage(
          name: '/home',
          page: () => HomePage(),
          transition: Transition.zoom,
        ),
        GetPage(
          name: '/dataView',
          page: () => DataViewPage(),
        ),
        GetPage(
          name: '/welcome',
          page: () => RegistrationPage(),
        ),
        GetPage(
          name: '/preview',
          page: () => PreviewPage(),
        ),
      ],
    );
  }
}
