class ModelNote {
  final int? id;
  final String title;
  final String content;

  ModelNote({this.id, required this.title, required this.content});

  factory ModelNote.fromMap(Map<String, dynamic> map) {
    return ModelNote(
      id: map['id'],
      title: map['title'],
      content: map['content'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
    };
  }
}
