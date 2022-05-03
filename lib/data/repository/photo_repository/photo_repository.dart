import 'package:app/data/response/photo_response/photo_response.dart';
import 'package:app/presentation/shared/app_const.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'photo_repository.g.dart';

@RestApi(baseUrl: catPhotoUrl)
abstract class PhotoRepository {
  factory PhotoRepository(
    Dio dio, {
    String? baseUrl,
  }) {
    return _PhotoRepository(
      dio,
      baseUrl: baseUrl,
    );
  }

  @GET(catPhotoUrlParams)
  Future<Photo> getPhoto();
}
