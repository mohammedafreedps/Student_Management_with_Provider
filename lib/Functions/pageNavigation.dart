import 'package:flutter/material.dart';

void pagePush(BuildContext context , Widget page){
  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => page));
}
void pagePushReplacement(BuildContext context , Widget page){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => page));
}
void pagePop(BuildContext context){
  Navigator.pop(context);
}
