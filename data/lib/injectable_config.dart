import 'package:data/mapper/characters_mappers.dart';
import 'package:data/repository/characters_repo_impl.dart';
import 'package:data/service/shared_pref_service.dart';
import 'package:data/source/db/character_dao.dart';
import 'package:data/source/db/characters_db.dart';
import 'package:data/source/network/api/rickmorty_api_client.dart';
import 'package:dio/dio.dart';
import 'package:domain/repository/characters_repo.dart';
import 'package:domain/use_cases/get_character_item_usercase.dart';
import 'package:domain/use_cases/get_character_usercase.dart';
import 'package:domain/use_cases/get_favourite_character_list_usercase.dart';
import 'package:domain/use_cases/update_character_item_usercase.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injectable_config.config.dart';

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> configAppDataInjection(String env) async {
  GetIt.I.registerSingletonAsync<SharedPreferencesService>(
      () async => SharedPreferencesService.getInstance());
  GetIt.I
      .registerSingletonAsync<CharacterMapper>(() async => CharacterMapper());
  GetIt.I.registerSingletonAsync<CharacterListMapper>(
      () async => CharacterListMapper(GetIt.I.get<CharacterMapper>()),
      dependsOn: [CharacterMapper]);
  GetIt.I.registerSingletonAsync<RickMortyApiClient>(
      () async => RickMortyApiClient(Dio()));
  GetIt.I.registerSingletonAsync<CharactersDatabase>(() async =>
      $FloorCharactersDatabase.databaseBuilder('characters.db').build());
  GetIt.I.registerSingletonAsync<CharacterDao>(() async {
    return GetIt.I.get<CharactersDatabase>().characterDao;
  }, dependsOn: [CharactersDatabase]);
  GetIt.I.registerSingletonAsync<CharactersRepository>(() async {
    return CharactersRepositoryImpl(
        GetIt.I.get<RickMortyApiClient>(),
        GetIt.I.get<CharacterListMapper>(),
        GetIt.I.get<CharacterDao>(),
        GetIt.I.get<CharacterMapper>());
  }, dependsOn: [
    CharacterDao,
    RickMortyApiClient,
    CharacterListMapper,
    CharacterMapper
  ]);
  GetIt.I.registerFactory<GetRickMortyCharactersUseCase>(
      () => GetRickMortyCharactersUseCase(GetIt.I.get<CharactersRepository>()));
  GetIt.I.registerFactory<GetRickMortyCharacterUseCase>(
      () => GetRickMortyCharacterUseCase(GetIt.I.get<CharactersRepository>()));
  GetIt.I.registerFactory<GetRickMortyFavouriteCharactersUseCase>(() =>
      GetRickMortyFavouriteCharactersUseCase(
          GetIt.I.get<CharactersRepository>()));
  GetIt.I.registerFactory<GetRickMortyCharacterUpdateUseCase>(() =>
      GetRickMortyCharacterUpdateUseCase(GetIt.I.get<CharactersRepository>()));
  // GetIt.instance.$initGetIt(environment: env);
}
