import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentmanagementgetx/Functions/pageNavigation.dart';
import 'package:studentmanagementgetx/Pages/studentEditPage.dart';
import 'package:studentmanagementgetx/Provider/provider.dart';
import 'package:studentmanagementgetx/Pages/studentDetailPage.dart';

class StudentListWidget extends StatelessWidget {
  final int index;
  StudentListWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final current = context.watch<studentDataState>().searchResults[index];
    final res = current.studentmodel;
    print(current);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GestureDetector(
            onTap: () {
              pagePush(context, StudentDetailPage(index: current.originalIndex));
            },
            onLongPress: (){
              showDialog(context: context, builder: (BuildContext context){
                return AlertDialog(
                  title: Text('To do'),
                  content: Text('Do you want to delete or edit'),
                  actions: [
                    TextButton(onPressed: (){
                      pagePush(context, StudentEditPage(index: current.originalIndex));
                      
                    }, child: Text('Edit')),
                    TextButton(onPressed: (){
                      context.read<studentDataState>().deleteStudent(current.originalIndex);
                      context.read<studentDataState>().fechData();
                      context.read<studentDataState>().searchAndUpdate('');
                      pagePop(context);
                    }, child: Text('Delete'))
                  ],
                );
              });
            },
            child: Container(
              width: double.infinity,
              color: Color.fromARGB(73, 117, 130, 153),
              child: ListTile(
                leading: CircleAvatar(backgroundImage:  FileImage(File(res.imagePath)),),
                title: Text(res.name),
                trailing: Icon(Icons.arrow_right_alt),
              ),
            )),
      ),
    );
  }
}
