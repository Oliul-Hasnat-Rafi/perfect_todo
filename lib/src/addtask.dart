import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:perfect_todo/model/Notemodel.dart';

class Addtask extends StatefulWidget {
  const Addtask({super.key});

  @override
  State<Addtask> createState() => _AddtaskState();
}

class _AddtaskState extends State<Addtask> {
  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();
  Box? Note;

  @override
  void initState() {
    super.initState();
    Note = Hive.box('Note');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF9395D3),
        title: Text(
          'Add Task',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Jost',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                  controller: titleController,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Title',
                    fillColor: Colors.white70.withOpacity(1),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF9395D3))),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                  maxLines: 5,
                  controller: desController,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Sub Title',
                    fillColor: Colors.white70.withOpacity(1),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF9395D3))),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  )),
            ),
            GestureDetector(
              onTap: () {
                // Note!.add(
                //   titleController.text.toString(),
                // );

                Note!.put(
                    DateTime.now().toString(),
                    Notemodel(
                        title: titleController.text.toString(),
                        subtitle: desController.text.toString()));
                titleController.clear();
                desController.clear();
              },
              child: Container(
                width: 386,
                height: 65.07,
                child: Center(
                  child: Text(
                    'ADD',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Jost',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
                decoration: ShapeDecoration(
                  color: Color(0xFF9395D3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
