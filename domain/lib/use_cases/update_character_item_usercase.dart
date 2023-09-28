import 'dart:async';
import 'package:clean_architecture/clean_architecture.dart';
import 'package:clean_architecture/src/usecase.dart';
import 'package:domain/entities/api_response.dart';

import '../entities/dm_character.dart';
import '../exception/exceptions.dart';
import '../repository/characters_repo.dart';

class CharacterItemUpdateParams {
  final Character? character;

  const CharacterItemUpdateParams({
    required this.character,
  });
}

class GetRickMortyCharacterUpdateUseCase
    extends UseCase<CharacterItemUpdateCaseResponse, CharacterItemUpdateParams> {
  final CharactersRepository repo;

  GetRickMortyCharacterUpdateUseCase(this.repo);

  @override
  Future<Stream<CharacterItemUpdateCaseResponse>> buildUseCaseStream(
      CharacterItemUpdateParams? characterListReqParams) async {
    final controller = StreamController<CharacterItemUpdateCaseResponse>();
    try {
      if (characterListReqParams != null) {
        // Fetch from repository
        if(characterListReqParams.character!= null){
        final characterList = await repo.updateChar(
          characterListReqParams.character!
        );
        // Adding it triggers the .onNext() in the `Observer`
        controller.add(CharacterItemUpdateCaseResponse(characterList));
        logger.finest('CharacterItemUpdateCaseResponse successful.');
        controller.close();
        }else{
          controller.addError(InvalidRequestException());
        }
      } else {
        controller.addError(InvalidRequestException());
      }
    } catch (e) {
      logger.severe('CharacterItemUpdateCaseResponse failure.');
      controller.addError(e);
    }
    return controller.stream;
  }
}

class CharacterItemUpdateCaseResponse {
  final ApiResponse<void>? response;

  CharacterItemUpdateCaseResponse(this.response);
}
