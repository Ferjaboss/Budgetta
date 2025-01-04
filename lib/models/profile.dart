import 'package:hive/hive.dart';

part 'profile.g.dart';

@HiveType(typeId: 0)
class Profile extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  double balance;

  Profile({required this.name, required this.balance});
}
