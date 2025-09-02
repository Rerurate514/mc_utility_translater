import 'dart:io';

class FileDeleter {
  static Future<void> deleteFilesExcept(String directoryPath) async {
    final filesToKeep = ["pack.mcmeta", "ja_jp.json"];
    final directory = Directory(directoryPath);

    if (!await directory.exists()) {
      return;
    }

    final entities = directory.list(recursive: true);

    await for (final entity in entities) {
      if (entity is File) {
        final fileName = entity.uri.pathSegments.last;

        if (!filesToKeep.contains(fileName)) {
          try {
            await entity.delete();
          } catch (e) {
            rethrow;
          }
        }
      }
    }
  }
}
