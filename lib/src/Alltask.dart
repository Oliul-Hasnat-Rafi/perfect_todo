import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:perfect_todo/main.dart';
import 'package:perfect_todo/model/Notemodel.dart';
import 'package:perfect_todo/src/Updatenote.dart';
import 'package:perfect_todo/src/addtask.dart';

class Alltask extends StatefulWidget {
  const Alltask({super.key});

  @override
  State<Alltask> createState() => _AlltaskState();
}

class _AlltaskState extends State<Alltask> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Note = Hive.box('Note');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (c) => Addtask()));
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        color: const Color(0xFFD6D7EF),
        child: Expanded(
          child: ValueListenableBuilder(
            valueListenable: Hive.box<Notemodel>('Note').listenable(),
            builder: (BuildContext context, Box<Notemodel> box, Widget) {
              return ListView.builder(
                  itemCount: box.values.length,
                  itemBuilder: (context, index) {
                    var result = box.getAt(index);
                    return Container(
                        margin: EdgeInsets.all(10),
                        width: 400,
                        height: 82,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 250,
                                height: 80,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        result!.title!,
                                        style: const TextStyle(
                                          color: Color(0xFF9395D3),
                                          fontSize: 13,
                                          fontFamily: 'Jost',
                                          fontWeight: FontWeight.w600,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 8, bottom: 8, right: 8),
                                      child: SizedBox(
                                          width: 124,
                                          child: Text(
                                            result.subtitle!,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10,
                                              fontFamily: 'Jost',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          )),
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (c) => Updatenote(
                                                indexnum: index,
                                                title: result.title!,
                                                subtitle: result.subtitle!,
                                              )));
                                },
                                child: const Icon(
                                  Icons.edit,
                                  color: Color(0xFF9395D3),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Note!.delete(result);
                                  setState(() {});
                                },
                                child: const Icon(
                                  Icons.delete,
                                  color: Color(0xFF9395D3),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Icon(
                                  Icons.task_alt_rounded,
                                  color: Color(0xFF9395D3),
                                ),
                              )
                            ]));
                  });
            },
          ),
        ),
      ),
    );
  }
}
