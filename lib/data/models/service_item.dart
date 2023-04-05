class ServiceItem {
  late String id;
  String title;
  String description;
  String imageUrl;

  ServiceItem({
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  toJson() {
    return {
      'title': title,
      'short_desc': description,
      'image': imageUrl
    };
  }

  ServiceItem.fromMap(Map snapshot)
      :title = snapshot['title'] ?? '',
        description = snapshot['short_desc'] ?? '',
        imageUrl = snapshot['image'] ?? '';
}
