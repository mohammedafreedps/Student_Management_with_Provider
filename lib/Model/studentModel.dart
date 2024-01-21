import 'package:hive/hive.dart';

part 'studentModel.g.dart';

@HiveType(typeId: 1)
class studentModel {
  @HiveField(0)
  String name;

  @HiveField(1)
  int age;

  @HiveField(2)
  int rollNo;

  @HiveField(3)
  String division;

  @HiveField(4)
  String imagePath;

  studentModel(
      {required this.name,
      required this.age,
      required this.rollNo,
      required this.division,
      required this.imagePath});
}
