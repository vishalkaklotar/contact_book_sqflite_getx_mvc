import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showUndoDeleteSnackBar({required void Function() onUndo}) {
  Get.snackbar('Danger', 'Contact Deleting',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red.withOpacity(0.5),
      margin: const EdgeInsets.all(8),
      mainButton: TextButton(
        child: const Text('UNDO'),
        onPressed: () {
          Get.back();
          onUndo();
        },
      ),
      icon: const Icon(
        Icons.warning,
        color: Colors.orange,
      ));
}
