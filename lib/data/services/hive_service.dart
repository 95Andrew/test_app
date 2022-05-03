import 'package:app/data/entity/detail_fact.dart';
import 'package:app/presentation/shared/app_const.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  Future saveDetailFact(DetailFact detailFact) async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(DetailFactAdapter());
    }
    final detailFactsBox = await Hive.openBox<DetailFact>(detailFactsList);
    await detailFactsBox.add(detailFact);
  }

  Future<List<DetailFact>> getDetailFactsList() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(DetailFactAdapter());
    }
    final detailFactsBox = await Hive.openBox<DetailFact>(detailFactsList);
    return detailFactsBox.values.toList();
  }
}
