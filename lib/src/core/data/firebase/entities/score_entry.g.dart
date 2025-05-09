// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScoreEntry _$ScoreEntryFromJson(Map<String, dynamic> json) => ScoreEntry(
      uid: json['uid'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
      score: (json['score'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ScoreEntryToJson(ScoreEntry instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'username': instance.username,
      'score': instance.score,
      'createdAt': instance.createdAt.toIso8601String(),
    };
