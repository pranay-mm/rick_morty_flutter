import 'package:domain/entities/dm_character.dart';
import 'package:rick_morty_flutter/ui/model/ui_model.dart';

class UiCharacter extends UIModel {
  String? id, name, image, status, species, gender;
  Origin? origin;
  Location? location;
  Episode? episod;

  UiCharacter(this.id, this.name, this.image, this.status, this.species,
      this.gender, this.origin, this.location, this.episod);
}

class UiCharacterList extends UIModel {
  List<UiCharacter> characters;

  UiCharacterList(this.characters);
}
