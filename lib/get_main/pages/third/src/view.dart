import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class ThirdView extends GetView<ThirdController> {
  const ThirdView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Obx(
          () => PopScope(
            canPop: controller.canPop.value,
            onPopInvokedWithResult: (didPop, result) async {
              print(' ThirdView `onPopInvokedWithResult` didPop: $didPop, result: $result');
              if (didPop) {
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
            child: AppBar(
              title: const Text('ThirdView'),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('ThirdView'),
            Obx(
              () => Text('`PopScope.canPop`:  ${controller.canPop.value}'),
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
