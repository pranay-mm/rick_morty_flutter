import 'package:domain/entities/dm_character.dart';
import 'package:domain/mapper/ui_model_mapper.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty_flutter/ui/model/ui_character.dart';

@injectable
class UiCharacterListMapper
    extends UiModelMapper<CharacterList, UiCharacterList> {
  @override
  CharacterList mapToDomain(UiCharacterList modelItem) {
    return CharacterList(modelItem.characters
        .map((e) => Character(e.id, e.name, e.image, e.status, e.species,
            e.gender, e.origin, e.location, e.episode, e.isFavorited))
        .toList());
  }

  @override
  UiCharacterList mapToPresentation(CharacterList model) {
    return UiCharacterList(model.characterList
        .map((e) => UiCharacter(e.id, e.name, e.image, e.status, e.species,
            e.gender, e.origin, e.location, e.episode, e.isFavorited))
        .toList());
  }
}

@injectable
class UiCharacterMapper extends UiModelMapper<Character, UiCharacter> {
  @override
  Character mapToDomain(UiCharacter modelItem) {
    return Character(
        modelItem.id,
        modelItem.name,
        modelItem.image,
        modelItem.status,
        modelItem.species,
        modelItem.gender,
        modelItem.origin,
        modelItem.location,
        modelItem.episode,
        modelItem.isFavorited);
  }

  @override
  UiCharacter mapToPresentation(Character model) {
    return UiCharacter(
        model.id,
        model.name,
        model.image,
        model.status,
        model.species,
        model.gender,
        model.origin,
        model.location,
        model.episode,
        model.isFavorited);
  }
}
