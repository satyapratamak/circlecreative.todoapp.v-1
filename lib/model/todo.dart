class TodoField {
  static const createdTime = 'createdTime';
}

class Todo {
  late DateTime createdTime;
  late String title;
  String id;
  late String description;
  late bool isDone;

  Todo({
    required this.createdTime,
    required this.title,
    this.id = '',
    this.description = '',
    this.isDone = false,
  });
}
