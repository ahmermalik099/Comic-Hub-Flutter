import 'package:json_annotation/json_annotation.dart';
part 'character.g.dart';

@JsonSerializable()
class Character {
  String? aliases;
  String? deck;
  int? id;
  String? name;
  String? noOfMembers;


  @JsonKey(name: 'real_name')
  String? realName;

  Map<String, String>? image;

  @JsonKey(name: 'origin', readValue: _readOrigin)
  String? origin;

  Character({
    this.id=0,
    this.name='',
    this.image,
    this.origin='',
    this.aliases='',
    this.deck='',
    this.realName='',
    this.noOfMembers='',
  });

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
      
  Map<String, dynamic> toJson() => _$CharacterToJson(this);

  static String _readOrigin(Map<dynamic, dynamic> json, String key) {
    return json[key]['name'] as String;
  }
}
