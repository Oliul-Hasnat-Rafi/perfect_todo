import 'package:hive/hive.dart';
part 'Notemodel.g.dart';

@HiveType(typeId: 1)
class Notemodel {
  Notemodel({this.id, this.title, this.subtitle});
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? title;

  @HiveField(2)
  String? subtitle;
}
