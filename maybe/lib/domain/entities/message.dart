enum FromWho {
  me,
  friend,
}

class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;

Message({required this.text, this.imageUrl, required this.fromWho});

static Message fromJsonMap(Map<String, dynamic> data) {
  return Message(
    text: data['text'] as String,
    imageUrl: data['imageUrl'] as String?,
    fromWho: FromWho.values.byName(data['fromWho'] as String),
  );
}
}