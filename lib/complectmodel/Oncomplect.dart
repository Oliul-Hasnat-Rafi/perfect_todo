import 'package:hive/hive.dart';
part 'Oncomplect.g.dart';

@HiveType(typeId: 12)
class Oncomplect {
  Oncomplect({this.comid, this.comtitle, this.comsubtitle});
  @HiveField(10)
  int? comid;

  @HiveField(11)
  String? comtitle;

  @HiveField(12)
  String? comsubtitle;
}
