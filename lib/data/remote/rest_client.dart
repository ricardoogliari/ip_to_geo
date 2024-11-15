import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:myapp/data/local/geo_data.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'http://ip-api.com')
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @GET('/json/{ip}')
  Future<GeoData> getGeoData(@Path() String ip);
}
