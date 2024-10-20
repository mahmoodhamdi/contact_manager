// screens/add_contact_screen.dart
import 'package:contact_manager/core/cubit/add_user_cubit/add_user_cubit.dart';
import 'package:contact_manager/core/cubit/add_user_cubit/add_user_state.dart';
import 'package:contact_manager/core/cubit/view_user_cubit/view_user_cubit.dart';
import 'package:contact_manager/core/models/user_model.dart';
import 'package:contact_manager/core/utils/constants.dart';
import 'package:contact_manager/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddContactScreen extends StatelessWidget {
  const AddContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewUserCubit = context.read<ViewUserCubit>();
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Contact'),
      ),
      body: BlocProvider<AddUserCubit>(
        create: (context) => AddUserCubit(),
        child: BlocConsumer<AddUserCubit, AddUserState>(
          listener: (context, state) {
            if (state is AddUserError) {
              scaffoldMessenger.showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
            if (state is AddUserSuccess) {
              viewUserCubit.getUser();
              messageIfUndo(
                context,
                viewUserCubit,
                scaffoldMessenger,
                'Note added successfully',
              );
            }
          },
          builder: (context, state) {
            if (state is AddUserLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AddUserError) {
              return Center(child: Text(state.message));
            }

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
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text('Save Contact'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
