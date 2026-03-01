import 'dart:io';

class UpdateCategoryParams {
  final String id;
  final String name;
  final File? image;

  UpdateCategoryParams({required this.id, required this.name, this.image});
}
