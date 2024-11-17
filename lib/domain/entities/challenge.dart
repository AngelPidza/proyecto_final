class Challenge {
  final String id;
  final String title;
  final String description;
  final String impact;
  final String difficulty;
  final List<String> steps; // Agregamos los steps

  Challenge({
    required this.id,
    required this.title,
    required this.description,
    required this.impact,
    required this.difficulty,
    required this.steps,
  });
}
