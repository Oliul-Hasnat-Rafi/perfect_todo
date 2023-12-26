import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
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
        child: Column(
          children: [
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: Hive.box('Note').listenable(),
                builder: (BuildContext context, box, Widget) {
                  return ListView.builder(
                      itemCount: box.keys.toList().length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(box.getAt(index)),
                        );
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
