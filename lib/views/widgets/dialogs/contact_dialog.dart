import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/contact.dart';
import '../inputs/text_input.dart';

class ContactDialog extends StatelessWidget {
  ContactDialog({
    super.key,
    this.contact,
    this.onSubmit,
  });

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final Contact? contact;
  final Future<void> Function(Contact contact)? onSubmit;

  @override
  Widget build(BuildContext context) {
    _initializeControllers();

    return AlertDialog(
      title: Text(contact == null ? 'Add Contact' : 'Update Contact'),
      content: _buildContent(),
      actions: _buildActions(),
    );
  }

  void _initializeControllers() {
    _nameController.text = contact?.name ?? '';
    _contactController.text = contact?.contact ?? '';
  }

  Column _buildContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextInput(
          labelText: 'Name',
          controller: _nameController,
          autofocus: true,
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 8),
        TextInput(
          labelText: 'Contact',
          controller: _contactController,
          keyboardType: TextInputType.phone,
        ),
      ],
    );
  }

  List<Widget> _buildActions() {
    return [
      CupertinoButton(
        child: const Text('Cancel'),
        onPressed: () => Get.back(),
      ),
      CupertinoButton(
        child: const Text('Save'),
        onPressed: () => _onSavePressed(),
      ),
    ];
  }

  Future<void> _onSavePressed() async {
    if (onSubmit != null) {
      final newContact = Contact(
        id: contact?.id,
        name: _nameController.text.trim(),
        contact: _contactController.text.trim(),
      );
      await onSubmit!(newContact);
      Get.back();
    }
  }
}
