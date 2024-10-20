// screens/add_contact_screen.dart
import 'package:contact_manager/core/cubit/add_user_cubit/add_user_cubit.dart';
import 'package:contact_manager/core/cubit/add_user_cubit/add_user_state.dart';
import 'package:contact_manager/core/cubit/view_user_cubit/view_user_cubit.dart';
import 'package:contact_manager/core/utils/constants.dart';
import 'package:contact_manager/widgets/add_user_success_widget.dart';
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
            if (state is AddUserSuccess) {
              return const AddUserSuccessWidget();
            } else if (state is AddUserError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
