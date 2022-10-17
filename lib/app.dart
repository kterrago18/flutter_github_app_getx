import 'package:flutter/material.dart';
import 'package:flutter_github_app_getx/presentation/pages/home_page.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class FlutterGithubApp extends StatelessWidget {
  const FlutterGithubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreenView(
        navigateRoute: const HomePage(),
        pageRouteTransition: PageRouteTransition.CupertinoPageRoute,
        duration: 5000,
        imageSize: 150,
        imageSrc: "assets/github_logo.png",
        text: "GitHub Flutter",
        textType: TextType.TyperAnimatedText,
        textStyle: const TextStyle(
          fontSize: 40.0,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}