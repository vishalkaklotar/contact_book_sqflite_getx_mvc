import 'dart:async';

import 'package:contact_book_sqflite_getx_mvc/services/database_service.dart';
import 'package:contact_book_sqflite_getx_mvc/utility/snackbars/deleted_undo_snackbar.dart';
import 'package:get/get.dart';

import '../models/contact.dart';
class ContactController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    DatabaseService.initialize().then((value) {
      _databaseService = value;
      fetchContact();
    });
  }

  DatabaseService? _databaseService;

  ({int index, Contact contact})? deletedContact;

  final RxList<Contact> _contacts = <Contact>[].obs;

  List<Contact> get contacts => _contacts;

  void fetchContact() async {
    List<Map<String, Object?>> contacts = await _databaseService?.fetch() ?? [];
    _contacts.value = contacts.map(_toContact).toList();
  }

  Future<void> addContact(Contact contact) async {
    int? newLength = await _databaseService?.addContact(contact);
    Contact newContact = contact.copyWith(id: newLength);
    _contacts.add(newContact);
  }

  Future<void> updateContact(Contact contact, int index) async {
    await _databaseService?.updateContact(contact);

    _contacts[index] = contact;
  }

  Timer? _undoTimer;

  Future<void> deleteContact(Contact contact, int index) async {
    _contacts.removeAt(index);
    if (deletedContact != null) {
      _databaseService?.deleteContact(deletedContact!.contact.id!);
    }
    deletedContact = (index: index, contact: contact);
    _showUndoOption();
  }

  void _showUndoOption() {
    print('log::::::::::: $_undoTimer');
    if (_undoTimer == null || !_undoTimer!.isActive) {
      showUndoDeleteSnackBar(onUndo: _onUndoDelete);
    }
    _undoTimer?.cancel();
    _undoTimer = Timer(const Duration(seconds: 3), () {
      _databaseService?.deleteContact(deletedContact!.contact.id!);
      deletedContact = null;
      _undoTimer?.cancel();
    });
  }

  void _onUndoDelete() {
    _contacts.insert(deletedContact!.index, deletedContact!.contact);
    deletedContact = null;
    _undoTimer?.cancel();
  }

  Contact _toContact(Map<String, Object?> contact) {
    return Contact.fromJson(contact);
  }
}
