import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String address;
  @HiveField(2)
  final String phone;

  UserModel({required this.name, required this.address, required this.phone});
}
