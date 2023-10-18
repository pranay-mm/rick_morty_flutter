import '../entities/api_response.dart';
import '../entities/dm_character.dart';

abstract class CharactersRepository {
  Future<ApiResponse<CharacterList>> getRickAndMortyCharacters(
      int page, bool isLoadMore);
  Future<ApiResponse<Character>>? getRickAndMortyCharacter(int id);
  Future<ApiResponse<void>> updateFavouriteCharater(Character character);
  Future<ApiResponse<CharacterList>> getFavouriteCharactersList(int page);
}
