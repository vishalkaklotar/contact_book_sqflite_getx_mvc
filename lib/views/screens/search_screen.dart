import 'package:contact_book_sqflite_getx_mvc/controllers/search_controller.dart';
import 'package:contact_book_sqflite_getx_mvc/views/widgets/inputs/text_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/calling_service.dart';
import '../builders/contact_view_builder.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchContactController());
    final searchController = Get.find<SearchContactController>();

    return Scaffold(
      appBar: AppBar(
        title: TextInput(
          autofocus: true,
          onChanged: searchController.search,
          decoration: const InputDecoration.collapsed(hintText: 'Search'),
        ),
      ),
      body: GetX<SearchContactController>(
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(controller),
              const SizedBox(height: 8),
              _buildContactList(context, controller),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeader(SearchContactController controller) {
    return SizedBox(
      height: 46,
      child: ListTile(
        title: const Text('Contacts'),
        trailing: Text('${controller.searchResult.length} Found'),
      ),
    );
  }

  Widget _buildContactList(
      BuildContext context, SearchContactController controller) {
    return Expanded(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).cardColor,
        ),
        child: controller.searchResult.isNotEmpty
            ? ContactView.builder(
                itemBuilder: (context, index) => controller.searchResult[index],
                tileColor: Theme.of(context).scaffoldBackgroundColor,
                itemCount: controller.searchResult.length,
                onTap: (contact) => CallingService().call(on: contact.contact))
            : const Center(child: Text('No Contact Found')),
      ),
    );
  }
}
