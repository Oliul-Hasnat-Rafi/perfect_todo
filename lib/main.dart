import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:perfect_todo/model/Notemodel.dart';
import 'package:perfect_todo/src/Home.dart';

Box? Note;
void main() async {
  // var Note = await Hive.openBox('Note');
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Note = await Hive.openBox<Notemodel>("Note");
  Hive.registerAdapter(NotemodelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
