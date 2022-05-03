import 'package:hive/hive.dart';

part 'detail_fact.g.dart';

@HiveType(typeId: 0)
class DetailFact {
  @HiveField(0)
  final String description;
  @HiveField(1)
  final String data;

  DetailFact({
    required this.description,
    required this.data,
  });
}
