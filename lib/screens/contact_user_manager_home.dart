// screens/contact_manager_home.dart
import 'package:contact_manager/core/cubit/view_user_cubit/view_user_cubit.dart';
import 'package:contact_manager/core/cubit/view_user_cubit/view_user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/users_list.dart';
import 'add_contact_user_screen.dart';

class ContactManagerHome extends StatefulWidget {
  const ContactManagerHome({super.key});

  @override
  State<ContactManagerHome> createState() => _ContactManagerHomeState();
}

class _ContactManagerHomeState extends State<ContactManagerHome> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Manager'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.file_download),
            onPressed: () {
              // context.read<ViewUserCubit>().exportToExcel();
            },
            tooltip: 'Export to Excel',
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<ViewUserCubit, ViewUserState>(
          builder: (context, state) {
            if (state is ViewUserSuccess) {
              return ContactList(
                list: state.users,
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddContactScreen()),
          );
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
