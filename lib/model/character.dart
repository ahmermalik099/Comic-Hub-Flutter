import 'package:json_annotation/json_annotation.dart';
part 'character.g.dart';

@JsonSerializable()
class Character {
  String? aliases;
  String? deck;
  int? id;
  String? name;
  int? noOfMembers;


  @JsonKey(name: 'real_name')
  String? realName;

  Map<String, String>? image;

  @JsonKey(name: 'origin', readValue: _readOrigin)
  String? origin;

  Character({
    required this.id,
    required this.name,
    required this.image,
    this.origin='',
    this.aliases='',
    this.deck='',
    this.realName='',
    this.noOfMembers=0,
  });

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
      
  Map<String, dynamic> toJson() => _$CharacterToJson(this);

  static dynamic _readOrigin(Map<dynamic, dynamic> json, String key) {
    return json[key]?['name'] ?? '';
  }
}
