import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentmanagementgetx/Provider/provider.dart';

class StudentDetailPage extends StatelessWidget {
  final int index;
  StudentDetailPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final current = context.read<studentDataState>().allStudentData[index];
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundImage: FileImage(File(current.imagePath)),
              radius: 250,
            ),
            Divider(),
            Text(
              'Name: ' + current.name,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Age: ' + current.age.toString(),
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'RollNo: ' + current.rollNo.toString(),
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Division: ' + current.division,
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
