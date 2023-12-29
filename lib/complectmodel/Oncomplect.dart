import 'package:hive/hive.dart';
part 'Oncomplect.g.dart';

@HiveType(typeId: 1)
class Oncomplect {
  Oncomplect({this.comid, this.comtitle, this.comsubtitle});
  @HiveField(0)
  int? comid;

  @HiveField(1)
  String? comtitle;

  @HiveField(2)
  String? comsubtitle;
}
