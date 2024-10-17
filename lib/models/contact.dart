import 'dart:convert';

class Contact {
  int? id;
  String name;
  String contact;

  Contact({
    this.id,
    required this.name,
    required this.contact,
  });

  factory Contact.fromJson(Map json) {
    int id = json['id'] ?? 0;
    String name = json['name'];
    String contact = json['contact'];

    return Contact(
      id: id,
      name: name,
      contact: contact,
    );
  }

  Contact copyWith({
    int? id,
    String? name,
    String? contact,
  }) {
    return Contact(
      id: id ?? this.id,
      name: name ?? this.name,
      contact: contact ?? this.contact,
    );
  }

  Map<String, dynamic> toMap({bool removeId = false}) {
    return {
      'id': removeId ? null : id,
      'name': name,
      'contact': contact,
    };
  }

  @override
  String toString() {
    return jsonEncode(toMap());
  }
}
