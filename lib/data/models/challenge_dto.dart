// lib/data/models/challenge_dto.dart
import '../../domain/entities/challenge.dart';

class ChallengeDTO {
  final String id;
  final String title;
  final String description;
  final String impact;
  final String difficulty;
  final List<String> steps;

  ChallengeDTO({
    required this.id,
    required this.title,
    required this.description,
    required this.impact,
    required this.difficulty,
    required this.steps,
  });

  factory ChallengeDTO.fromJson(Map<String, dynamic> json) {
    return ChallengeDTO(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      impact: json['impact'],
      difficulty: json['difficulty'],
      steps: List<String>.from(
          json['steps'] ?? []), // Convertimos el JSON array a List<String>
    );
  }

  Challenge toDomain() {
    return Challenge(
      id: id,
      title: title,
      description: description,
      impact: impact,
      difficulty: difficulty,
      steps: steps,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'impact': impact,
      'difficulty': difficulty,
      'steps': steps,
    };
  }
}
