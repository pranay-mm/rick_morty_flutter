import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:domain/use_cases/get_character_usercase.dart';

@module
abstract class DataUserCaseModule {
  GetRickMortyCharactersUseCase get getRickMortyCharactersUseCase =>
      GetRickMortyCharactersUseCase(GetIt.instance.get());
}
