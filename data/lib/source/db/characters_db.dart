import 'package:data/models/dt_character.dart';
import 'package:data/source/db/character_dao.dart';
import 'package:data/source/db/type_converter.dart';
import 'package:floor/floor.dart';
//ignore: depend_on_referenced_packages
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

part 'characters_db.g.dart';

@Database(version: 1, entities: [DTCharacter])
@TypeConverters([DTOriginConverter, DTLocationConverter, DTEpisodeConverter])
abstract class CharactersDatabase extends FloorDatabase {
  CharacterDao get characterDao;
}
