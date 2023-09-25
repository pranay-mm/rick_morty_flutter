import '../entities/api_response.dart';
import '../entities/dm_character.dart';

abstract class CharactersRepository {
  Future<ApiResponse<CharacterList>> getRickAndMortyCharacters(int page);
}
