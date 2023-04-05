class PackageItem {
  late String id;
  String name;
  String price;
  String notes;


  PackageItem({
    required this.name,
    required this.price,
    required this.notes,
  });

  toJson() {
    return {
      'name': name,
      'price':price,
      'notes': notes,
    };
  }

  PackageItem.fromMap(Map snapshot)
      :name = snapshot['name'] ?? '',
        notes = snapshot['notes'] ?? '',
        price = snapshot['price'] ?? '';
}
