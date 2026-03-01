class CategoryEntity {
  final String id;
  final String name;
  final String? imagePath;
  final DateTime createdAt;

  CategoryEntity({
    required this.id,
    required this.name,
    this.imagePath,
    required this.createdAt,
  });
}
