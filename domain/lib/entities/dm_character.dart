class Character {
  Character(
    this.id,
    this.name,
    this.image,
    this.status,
    this.species,
    this.gender,
    this.origin,
    this.location,
    this.episode,
  );
  final String? id, name, image, status, species, gender;

  final Origin? origin;
  final Location? location;
  final Episode? episode;
}

class Origin {
  Origin(this.id, this.name);
  final String? id, name;
}

class Location {
  Location(this.id, this.name);
  final String? id, name;
}

class Episode {
  Episode(
    this.episode,
  );
  final List<String>? episode;
}

class CharacterList {
  CharacterList(this.characterList);

  final List<Character> characterList;
}
