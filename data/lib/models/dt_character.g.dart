// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dt_character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DTCharacter _$DTCharacterFromJson(Map<String, dynamic> json) => DTCharacter(
      json['id'] as int?,
      json['name'] as String?,
      json['image'] as String?,
      json['status'] as String?,
      json['species'] as String?,
      json['gender'] as String?,
      json['origin'] == null
          ? null
          : DTOrigin.fromJson(json['origin'] as Map<String, dynamic>),
      json['location'] == null
          ? null
          : DTLocation.fromJson(json['location'] as Map<String, dynamic>),
      json['episode'] as List<dynamic>?,
      json['isFavorited'] as bool,
    );

Map<String, dynamic> _$DTCharacterToJson(DTCharacter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'status': instance.status,
      'species': instance.species,
      'gender': instance.gender,
      'origin': instance.origin?.toJson(),
      'location': instance.location?.toJson(),
      'episode': instance.episode,
      'isFavorited': instance.isFavorited,
    };

DTOrigin _$DTOriginFromJson(Map<String, dynamic> json) => DTOrigin(
      json['url'] as String?,
      json['name'] as String?,
    );

Map<String, dynamic> _$DTOriginToJson(DTOrigin instance) => <String, dynamic>{
      'url': instance.url,
      'name': instance.name,
    };

DTLocation _$DTLocationFromJson(Map<String, dynamic> json) => DTLocation(
      json['url'] as String?,
      json['name'] as String?,
    );

Map<String, dynamic> _$DTLocationToJson(DTLocation instance) =>
    <String, dynamic>{
      'url': instance.url,
      'name': instance.name,
    };

DTEpisode _$DTEpisodeFromJson(Map<String, dynamic> json) => DTEpisode(
      (json['episode'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DTEpisodeToJson(DTEpisode instance) => <String, dynamic>{
      'episode': instance.episode,
    };
