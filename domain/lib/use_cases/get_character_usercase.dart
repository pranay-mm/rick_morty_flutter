import 'dart:async';
import 'package:clean_architecture/clean_architecture.dart';
import 'package:clean_architecture/src/usecase.dart';
import 'package:domain/entities/api_response.dart';

import '../entities/dm_character.dart';
import '../exception/exceptions.dart';
import '../repository/characters_repo.dart';

class CharacterListReqParams {
  final int? page;
  final bool isLoadMore;

  const CharacterListReqParams({required this.page, required this.isLoadMore});
}

class GetRickMortyCharactersUseCase
    extends UseCase<CharacterListUseCaseResponse, CharacterListReqParams> {
  final CharactersRepository repo;

  GetRickMortyCharactersUseCase(this.repo);

  @override
  Future<Stream<CharacterListUseCaseResponse>> buildUseCaseStream(
      CharacterListReqParams? characterListReqParams) async {
    final controller = StreamController<CharacterListUseCaseResponse>();
    try {
      if (characterListReqParams != null) {
        // Fetch from repository
        final characterList = await repo.getRickAndMortyCharacters(
            characterListReqParams.page ?? 0,
            characterListReqParams.isLoadMore);
        // Adding it triggers the .onNext() in the `Observer`
        controller.add(CharacterListUseCaseResponse(characterList));
        logger.finest('GetRickMortyCharactersUseCase successful.');
        controller.close();
      } else {
        logger.severe('page is null.');
        controller.addError(InvalidRequestException());
      }
    } catch (e) {
      logger.severe('GetRickMortyCharactersUseCase failure.');
      controller.addError(e);
    }
    return controller.stream;
  }
}

class CharacterListUseCaseResponse {
  final ApiResponse<CharacterList> characterList;

  CharacterListUseCaseResponse(this.characterList);
}
