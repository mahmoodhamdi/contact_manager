// widgets/contact_list.dart
import 'package:flutter/material.dart';
import 'contact_card.dart';

class ContactList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3,
            ),
            itemCount: 10, // Replace with actual contact count
            itemBuilder: (context, index) {
              return ContactCard();
            },
          );
        } else {
          return ListView.builder(
            itemCount: 10, // Replace with actual contact count
            itemBuilder: (context, index) {
              return ContactCard();
            },
          );
        }
      },
    );
  }
}
