import 'package:hive/hive.dart';
import 'package:studentmanagementgetx/Consts/boxes.dart';
import 'package:studentmanagementgetx/Model/studentModel.dart';

void putToHive(
    {required String name,
    required int age,
    required int rollNo,
    required String division,
    required String imagePath}) {
  studentDataListBox.put(DateTime.now().toString(),
      studentModel(name: name, age: age, rollNo: rollNo, division: division,imagePath: imagePath));
}
List<studentModel> getFromHive() {
  final studentDataListBox = Hive.box<studentModel>('studentDataListBox');
  List<studentModel> retList = studentDataListBox.values.toList();
  print('data: $retList');
  return retList;
}

void deleteFromHive({required int index}) {
  studentDataListBox.deleteAt(index);
}

void editFromHive({required int index,required studentModel model}){
  studentDataListBox.putAt(index, model);
}