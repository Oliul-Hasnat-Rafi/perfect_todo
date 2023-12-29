import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_todo/src/Alltask.dart';
import 'package:perfect_todo/src/complect.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _currentIndex = 0;
  List page = [Alltask(), Complect()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Perfect Todo',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: 'Jost',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
          backgroundColor: Color(0xFF9395D3),
          // actions: [
          //   IconButton(
          //       onPressed: () {
          //         setState(() {
          //           Get.changeTheme(ThemeData.light());
          //         });
          //       },
          //       icon: Icon(FontAwesomeIcons.sun)),
          //   IconButton(
          //       onPressed: () {
          //         setState(() {
          //           Get.changeTheme(ThemeData.dark());
          //         });
          //       },
          //       icon: Icon(FontAwesomeIcons.moon))
          // ],
        ),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            SalomonBottomBarItem(
              icon: Icon(Icons.table_rows_rounded),
              title: Text("ALL"),
              selectedColor: Colors.purple,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.task_alt_rounded),
              title: Text("Complect"),
              selectedColor: Colors.pink,
            ),
          ],
        ),
        body: page[_currentIndex]);
  }
}
