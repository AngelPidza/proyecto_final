// lib/data/models/challenge_dto.dart
import '../../domain/entities/challenge.dart';

class ChallengeDTO {
  final String _id;
  final String title;
  final String description;
  final String impact;
  final String difficulty;
  final List<String> steps;

  ChallengeDTO({
    required String id,
    required this.title,
    required this.description,
    required this.impact,
    required this.difficulty,
    required this.steps,
  }) : _id = id;

  factory ChallengeDTO.fromJson(Map<String, dynamic> json) {
    return ChallengeDTO(
      id: json['_id'], // Asegúrate de que la clave es '_id' y no 'id'
      title: json['title'],
      description: json['description'],
      impact: json['impact'],
      difficulty: json['difficulty'],
      steps: List<String>.from(
          json['steps'] ?? []), // Convierte correctamente el array
    );
  }

  // Convierte el DTO a un objeto de dominio (Challenge)
  Challenge toDomain() {
    return Challenge(
      id: _id,
      title: title,
      description: description,
      impact: impact,
      difficulty: difficulty,
      steps: steps,
    );
  }

  // Convierte el DTO a un Map para enviar a la base de datos o API
  Map<String, dynamic> toJson() {
    return {
      '_id': _id, // Asegúrate de usar '_id' en lugar de 'id' para las claves
      'title': title,
      'description': description,
      'impact': impact,
      'difficulty': difficulty,
      'steps': steps,
    };
  }
}
