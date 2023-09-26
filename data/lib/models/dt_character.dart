import 'package:data/source/db/constants.dart';
import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dt_character.g.dart';

@JsonSerializable(explicitToJson: true)
@Entity(tableName: tableCharacter)
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

  @PrimaryKey()
  int? id;
  String? name, image, status, species, gender;
  final DTOrigin? origin;

  final DTLocation? location;
  final List<String>? episode;

  Map<String, dynamic> toJson() => _$DTCharacterToJson(this);
}

@JsonSerializable()
class DTOrigin {
  DTOrigin(this.url, this.name);

  factory DTOrigin.fromJson(Map<String, dynamic> json) =>
      _$DTOriginFromJson(json);

  String? url, name;

  Map<String, dynamic> toJson() => _$DTOriginToJson(this);
}

@JsonSerializable()
class DTLocation {
  DTLocation(this.url, this.name);

  factory DTLocation.fromJson(Map<String, dynamic> json) =>
      _$DTLocationFromJson(json);

  String? url, name;

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
