import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/pages/home_page.dart';
import 'package:training_app/pages/video_info_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Training App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      getPages: [
        GetPage(name: VideoInfoPage.tag, page: () => const VideoInfoPage()),
      ],
    );
  }
}