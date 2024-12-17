import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:will_pop_demo/get_main/pages/second/second.dart';
import 'package:will_pop_demo/get_main/pages/third/third.dart';
import 'package:will_pop_demo/widgets.dart';

class SecondView extends GetView<SecondController> {
  const SecondView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: PopScopeFuncAppBar(
        title: 'SecondView',
        onPopInvoked: (didPop, result) async {
          if (controller.canPop.value) {
            Get.back();
            return;
          }
          await Get.dialog(
            AlertDialog(
              title: const Text('title'),
              content: const Text('`onPopInvokedWithResult` content'),
              actions: [
                TextButton(
                  child: const Text('back'),
                  onPressed: () {
                    Get.back();
                  },
                )
              ],
            ),
          );
        },
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('SecondView'),
            Obx(
              () => Text('`PopScope.canPop`:  ${controller.canPop.value}'),
            ),
            ElevatedButton(
              onPressed: () {
                print(Get.theme);
                // Get.toNamed(kRouteThird);
              },
              child: const Text('to third'),
            ),
            ElevatedButton(
              onPressed: () {
                controller.canPop.toggle();
              },
              child: const Text('changed canPop'),
            ),
          ],
        ),
      ),
    );
  }
}
