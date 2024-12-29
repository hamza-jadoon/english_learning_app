class Lesson {
  final String title;
  final String description;
  final String content;
  final List<String> keywords;
  final String quizUrl;
  final int duration;
  final String level;
  final List<String> examples;
  final List<String> references;

  Lesson({
    required this.title,
    required this.description,
    required this.content,
    required this.keywords,
    required this.quizUrl,
    required this.duration,
    required this.level,
    required this.examples,
    required this.references,
  });
}

