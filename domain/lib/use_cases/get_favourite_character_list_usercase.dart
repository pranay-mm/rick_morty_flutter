import 'dart:async';
import 'package:clean_architecture/clean_architecture.dart';
import 'package:clean_architecture/src/usecase.dart';
import 'package:domain/entities/api_response.dart';

import '../entities/dm_character.dart';
import '../exception/exceptions.dart';
import '../repository/characters_repo.dart';

class CharacterFavouriteListReqParams {
  final int? page;

  const CharacterFavouriteListReqParams({
    required this.page,
  });
}

class GetRickMortyFavouriteCharactersUseCase
    extends UseCase<CharacterListUseCaseResponse, CharacterFavouriteListReqParams> {
  final CharactersRepository repo;

  GetRickMortyFavouriteCharactersUseCase(this.repo);

  @override
  Future<Stream<CharacterListUseCaseResponse>> buildUseCaseStream(
      CharacterFavouriteListReqParams? characterListReqParams) async {
    final controller = StreamController<CharacterListUseCaseResponse>();
    try {
      if (characterListReqParams != null) {
        // Fetch from repository
        final characterList = await repo.getFavouriteCharactersList(
          characterListReqParams.page ?? 0
        );
        // Adding it triggers the .onNext() in the `Observer`
        controller.add(CharacterListUseCaseResponse(characterList));
        logger.finest('GetRickMortyFavouriteCharactersUseCase successful.');
        controller.close();
      } else {
        logger.severe('page is null.');
        controller.addError(InvalidRequestException());
      }
    } catch (e) {
      logger.severe('GetRickMortyFavouriteCharactersUseCase failure.');
      controller.addError(e);
    }
    return controller.stream;
  }
}

class CharacterListUseCaseResponse {
  final ApiResponse<CharacterList> characterList;

  CharacterListUseCaseResponse(this.characterList);
}
