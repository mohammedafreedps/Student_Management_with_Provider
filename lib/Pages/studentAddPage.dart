import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:studentmanagementgetx/DataBaseFunction/hiveDatasFunction.dart';
import 'package:studentmanagementgetx/Functions/pageNavigation.dart';
import 'package:studentmanagementgetx/Provider/provider.dart';

class StudentAddPage extends StatelessWidget {
  const StudentAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final ageController = TextEditingController();
    final rollNoController = TextEditingController();
    final divisionController = TextEditingController();
    XFile? image;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              context.watch<studentDataState>().imagePath.isNotEmpty
                  ? SizedBox(
                      height: 130,
                      width: 200,
                      child: Image.file(File(context.watch<studentDataState>().imagePath)),
                    )
                  : Text(''),
              TextButton(
                  onPressed: () async {
                    print('press 1');
                    context.read<studentDataState>().imagePickerGallary(image, ImageSource.gallery);
                  },
                  child: Text('Select Image')),
              Text('Name'),
              TextField(
                controller: nameController,
              ),
              Text('Age'),
              TextField(
                controller: ageController,
                keyboardType: TextInputType.number,
              ),
              Text('RollNo'),
              TextField(
                controller: rollNoController,
                keyboardType: TextInputType.number,
              ),
              Text('Division'),
              TextField(
                controller: divisionController,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.grey)),
                  onPressed: () {
                    if (context.read<studentDataState>().imagePath.isNotEmpty &&
                        nameController.text.isNotEmpty &&
                        ageController.text.isNotEmpty &&
                        rollNoController.text.isNotEmpty &&
                        divisionController.text.isNotEmpty) {
                      print('press 2');
                      putToHive(
                          name: nameController.text,
                          age: int.parse(ageController.text),
                          rollNo: int.parse(rollNoController.text),
                          division: divisionController.text,
                          imagePath: context.read<studentDataState>().imagePath);
                      context.read<studentDataState>().imagePath = '';
                      context.read<studentDataState>().fechData();
                      context.read<studentDataState>().searchAndUpdate('');
                      pagePop(context);
                    }
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
