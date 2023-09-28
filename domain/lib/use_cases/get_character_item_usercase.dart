import 'dart:async';
import 'package:clean_architecture/clean_architecture.dart';
import 'package:clean_architecture/src/usecase.dart';
import 'package:domain/entities/api_response.dart';

import '../entities/dm_character.dart';
import '../exception/exceptions.dart';
import '../repository/characters_repo.dart';

class CharacterItemReqParams {
  final int id;

  const CharacterItemReqParams({
    required this.id,
  });
}

class GetRickMortyCharacterUseCase
    extends UseCase<CharacterItemUseCaseResponse, CharacterItemReqParams> {
  final CharactersRepository repo;

  GetRickMortyCharacterUseCase(this.repo);

  @override
  Future<Stream<CharacterItemUseCaseResponse>> buildUseCaseStream(
      CharacterItemReqParams? characterListReqParams) async {
    final controller = StreamController<CharacterItemUseCaseResponse>();
    try {
      if (characterListReqParams != null) {
        // Fetch from repository
        final characterList = await repo.getRickAndMortyCharacter(
          characterListReqParams.id
        );
        // Adding it triggers the .onNext() in the `Observer`
        controller.add(CharacterItemUseCaseResponse(characterList));
        logger.finest('GetRickMortyCharacterUseCase successful.');
        controller.close();
      } else {
        controller.addError(InvalidRequestException());
      }
    } catch (e) {
      logger.severe('GetRickMortyCharacterUseCase failure.');
      controller.addError(e);
    }
    return controller.stream;
  }
}

class CharacterItemUseCaseResponse {
  final ApiResponse<Character>? characterList;

  CharacterItemUseCaseResponse(this.characterList);
}
