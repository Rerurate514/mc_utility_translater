import 'dart:io';

class FileSaver {
  static const String _fileName = 'ja_jp.json';

  static Future<void> saveStringToFile(String directoryPath, String content) async {
    try {
      final directory = Directory(directoryPath);
      
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }

      final file = File('${directory.path}/$_fileName');
      await file.writeAsString(content);

    } catch (e) {
      throw Exception('Failed to save file: $e');
    }
  }
}
