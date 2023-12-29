import 'package:get/get.dart';
import 'package:perfect_todo/complectmodel/Oncomplect.dart';
import 'package:perfect_todo/main.dart';
import 'package:perfect_todo/model/Notemodel.dart';

class AddController extends GetxController {
  addtask(Notemodel taskdata) {
    Note!.add(taskdata);
  }

  delecttask(RxInt index) {
    index.obs;
    Note!.delete(index);
    refresh();
  }

  edittask() {}
  complecttask(Oncomplect complecttask) {
    comtask!.add(complecttask);
    refresh();
  }
}
