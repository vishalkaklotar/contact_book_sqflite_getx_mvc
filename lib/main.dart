import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/theme_controller.dart';
import 'utility/routes/route_name.dart';
import 'utility/routes/routes.dart';

void main() {
  Get.put(ThemeController());
  runApp(const ContactBookApp());
}

class ContactBookApp extends StatelessWidget {
  const ContactBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<ThemeController>(
      builder: (controller) {
        return GetMaterialApp(
          title: 'Contact Book',
          theme: controller.themeData,
          debugShowCheckedModeBanner: false,
          getPages: getPages,
          initialRoute: contacts,
        );
      },
    );
  }
}
