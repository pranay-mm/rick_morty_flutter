import 'package:data/models/dt_character.dart';
import 'package:data/models/dt_character_list.dart';
import 'package:domain/entities/dm_character.dart';
import 'package:injectable/injectable.dart';
import 'package:data/mapper/entity_mapper.dart';

@injectable
class CharacterListMapper
    extends EntityMapper<CharacterList, DTCharactersList> {
  CharacterListMapper(this.characterMapper);

  CharacterMapper characterMapper;

  @override
  DTCharactersList mapToData(CharacterList model) {
    return DTCharactersList(
      model.characterList.map((e) => characterMapper.mapToData(e)).toList(),
    );
  }

  @override
  CharacterList mapToDomain(DTCharactersList entity) {
    return CharacterList(entity.charactersList
        .map((e) => characterMapper.mapToDomain(e))
        .toList());
  }
}

@injectable
class CharacterMapper extends EntityMapper<Character, DTCharacter> {
  @override
  DTCharacter mapToData(Character model) {
    return DTCharacter(
        model.id,
        model.name,
        model.image,
        model.status,
        model.species,
        model.gender,
        DTOrigin(model.origin?.id, model.origin?.name),
        DTLocation(model.location?.id, model.location?.name),
        DTEpisode(model.episode?.episode));
  }

  @override
  Character mapToDomain(DTCharacter entity) {
    return Character(
      entity.id,
      entity.name,
      entity.image,
      entity.status,
      entity.species,
      entity.gender,
      Origin(entity.origin?.id, entity.origin?.name),
      Location(entity.location?.id, entity.location?.name),
      Episode(entity.episode?.episode),
    );
  }
}