import 'package:bloc/bloc.dart';
import 'package:contact_manager/core/cubit/view_user_cubit/view_user_state.dart';
import 'package:contact_manager/core/models/user_model.dart';
import 'package:contact_manager/core/utils/constants.dart';
import 'package:hive/hive.dart';

class ViewUserCubit extends Cubit<ViewUserState> {
  ViewUserCubit() : super(ViewUserInitial());

  void getUser() {
    var usersBox = Hive.box<UserModel>(kBox);
    List<UserModel> users = usersBox.values.toList();
    emit(ViewUserSuccess(users: users));
  }
}
