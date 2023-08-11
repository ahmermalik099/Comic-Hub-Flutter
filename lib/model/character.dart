import 'package:json_annotation/json_annotation.dart';
part 'character.g.dart';

@JsonSerializable()
class Character {
  String? aliases;
  String? deck;
  int id;
  String name;

  @JsonKey(name: 'real_name')
  String? realName;

  Map<String, String> image;

  @JsonKey(name: 'origin', readValue: _readOrigin)
  String origin;

  Character({
    required this.id,
    required this.name,
    required this.image,
    required this.origin,
    this.aliases,
    this.deck,
    this.realName,
  });

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
      
  Map<String, dynamic> toJson() => _$CharacterToJson(this);

  static String _readOrigin(Map<dynamic, dynamic> json, String key) {
    return json[key]['name'] as String;
  }
}
