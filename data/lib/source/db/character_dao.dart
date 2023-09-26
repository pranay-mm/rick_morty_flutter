import 'package:data/models/dt_character.dart';
import 'package:data/source/db/constants.dart';
import 'package:floor/floor.dart';

@dao
abstract class CharacterDao {
  @Query('SELECT * FROM $tableCharacter')
  Future<List<DTCharacter>> getAllCharacters();

  @Query('SELECT * FROM $tableCharacter')
  Stream<List<DTCharacter>> getAllCharactersStream();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertsCharacters(List<DTCharacter> list);

  @Query('SELECT COUNT(*) FROM $tableCharacter')
  Future<int?> getCharactersCount();
}
