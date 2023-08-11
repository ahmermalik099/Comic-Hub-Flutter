// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      id: json['id'] as int,
      name: json['name'] as String,
      image: Map<String, String>.from(json['image'] as Map),
      origin: Character._readOrigin(json, 'origin') as String,
      aliases: json['aliases'] as String?,
      deck: json['deck'] as String?,
      realName: json['real_name'] as String?,
    );

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'aliases': instance.aliases,
      'deck': instance.deck,
      'id': instance.id,
      'name': instance.name,
      'real_name': instance.realName,
      'image': instance.image,
      'origin': instance.origin,
    };
