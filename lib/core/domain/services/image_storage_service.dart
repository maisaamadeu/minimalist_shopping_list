import 'dart:io';

abstract class ImageStorageService {
  Future<String> saveImage({required String fileName, required File file});
  Future<void> deleteImage(String path);
}
