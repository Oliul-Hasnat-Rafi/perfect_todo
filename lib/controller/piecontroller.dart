import 'package:get/get.dart';
import 'package:perfect_todo/main.dart';

class PieController extends GetxController {
  final RxDouble pending = 0.0.obs;
  final RxDouble complect = 0.0.obs;

  double pendingTask() {
    pending.value = Note!.values.length.toDouble();
    refresh();
    return pending.value;
  }

  double completeTask() {
    complect.value = comtask!.values.length.toDouble();
    refresh();
    return complect.value;
  }
}
