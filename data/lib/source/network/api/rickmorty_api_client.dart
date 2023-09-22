import 'package:data/models/dt_character_list.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'rickmorty_api_client.g.dart';

const String BASE_URL = 'https://rickandmortyapi.com/api/';

@injectable
@RestApi(baseUrl: BASE_URL)
abstract class RickMortyApiClient {
  @factoryMethod
  factory RickMortyApiClient(Dio dio, {String baseUrl}) = _RickMortyApiClient;

  @GET("/character")
  @DioResponseType(ResponseType.json)
  Future<HttpResponse<List<DTCharactersList>>> getCharactersList(
    @Query("page") String page,
  );
}
