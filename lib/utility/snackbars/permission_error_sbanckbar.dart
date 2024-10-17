import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showPermissionErrorSnackBar({required void Function() onSetting}) {
  Get.snackbar('No Permission', 'you don\'t allow permission to call',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red.withOpacity(0.5),
      margin: const EdgeInsets.all(8),
      mainButton: TextButton(
        child: const Text('Setting'),
        onPressed: () {
          Get.back();
          onSetting();
        },
      ),
      icon: const Icon(
        Icons.warning,
        color: Colors.orange,
      ));
}
