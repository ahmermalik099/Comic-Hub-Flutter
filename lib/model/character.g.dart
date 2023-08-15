// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      image: (json['image'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      origin: Character._readOrigin(json, 'origin') as String? ?? '',
      aliases: json['aliases'] as String? ?? '',
      deck: json['deck'] as String? ?? '',
      realName: json['real_name'] as String? ?? '',
      noOfMembers: json['count_of_team_members'] as int? ?? 0,
    );

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'aliases': instance.aliases,
      'deck': instance.deck,
      'id': instance.id,
      'name': instance.name,
      'noOfMembers': instance.noOfMembers,
      'real_name': instance.realName,
      'image': instance.image,
      'origin': instance.origin,
    };
