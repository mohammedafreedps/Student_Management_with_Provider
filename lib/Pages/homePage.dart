import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentmanagementgetx/Functions/pageNavigation.dart';
import 'package:studentmanagementgetx/Provider/provider.dart';
import 'package:studentmanagementgetx/Pages/studentAddPage.dart';
import 'package:studentmanagementgetx/Widgests/studentListWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void _runFunc()async{
    await Future.delayed(Duration(seconds: 1));
    context.read<studentDataState>().fechData();
    context.read<studentDataState>().searchAndUpdate('');
  }

  @override
  void initState() {
    _runFunc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Center(
                  child: Text(
                'Students',
                style: TextStyle(fontSize: 40, color: Colors.grey),
              )),
              Divider(),
              SizedBox(
                height: 50,
              ),
              TextField(
                onChanged: (value) {
                  context.read<studentDataState>().searchAndUpdate(value);
                },
                decoration: InputDecoration(hintText: 'Search'),
              ),
              SizedBox(
                height: 50,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: context.watch<studentDataState>().searchResults.length,
                  itemBuilder: (BuildContext context, int index) {
                    return StudentListWidget(index: index);
                  },
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: const Color.fromARGB(255, 20, 20, 20),
          onPressed: () {
            pagePush(context, StudentAddPage());
          }),
    );
  }
}
