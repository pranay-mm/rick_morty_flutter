import 'dart:developer';

import 'package:domain/entities/dm_character.dart';
import 'package:domain/use_cases/get_character_usercase.dart';
import 'package:domain/entities/api_response.dart' as api_response;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_morty_flutter/models/ui_state.dart';
import 'package:rick_morty_flutter/ui/model/ui_character.dart';
import 'package:rick_morty_flutter/ui/model/ui_character_mapper.dart';

final charecterListProvider =
    StateNotifierProvider<CharacterListNotifier, UiState>((ref) {
  return CharacterListNotifier();
});

class CharacterListNotifier extends StateNotifier<UiState> {
  CharacterListNotifier() : super(Initial()) {
    loadCharacters();
  }
  final UiCharacterMapper _uiMapper = GetIt.I.get<UiCharacterMapper>();
  final GetRickMortyCharactersUseCase _getRickMortyCharactersUseCase =
      GetIt.I.get<GetRickMortyCharactersUseCase>();
  final List<UiCharacter> _charactersToDisplayInUi = [];
  late bool _isFilterRequest = false;

  late String nameFilter = '';
  bool isPageLoadInProgress = false;
  int page = 1;

  /// Load Rick & Morty characters
  void loadCharacters() {
    if (page == 1) {
      state = Loading();
    }
    _isFilterRequest = nameFilter.isNotEmpty;
    _getRickMortyCharactersUseCase.perform(
      handleResponse,
      error,
      complete,
      CharacterListReqParams(
        page: page,
      ),
    );
  }

  /// Handle response data
  void handleResponse(CharacterListUseCaseResponse? response) {
    final responseData = response?.characterList;
    if (responseData == null) {
      state = Failure(exception: "Couldn't fetch characters!");
    } else {
      if (responseData is api_response.Failure) {
        state =
            Failure(exception: (responseData as api_response.Failure).error);
      } else if (responseData is api_response.Success) {
        final characters = responseData as api_response.Success;
        final uiCharacters =
            _uiMapper.mapToPresentation(characters.data as CharacterList);
        if (uiCharacters.characters.isNotEmpty) {
          if (_isFilterRequest) {
            _charactersToDisplayInUi.clear();
          }
          _charactersToDisplayInUi.addAll(uiCharacters.characters);
        }
        state = Success(data: _charactersToDisplayInUi);
      }
    }
    isPageLoadInProgress = false;
  }

  void complete() {
    log('Fetching characters list is complete.');
  }

  void error(Object e) {
    log('Error in fetching characters list');
    if (e is Exception) {
      log('Error in fetching characters list: $e');
      state = Failure(exception: e.toString());
    }
  }
}
