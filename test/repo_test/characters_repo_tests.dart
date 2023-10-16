import 'package:domain/entities/api_response.dart';
import 'package:domain/entities/dm_character.dart';
import 'package:domain/repository/characters_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'characters_repo_tests.mocks.dart';

class CharactersRepoTest extends Mock implements CharactersRepository {}

@GenerateMocks([CharactersRepoTest])
Future<void> main() async {
  late MockCharactersRepoTest charRepo;

  setUpAll(() {
    charRepo = MockCharactersRepoTest();
  });

  group('character repo tests', () {
    test('getRickAndMortyCharacters', () async {
      final charList = CharacterList([
        Character(1, 'name', 'image', 'status', 'species', 'gender',
            Origin('url', 'name'), Location('url', 'name'), ['', ''], false)
      ]);

      when(charRepo.getRickAndMortyCharacters(1, true)).thenAnswer((_) async {
        return Future(() => Success(data: charList));
      });

      final response = await charRepo.getRickAndMortyCharacters(1, false);
      expect(response, isA<ApiResponse<CharacterList>>());
    });
  });
}
