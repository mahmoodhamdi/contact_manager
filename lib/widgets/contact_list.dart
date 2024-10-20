// widgets/contact_list.dart
import 'package:contact_manager/core/models/user_model.dart';
import 'package:flutter/material.dart';

import 'contact_card.dart';

class ContactList extends StatefulWidget {
  const ContactList({super.key, required this.list});
  final List<UserModel> list;

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Conditional display based on width
        return constraints.maxWidth > 600
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3,
                ),
                itemCount: widget.list.length, // Use actual contact count
                itemBuilder: (context, index) {
                  return ContactCard(
                    user: widget.list[index], // Pass a single user
                  );
                },
              )
            : ListView.builder(
                itemCount: widget.list.length, // Use actual contact count
                itemBuilder: (context, index) {
                  return ContactCard(
                    user: widget.list[index], // Pass a single user
                  );
                },
              );
      },
    );
  }
}
