// screens/contact_manager_home.dart
import 'package:flutter/material.dart';
import '../widgets/contact_list.dart';
import 'add_contact_screen.dart';

class ContactManagerHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Manager'),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.file_download),
            onPressed: () {
              // TODO: Implement export functionality
            },
            tooltip: 'Export to Excel',
          ),
        ],
      ),
      body: SafeArea(
        child: ContactList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddContactScreen()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
