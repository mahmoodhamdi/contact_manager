// screens/add_contact_screen.dart
import 'package:contact_manager/core/cubit/add_user_cubit/add_user_cubit.dart';
import 'package:contact_manager/core/models/user_model.dart';
import 'package:contact_manager/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddUserSuccessWidget extends StatelessWidget {
  const AddUserSuccessWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CustomTextField(labelText: 'Name'),
            const SizedBox(height: 16),
            const CustomTextField(labelText: 'Address'),
            const SizedBox(height: 16),
            const CustomTextField(
              labelText: 'Phone',
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                context.read<AddUserCubit>().addUser(
                      UserModel(
                        name: 'Name',
                        address: 'Address',
                        phone: 'Phone',
                      ),
                    );
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Save Contact'),
            ),
          ],
        ),
      ),
    );
  }
}
