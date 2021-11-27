import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:on_boarding_screen/first_screen.dart';
import 'package:on_boarding_screen/on_boarding_info.dart';

import 'on_boarding_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = OnBoardingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
                scrollDirection: Axis.vertical,
                controller: controller.pageController,
                onPageChanged: controller.selectedPageIndex,
                itemCount: controller.onBoardingPages.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                          controller.onBoardingPages[index].imageAssets),
                      const SizedBox(height: 32),
                      Text(
                        controller.onBoardingPages[index].title,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 32),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Text(
                          controller.onBoardingPages[index].description,
                          style: const TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  );
                }),
            Positioned(
              left: 20,
              bottom: 30,
              child: Obx(() {
                return Row(
                  children: List.generate(
                      controller.onBoardingPages.length,
                      (index) => Container(
                            margin: const EdgeInsets.all(4),
                            height: 12,
                            width: 12,
                            decoration: BoxDecoration(
                              color: controller.selectedPageIndex.value == index
                                  ? Colors.red
                                  : Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          )),
                );
              }),
            ),
            Obx(() {
              return Positioned(
                  right: 20,
                  bottom: 20,
                  child: FloatingActionButton(
                    onPressed: () {
                      controller.isLAstPage
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FirstScreen()))
                          : controller.nextPages();
                    },
                    child: Text(controller.isLAstPage ? "Start" : "Next"),
                  ));
            })
          ],
        ),
      ),
    );
  }
}
