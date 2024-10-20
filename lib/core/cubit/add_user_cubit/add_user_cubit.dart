import 'package:bloc/bloc.dart';
import 'package:contact_manager/core/cubit/add_user_cubit/add_user_state.dart';
import 'package:contact_manager/core/models/user_model.dart';
import 'package:contact_manager/core/utils/constants.dart';
import 'package:hive/hive.dart';

class AddUserCubit extends Cubit<AddUserState> {
  AddUserCubit() : super(AddUserInitial());
  void addUser(UserModel user) async {
    emit(AddUserLoading());
    try {
      var usersBox = Hive.box<UserModel>(kBox);
      await usersBox.add(user);
      emit(AddUserSuccess());
    } catch (e) {
      emit(AddUserError(e.toString()));
    }
  }
}
