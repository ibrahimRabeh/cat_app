// File: lib/models/cat.dart

class Cat {
  final String name;
  final String origin;
  final double maxWeight;
  final double minWeight;
  final String length;
  final int intelligence;
  final String imageUrl;
  bool isFavourite;

  Cat({
    required this.name,
    required this.origin,
    required this.maxWeight,
    required this.minWeight,
    required this.intelligence,
    required this.length,
    required this.imageUrl,
    this.isFavourite = false,
  });
  factory Cat.fromJson(Map<String, dynamic> json) {
    return Cat(
      name: json['name'],
      origin: json['origin'],
      maxWeight: json['max_weight'],
      minWeight: json['min_weight'],
      intelligence: json['intelligence'],
      length: json['length'],
      imageUrl: json['image_link'],
      // Map other fields accordingly
    );
  }
  void toggleFavourite() {
    isFavourite = !isFavourite;
  }
}
