import '../entities/api_response.dart';
import '../entities/dm_character.dart';

abstract class CharactersRepository {
  Future<ApiResponse<CharacterList>> getRickAndMortyCharacters(int page,bool isLoadMore);
  Stream<ApiResponse<CharacterList>> getListStream();
  Future<ApiResponse<Character>>? getRickAndMortyCharacter(int id);
  Future<ApiResponse<void>> updateChar(Character character);
}
