import 'package:flutter/material.dart';
import 'package:perfect_todo/src/addtask.dart';

class Alltask extends StatefulWidget {
  const Alltask({super.key});

  @override
  State<Alltask> createState() => _AlltaskState();
}

class _AlltaskState extends State<Alltask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (c) => Addtask()));
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        color: Color(0xFFD6D7EF),
      ),
    );
  }
}
