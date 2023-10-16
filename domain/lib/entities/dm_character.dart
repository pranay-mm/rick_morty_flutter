class Character {
  Character(this.id, this.name, this.image, this.status, this.species,
      this.gender, this.origin, this.location, this.episode, this.isFavorited);
  final int? id;
  final String? name, image, status, species, gender;
  final isFavorited;
  final Origin? origin;
  final Location? location;
  final List<dynamic>? episode;
}

class Origin {
  Origin(this.url, this.name);
  final String? url, name;
}

class Location {
  Location(this.url, this.name);
  final String? url, name;
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
