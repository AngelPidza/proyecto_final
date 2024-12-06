// lib/domain/entities/challenge.dart
class Challenge {
  final String
      id; // El id no debe ser privado en esta clase, ya que lo necesitas acceder
  final String title;
  final String description;
  final String impact;
  final String difficulty;
  final List<String> steps;

  Challenge({
    required this.id,
    required this.title,
    required this.description,
    required this.impact,
    required this.difficulty,
    required this.steps,
  });
}
