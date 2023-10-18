import 'dart:convert';

import 'package:data/constants.dart';
import 'package:data/mapper/characters_mappers.dart';
import 'package:data/models/dt_character.dart';
import 'package:data/models/dt_character_list.dart';
import 'package:data/source/db/character_dao.dart';
import 'package:data/source/network/api/rickmorty_api_client.dart';
import 'package:data/source/network/dio_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:domain/entities/api_response.dart';
import 'package:domain/entities/dm_character.dart';
import 'package:domain/repository/characters_repo.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  CharactersRepositoryImpl(
      this.services, this.characterListMapper, this.charsDao, this.charMapper);

  final CharacterListMapper characterListMapper;
  final CharacterMapper charMapper;
  final RickMortyApiClient services;
  final CharacterDao charsDao;

  @override
  Future<ApiResponse<CharacterList>> getRickAndMortyCharacters(
      int page, bool isLoadMore) async {
    int? count = await charsDao.getCharactersCount();
    if (count == null || count == 0 || isLoadMore) {
      try {
        int nextPage = count == null ? 1 : (count / perPageItem).round() + 1;
        final response = await services.getCharactersList(nextPage);
        final jsonResponse = jsonDecode(response.data) as Map<String, dynamic>;
        final resultsResponse = jsonResponse['results'] as List<dynamic>;
        for (var element in resultsResponse) {
          (element as Map<String, dynamic>).addAll({"isFavorited": false});
        }

        final characterList = DTCharactersList.fromJson(jsonResponse);
        try {
          await charsDao.insertsCharacters(characterList.charactersList);
          return Success(data: characterListMapper.mapToDomain(characterList));
        } on DioException catch (e) {
          return Failure(error: DioExceptions.fromDioError(e).message);
        }
      } on Exception catch (e) {
        return Failure(error: e.toString());
      }
    } else {
      return Success(
          data: characterListMapper.mapToDomain(
              DTCharactersList(await charsDao.getAllCharacters())));
    }
  }

  @override
  Future<ApiResponse<Character>>? getRickAndMortyCharacter(int id) async {
    DTCharacter? characater = await charsDao.findCharacterById(id);
    return Success(data: charMapper.mapToDomain(characater!));
  }

  @override
  Future<ApiResponse<void>> updateFavouriteCharater(Character character) async {
    await charsDao.updateFavouriteCharater(charMapper.mapToData(character));
    return Success(data: null);
  }

  @override
  Future<ApiResponse<CharacterList>> getFavouriteCharactersList(
      int page) async {
    return Success(
        data: characterListMapper.mapToDomain(
            DTCharactersList(await charsDao.getFavAllCharacters())));
  }
}
