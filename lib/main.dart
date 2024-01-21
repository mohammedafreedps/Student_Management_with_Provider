import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:studentmanagementgetx/Consts/boxes.dart';
import 'package:studentmanagementgetx/Model/studentModel.dart';
import 'package:studentmanagementgetx/Pages/homePage.dart';
import 'package:provider/provider.dart';
import 'package:studentmanagementgetx/Provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<studentModel>(studentModelAdapter());
  studentDataListBox = await Hive.openBox<studentModel>('studentDataListBox');
  runApp(const StudentManagement());
}

class StudentManagement extends StatelessWidget {
  const StudentManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => studentDataState())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}