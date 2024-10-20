// widgets/contact_card.dart
import 'dart:developer';

import 'package:contact_manager/core/models/user_model.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key, required this.user});
  final UserModel user; // Change from list to single user

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
          child: Text(
            'JD', // Replace with actual initials
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
        title: Text(user.name),
        subtitle: Text(user.address), // Replace with actual address
        trailing: IconButton(
          icon: Icon(Icons.phone, color: Theme.of(context).primaryColor),
          onPressed: () {
            log('Calling ${user.name}');
          },
        ),
      ),
    );
  }
}
