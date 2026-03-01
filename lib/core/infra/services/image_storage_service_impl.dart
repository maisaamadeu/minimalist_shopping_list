import 'dart:io';

import 'package:minimalist_shopping_list/core/domain/services/image_storage_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class LocalImageStorageServiceImpl implements ImageStorageService {
  @override
  Future<String> saveImage({
    required String fileName,
    required File file,
  }) async {
    final directory = await getApplicationDocumentsDirectory();

    final imagesDir = Directory('${directory.path}/images');

    if (!await imagesDir.exists()) {
      await imagesDir.create(recursive: true);
    }

    final fileName = '${const Uuid().v4()}.${file.path.split('.').last}';

    final newPath = '${imagesDir.path}/$fileName';

    final newFile = await file.copy(newPath);

    return newFile.path;
  }

  @override
  Future<void> deleteImage(String path) async {
    final file = File(path);

    if (await file.exists()) {
      await file.delete();
    }
  }
}
