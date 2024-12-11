import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:will_pop_demo/get_main/pages/second/second.dart';

import 'controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomeView')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed(kRouteSecond);
          },
          child: const Text('to second'),
        ),
      ),
    );
  }
}
