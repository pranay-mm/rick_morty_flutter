import 'dart:developer';

import 'package:data/source/db/character_dao.dart';
import 'package:domain/entities/dm_character.dart';
import 'package:domain/use_cases/get_character_item_usercase.dart';
import 'package:domain/use_cases/get_character_usercase.dart';
import 'package:domain/entities/api_response.dart' as api_response;
import 'package:domain/use_cases/update_character_item_usercase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_morty_flutter/models/ui_state.dart';
import 'package:rick_morty_flutter/ui/model/ui_character.dart';
import 'package:rick_morty_flutter/ui/model/ui_character_mapper.dart';

final idProider = StateNotifierProvider<IdNotifier, int>((ref) => IdNotifier());

class IdNotifier extends StateNotifier<int> {
  IdNotifier() : super(0);
  void updateState(int id) {
    state = id;
  }
}

final charecterDetailsProvider =
    StateNotifierProvider<CharacterDetailsNotifier, UiState<UiCharacter>>(
        (ref) {
  int id = ref.watch(idProider);
  return CharacterDetailsNotifier(id);
});

class CharacterDetailsNotifier extends StateNotifier<UiState<UiCharacter>> {
  CharacterDetailsNotifier(this.charID) : super(Initial()) {
    loadCharacter();
  }
  final UiCharacterMapper _uiMapper = GetIt.I.get<UiCharacterMapper>();
  final GetRickMortyCharacterUseCase _getRickMortyCharactersUseCase =
      GetIt.I.get<GetRickMortyCharacterUseCase>();
  final GetRickMortyCharacterUpdateUseCase _getRickMortyCharacterUpdateUseCase =
      GetIt.I.get<GetRickMortyCharacterUpdateUseCase>();

  bool isPageLoadInProgress = false;
  late UiCharacter uiCharacter;
  int charID;

  void loadCharacter() {
    state = Loading();
    _getRickMortyCharactersUseCase.perform(
      handleResponse,
      error,
      complete,
      CharacterItemReqParams(id: charID),
    );
  }

  void updateCharacter() {
    _getRickMortyCharacterUpdateUseCase.perform((responseData) {
      if (responseData == null) {
        state = Failure(exception: "Couldn't mark fav/unfav !");
      } else {
        if (responseData is api_response.Failure) {
          state =
              Failure(exception: (responseData as api_response.Failure).error);
        } else {
          uiCharacter = _uiMapper.mapToPresentation(Character(
                  uiCharacter.id,
                  uiCharacter.name,
                  uiCharacter.image,
                  uiCharacter.status,
                  uiCharacter.species,
                  uiCharacter.gender,
                  uiCharacter.origin,
                  uiCharacter.location,
                  uiCharacter.episode,
                  !uiCharacter.isFavorited));
          state = Success(
              data: uiCharacter);
        }
      }
      isPageLoadInProgress = false;
    }, (onError) {
      log('Error in fav character details');
      if (onError is Exception) {
        log('Error in fav character details: $onError');
        state = Failure(exception: onError.toString());
      }
    },
        () {

        },
        CharacterItemUpdateParams(
            character: Character(
                uiCharacter.id,
                uiCharacter.name,
                uiCharacter.image,
                uiCharacter.status,
                uiCharacter.species,
                uiCharacter.gender,
                uiCharacter.origin,
                uiCharacter.location,
                uiCharacter.episode,
                !uiCharacter.isFavorited)));
  }

  /// Handle response data
  void handleResponse(CharacterItemUseCaseResponse? response) {
    final responseData = response?.characterList;
    if (responseData == null) {
      state = Failure(exception: "Couldn't fetch character!");
    } else {
      if (responseData is api_response.Failure) {
        state =
            Failure(exception: (responseData as api_response.Failure).error);
      } else if (responseData is api_response.Success) {
        final characters = responseData as api_response.Success;
        uiCharacter = _uiMapper.mapToPresentation(characters.data as Character);
        state = Success(data: uiCharacter);
      }
    }
    isPageLoadInProgress = false;
  }

  void complete() {
    log('Fetching character is complete.');
  }

  void error(Object e) {
    log('Error in fetching character details');
    if (e is Exception) {
      log('Error in fetching character details: $e');
      state = Failure(exception: e.toString());
    }
  }
}
