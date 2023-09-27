import 'package:data/mapper/characters_mappers.dart';
import 'package:data/repository/characters_repo_impl.dart';
import 'package:data/source/db/character_dao.dart';
import 'package:data/source/db/characters_db.dart';
import 'package:data/source/network/api/rickmorty_api_client.dart';
import 'package:domain/repository/characters_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injectable_config.config.dart';

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> configAppDataInjection(String env) async {
  await GetIt.instance.$initGetIt(environment: env);
  GetIt.I.registerSingletonAsync<CharactersDatabase>(() async =>
      $FloorCharactersDatabase.databaseBuilder('characters.db').build());
  GetIt.I.registerSingletonWithDependencies<CharacterDao>(() {
    return GetIt.I.get<CharactersDatabase>().characterDao;
  }, dependsOn: [CharactersDatabase]);
  GetIt.I.registerSingletonWithDependencies<CharactersRepository>(() {
    return CharactersRepositoryImpl(GetIt.I.get<RickMortyApiClient>(),
        GetIt.I.get<CharacterListMapper>(), GetIt.I.get<CharacterDao>(),GetIt.I.get<CharacterMapper>());
  }, dependsOn: [
    CharacterDao,
  ]);
}
