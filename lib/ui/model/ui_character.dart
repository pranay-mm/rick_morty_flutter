import 'package:domain/entities/dm_character.dart';
import 'package:rick_morty_flutter/ui/model/ui_model.dart';

class UiCharacter extends UIModel {
  int? id;
  String? name, image, status, species, gender;
  Origin? origin;
  Location? location;
  List<dynamic>? episode;
  bool isFavorited;

  UiCharacter(this.id, this.name, this.image, this.status, this.species,
      this.gender, this.origin, this.location, this.episode,this.isFavorited);

  String episodesList() {
    if (episode != null && episode?.isNotEmpty == true) {
      return episode
              ?.map((e) => e.substring(e.lastIndexOf('/') + 1))
              .toList()
              .join(',') ??
          '';
    } else {
      return '';
    }
  }
}

class UiCharacterList extends UIModel {
  List<UiCharacter> characters;

  UiCharacterList(this.characters);
}
