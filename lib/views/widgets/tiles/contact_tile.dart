import 'package:flutter/material.dart';

import '../../../models/contact.dart';

class ContactTile extends StatelessWidget {
  const ContactTile(
    this.contact, {
    super.key,
    this.onPressed,
    this.onDelete,
    this.tileColor,
    this.onTap,
  });

  final Contact contact;
  final Color? tileColor;
  final void Function()? onPressed;
  final void Function(Contact contact)? onDelete;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return onDelete == null
        ? _buildContactTile(context)
        : _buildDismissibleTile(context);
  }

  Dismissible _buildDismissibleTile(BuildContext context) {
    return Dismissible(
      key: ValueKey(contact.id),
      background: _buildDismissBackground(),
      onDismissed: (direction) => onDelete!(contact),
      child: _buildContactTile(context),
    );
  }

  Widget _buildDismissBackground() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.delete),
          Icon(Icons.delete),
        ],
      ),
    );
  }

  Widget _buildContactTile(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: tileColor ?? Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        onTap: onTap,
        tileColor: Colors.transparent,
        leading: CircleAvatar(child: Text(contact.name[0].toUpperCase())),
        title: Text(contact.name),
        subtitle: Text(contact.contact),
        trailing: IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.edit,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      ),
    );
  }
}
