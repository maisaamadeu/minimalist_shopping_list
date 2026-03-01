import 'dart:io';

import 'package:uuid/uuid.dart';

class CreateCategoryParams {
  final String id;
  final String name;
  final File? image;

  CreateCategoryParams({required this.name, this.image, String? id})
    : id = id ?? const Uuid().v4();

  CreateCategoryParams copyWith({String? name, File? image}) {
    return CreateCategoryParams(
      id: id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }
}
