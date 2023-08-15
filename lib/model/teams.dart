// import 'package:json_annotation/json_annotation.dart';
// part 'teams.g.dart';
//
// @JsonSerializable()
// class Teams {
//   String? aliases;
//   String? deck;
//   int id;
//   String name;
//   String? noOfMembers;
//
//   @JsonKey(name: 'real_name')
//   String? realName;
//
//   Map<String, String> image;
//
//   @JsonKey(name: 'origin', readValue: _readOrigin)
//   String? origin;
//
//   Teams({
//     required this.id,
//     required this.name,
//     required this.image,
//     this.origin,
//     this.aliases,
//     this.deck,
//     this.realName,
//     this.noOfMembers,
//   });
//
//   factory Teams.fromJson(Map<String, dynamic> json) =>
//       _$TeamsFromJson(json);
//
//   Map<String, dynamic> toJson() => _$TeamsToJson(this);
//
//   static String _readOrigin(Map<dynamic, dynamic> json, String key) {
//     return json[key]['name'] as String;
//   }
// }
