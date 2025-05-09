import 'package:json_annotation/json_annotation.dart';

part 'score_entry.g.dart';

@JsonSerializable()
class ScoreEntry {
  final String uid;
  final String email;
  final String username;
  final int score;
  final DateTime createdAt;

  ScoreEntry({
    required this.uid,
    required this.email,
    required this.username,
    required this.score,
    required this.createdAt,
  });

  factory ScoreEntry.fromJson(Map<String, dynamic> json) => _$ScoreEntryFromJson(json);

  Map<String, dynamic> toJson() => _$ScoreEntryToJson(this);
}
