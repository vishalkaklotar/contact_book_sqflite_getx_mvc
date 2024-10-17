import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/contact_controller.dart';
import '../../controllers/theme_controller.dart';
import '../../models/contact.dart';
import '../../services/calling_service.dart';
import '../../utility/constants/string_constants.dart';
import '../../utility/routes/route_name.dart';
import '../builders/contact_view_builder.dart';
import '../widgets/button/theme_toggle_button.dart';
import '../widgets/dialogs/contact_dialog.dart';

class ContactsScreen extends StatelessWidget {
  ContactsScreen({super.key});

  final ContactController contactController = Get.put(ContactController());
  final ThemeController themeController = Get.find<ThemeController>();

  Widget _buildEmptyContactMessage(BuildContext context) {
    return Center(
      child: Text(
        'No Contacts\nHit + to add contact',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget _buildContactList(BuildContext context, ContactController controller) {
    return ContactView.builder(
      itemCount: controller.contacts.length,
      itemBuilder: (context, index) => controller.contacts[index],
      onEdit: (contact, index) => _showDialog(context, contact, index),
      onDelete: controller.deleteContact,
      onTap: (contact) => CallingService().call(on: contact.contact),
    );
  }

  void _showDialog(BuildContext context, [Contact? contact, int? index]) {
    assert(contact == null || index != null);
    showDialog(
      context: context,
      builder: (context) {
        return ContactDialog(
          contact: contact,
          onSubmit: contact == null
              ? contactController.addContact
              : (contact) => contactController.updateContact(contact, index!),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> appBarAction = [];

    CupertinoButton searchButton = CupertinoButton(
      onPressed: () => Get.toNamed(search),
      child: const Icon(CupertinoIcons.search),
    );

    Widget themeToggleButton = GetX<ThemeController>(
      builder: (_) {
        return ThemeToggleButton(
          darkMode: themeController.isDarkMode,
          onThemeChange: themeController.toggleTheme,
        );
      },
    );

    appBarAction.add(searchButton);
    appBarAction.add(themeToggleButton);

    AppBar appBar = AppBar(
      title: const Text(appTitle),
      actions: appBarAction..add(const SizedBox(width: 8)),
    );

    FloatingActionButton floatingActionButton = FloatingActionButton(
      onPressed: () => _showDialog(context),
      child: const Icon(Icons.add),
    );

    return Scaffold(
      appBar: appBar,
      floatingActionButton: floatingActionButton,
      body: GetX<ContactController>(
        builder: (controller) {
          if (controller.contacts.isEmpty) {
            return _buildEmptyContactMessage(context);
          }
          return _buildContactList(context, controller);
        },
      ),
    );
  }
}
