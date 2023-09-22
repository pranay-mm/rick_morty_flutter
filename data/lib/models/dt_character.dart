import 'package:json_annotation/json_annotation.dart';

part 'dt_character.g.dart';

@JsonSerializable()
class DTCharacter {
  DTCharacter(
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

  factory DTCharacter.fromJson(Map<String, dynamic> json) =>
      _$DTCharacterFromJson(json);

  String? id, name, image, status, species, gender;
  final DTOrigin? origin;
  final DTLocation? location;
  final DTEpisode? episode;

  Map<String, dynamic> toJson() => _$DTCharacterToJson(this);
}

@JsonSerializable()
class DTOrigin {
  DTOrigin(this.id, this.name);

  factory DTOrigin.fromJson(Map<String, dynamic> json) =>
      _$DTOriginFromJson(json);

  String? id, name;

  Map<String, dynamic> toJson() => _$DTOriginToJson(this);
}

@JsonSerializable()
class DTLocation {
  DTLocation(this.id, this.name);

  factory DTLocation.fromJson(Map<String, dynamic> json) =>
      _$DTLocationFromJson(json);

  String? id, name;

  Map<String, dynamic> toJson() => _$DTLocationToJson(this);
}

@JsonSerializable()
class DTEpisode {
  DTEpisode(this.episode);

  factory DTEpisode.fromJson(Map<String, dynamic> json) =>
      _$DTEpisodeFromJson(json);

  List<String>? episode;

  Map<String, dynamic> toJson() => _$DTEpisodeToJson(this);
}
