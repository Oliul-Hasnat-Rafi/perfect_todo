import 'package:flutter/material.dart';

class Addtask extends StatefulWidget {
  const Addtask({super.key});

  @override
  State<Addtask> createState() => _AddtaskState();
}

class _AddtaskState extends State<Addtask> {
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
            Container(
              width: 386,
              height: 65.07,
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
            )
          ],
        ),
      ),
    );
  }
}
