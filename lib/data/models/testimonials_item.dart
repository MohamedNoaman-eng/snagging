class TestimonialsItem {
  late String id;
  String name;
  String position;
  String content;
  String imageUrl;

  TestimonialsItem({
    required this.name,
    required this.position,
    required this.content,
    required this.imageUrl,
  });

  toJson() {
    return {
      'name': name,
      'position': content,
      'content': imageUrl,
      'imageUrl': imageUrl,
    };
  }

  TestimonialsItem.fromMap(Map snapshot)
      :name = snapshot['name'] ?? '',
        position = snapshot['position'] ?? '',
        content = snapshot['content'] ?? '',
        imageUrl = snapshot['image'] ?? '';
}
