import 'package:app/data/repository/fact_repository/fact_repository.dart';
import 'package:app/data/repository/photo_repository/photo_repository.dart';
import 'package:app/data/response/fact_response/fact_response.dart';
import 'package:app/data/response/photo_response/photo_response.dart';
import 'package:dio/dio.dart' as dio;

class ApiService {
  final _factRepository = FactRepository(dio.Dio());
  final _photoRepository = PhotoRepository(dio.Dio());

  Future<Fact> getFact() async {
    final response = await _factRepository.getFact();
    return response;
  }

  Future<Photo> getPhoto() async {
    final response = await _photoRepository.getPhoto();
    return response;
  }
}
