import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:perfect_todo/complectmodel/Oncomplect.dart';

class Complect extends StatelessWidget {
  const Complect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFD6D7EF),
        child: Expanded(
          child: ValueListenableBuilder(
            valueListenable: Hive.box<Oncomplect>('comtask').listenable(),
            builder: (BuildContext context, Box<Oncomplect> box, Widget) {
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
                                        result!.comtitle!,
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
                                            result.comsubtitle!,
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
                            ]));
                  });
            },
          ),
        ),
      ),
    );
  }
}
