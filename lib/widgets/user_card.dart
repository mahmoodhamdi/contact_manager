// widgets/contact_card.dart
import 'package:contact_manager/core/models/user_model.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        minTileHeight: 80,
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
          child: Text(
            "${user.name[0]}${user.name[1]}".toUpperCase(),
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
        title: Text(
          user.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.address,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
            Text(
              user.phone,
              maxLines: 1,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
        // trailing:
        // IconButton(
        //   icon: Icon(Icons.phone, color: Theme.of(context).primaryColor),
        //   onPressed: () {
        //     log('Calling ${user.phone}');
        //   },
        // ),
      ),
    );
  }
}
