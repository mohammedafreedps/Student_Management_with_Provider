import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentmanagementgetx/DataBaseFunction/hiveDatasFunction.dart';
import 'package:studentmanagementgetx/Functions/imagePickingFunction.dart';
import 'package:studentmanagementgetx/Model/searchModel.dart';
import 'package:studentmanagementgetx/Model/studentModel.dart';

class studentDataState extends ChangeNotifier {
  List<studentModel> allStudentData = [];
  String imagePath = '';
  List<searchResult> searchResults = [];

  void fechData(){
    allStudentData = getFromHive();
    print(allStudentData);
    notifyListeners();
  }
  void deleteStudent(int originalIndex){
    deleteFromHive(index: originalIndex);
    allStudentData.removeAt(originalIndex);
    notifyListeners();
  }
  void searchAndUpdate(String query){
    searchResults.clear();
    if (query.isEmpty) {
      for (var i = 0; i < allStudentData.length; i++) {
        final current = allStudentData[i];
        searchResults.add(searchResult(originalIndex: i, studentmodel: current));
        notifyListeners();
      }
    }
    if (query.isNotEmpty) {
      for (var i = 0; i < allStudentData.length; i++) {
        final current = allStudentData[i];
        if (current.name.toLowerCase().contains(query.toLowerCase())) {
          searchResults.add(searchResult(originalIndex: i, studentmodel: current));
          notifyListeners();
        }
      }
    }
  }
  void imagePickerGallary(XFile? file, ImageSource imageSource)async{
      imagePath = await selectPicture(file: file, imageSource: imageSource);
      notifyListeners();
  }
}