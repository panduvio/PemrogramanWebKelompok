class TodoEntity {
  final String title;
  final String description;
  bool progress;

  TodoEntity({
    required this.title,
    required this.description,
    this.progress = false,
  });
}
