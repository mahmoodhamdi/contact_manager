import 'package:contact_manager/core/cubit/view_user_cubit/view_user_cubit.dart';
import 'package:contact_manager/core/theme/app_theme.dart';
import 'package:contact_manager/screens/contact_user_manager_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ViewUserCubit>(
      create: (context) => ViewUserCubit()..getUser(),
      child: MaterialApp(
        title: 'Contact Manager',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: const ContactManagerHome(),
      ),
    );
  }
}
