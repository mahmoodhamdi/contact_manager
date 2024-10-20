import 'package:contact_manager/core/models/user_model.dart';

sealed class ViewUserState {}

final class ViewUserInitial extends ViewUserState {}

final class ViewUserSuccess extends ViewUserState {
  final List<UserModel> users;

  ViewUserSuccess({required this.users});
}
