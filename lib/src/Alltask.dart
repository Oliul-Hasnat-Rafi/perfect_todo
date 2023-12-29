import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:perfect_todo/complectmodel/Oncomplect.dart';
import 'package:perfect_todo/main.dart';
import 'package:perfect_todo/model/Notemodel.dart';
import 'package:perfect_todo/src/Updatenote.dart';
import 'package:perfect_todo/src/addtask.dart';
import 'package:pie_chart/pie_chart.dart';

class Alltask extends StatefulWidget {
  const Alltask({super.key});

  @override
  State<Alltask> createState() => _AlltaskState();
}

class _AlltaskState extends State<Alltask> {
  // @override
  // late final AnimationController _controller =
  //     AnimationController(duration: Duration(seconds: 5), vsync: this)
  //       ..repeat();

  // @override
  // void dispose() {
  //   super.dispose();
  //   _controller.dispose();
  // }

  final Colorlist = <Color>[
    Colors.blue,
    Colors.green,
    Colors.red,
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (c) => Addtask()));
          },
          child: const Icon(Icons.add),
        ),
        body: Container(
            color: const Color(0xFFD6D7EF),
            child: Column(children: [
              Container(
                margin: EdgeInsets.all(10),
                width: 400,
                height: 182,
                decoration: ShapeDecoration(
                  color: Color(0xFF9395D3),
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
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Expanded(
                          flex: 2,
                          child: Text(
                            'TASK OVERVIEW',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontFamily: 'Jost',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PieChart(
                            dataMap: {
                              'Paining task': Note!.values.length.toDouble(),
                              'Complect task': 25,
                            },
                            legendOptions: LegendOptions(
                                legendPosition: LegendPosition.left),
                            animationDuration: Duration(microseconds: 20000),
                            chartType: ChartType.ring,
                            colorList: Colorlist,
                            chartRadius:
                                MediaQuery.of(context).size.width / 3.2,
                            chartValuesOptions: const ChartValuesOptions(
                              showChartValueBackground: true,
                              showChartValues: true,
                              showChartValuesInPercentage: true,
                              showChartValuesOutside: true,
                              decimalPlaces: 1,
                            ),
                          ),
                        ),
                      )
                    ]),
              ),
              Expanded(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 250,
                                      height: 80,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                                      subtitle:
                                                          result.subtitle!,
                                                    )));
                                      },
                                      child: const Icon(
                                        Icons.edit,
                                        color: Color(0xFF9395D3),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Note!.delete(box.keyAt(index));
                                        setState(() {});
                                      },
                                      child: const Icon(
                                        Icons.delete,
                                        color: Color(0xFF9395D3),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        var taskcom = Oncomplect(
                                            comtitle: result.title,
                                            comsubtitle: result.subtitle);
                                        comtask!.add(taskcom);
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Icon(
                                          Icons.task_alt_rounded,
                                          color: Color(0xFF9395D3),
                                        ),
                                      ),
                                    )
                                  ]));
                        });
                  },
                ),
              ),
            ])));
  }
}
