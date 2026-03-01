import 'dart:io';

class DeleteCategoryParams {
  final String categoryId;
  final File? image;

  DeleteCategoryParams({required this.categoryId, this.image});
}
