import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:perfect_todo/complectmodel/Oncomplect.dart';
import 'package:perfect_todo/main.dart';
import 'package:perfect_todo/model/Notemodel.dart';

Box? box;

class AddController extends GetxController {
  addtask(Notemodel taskdata) {
    Note!.add(taskdata);
  }

  delecttask(index) {
    Note!.delete(box!.getAt(index));
    refresh();
  }

  edittask() {}
  complecttask(Oncomplect complecttask) {
    comtask!.add(complecttask);
    refresh();
  }
}
