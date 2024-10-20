// screens/add_contact_screen.dart
import 'package:contact_manager/core/cubit/add_user_cubit/add_user_cubit.dart';
import 'package:contact_manager/core/cubit/view_user_cubit/view_user_cubit.dart';
import 'package:contact_manager/core/models/user_model.dart';
import 'package:contact_manager/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddUserSuccessWidget extends StatefulWidget {
  const AddUserSuccessWidget({
    super.key,
  });

  @override
  State<AddUserSuccessWidget> createState() => _AddUserSuccessWidgetState();
}

class _AddUserSuccessWidgetState extends State<AddUserSuccessWidget> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, address, phone;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                labelText: 'Name',
                onSaved: (value) {
                  title = value;
                },
                maxLines: 1,
                maxLength: 30,
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                labelText: 'Address',
                maxLines: 5,
                maxLength: 200,
                keyboardType: TextInputType.streetAddress,
                onSaved: (value) {
                  address = value;
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                labelText: 'Phone',
                keyboardType: TextInputType.phone,
                maxLines: 1,
                maxLength: 11,
                onSaved: (value) {
                  phone = value;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  addNoteModel(context);
                  context.read<ViewUserCubit>().getUser();
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
      ),
    );
  }

  void addNoteModel(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var userModel = UserModel(
        name: title!,
        address: address!,
        phone: phone!,
      );
      BlocProvider.of<AddUserCubit>(context).addUser(userModel);
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
