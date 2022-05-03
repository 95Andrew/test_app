import 'package:app/data/response/fact_response/fact_response.dart';
import 'package:app/presentation/shared/app_const.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'fact_repository.g.dart';

@RestApi(baseUrl: catFactUrl)
abstract class FactRepository {
  factory FactRepository(
    Dio dio, {
    String? baseUrl,
  }) {
    return _FactRepository(
      dio,
      baseUrl: baseUrl,
    );
  }

  @GET(catFactUrlParams)
  Future<Fact> getFact();
}
