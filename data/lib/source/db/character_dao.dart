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

  @update
  Future<void> updateChar(DTCharacter char);

  @Query('SELECT * FROM $tableCharacter WHERE id = :id')
  Future<DTCharacter?> findCharacterById(int id);

  @Query('SELECT COUNT(*) FROM $tableCharacter')
  Future<int?> getCharactersCount();
}
