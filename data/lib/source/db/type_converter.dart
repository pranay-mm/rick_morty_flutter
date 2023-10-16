import 'dart:convert';

import 'package:data/models/dt_character.dart';
import 'package:floor/floor.dart';

class DTOriginConverter extends TypeConverter<DTOrigin?, String?> {
  @override
  DTOrigin? decode(String? databaseValue) {
    if (databaseValue == null) return null;
    final decodedValue = jsonDecode(databaseValue) as Map<String, dynamic>;
    return DTOrigin.fromJson(decodedValue);
  }

  @override
  String? encode(DTOrigin? value) {
    return jsonEncode(value);
  }
}

class DTLocationConverter extends TypeConverter<DTLocation?, String?> {
  @override
  DTLocation? decode(String? databaseValue) {
    if (databaseValue == null) return null;
    final decodedValue = jsonDecode(databaseValue) as Map<String, dynamic>;
    return DTLocation.fromJson(decodedValue);
  }

  @override
  String? encode(DTLocation? value) {
    return jsonEncode(value);
  }
}

class DTEpisodeConverter extends TypeConverter<List<dynamic>?, String?> {
  @override
  List<dynamic>? decode(String? databaseValue) {
    if (databaseValue == null) return null;
    return jsonDecode(databaseValue) as List<dynamic>?;
  }

  @override
  String? encode(List<dynamic>? value) {
    return jsonEncode(value);
  }
}
