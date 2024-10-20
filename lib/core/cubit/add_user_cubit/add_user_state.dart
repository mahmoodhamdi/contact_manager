sealed class AddUserState {}

final class AddUserInitial extends AddUserState {}

final class AddUserLoading extends AddUserState {}

final class AddUserSuccess extends AddUserState {}

final class AddUserError extends AddUserState {
  final String message;

  AddUserError(this.message);
}
