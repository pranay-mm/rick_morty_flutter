import 'package:data/models/dt_character_list.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'rickmorty_api_client.g.dart';

const String baseURL = 'https://rickandmortyapi.com/api/';

@RestApi(baseUrl: baseURL)
abstract class RickMortyApiClient {
  @factoryMethod
  factory RickMortyApiClient(Dio dio) = _RickMortyApiClient;

  @GET("/character")
  Future<HttpResponse<String>> getCharactersList(
    @Query("page") int page,
  );
}
