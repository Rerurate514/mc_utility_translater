
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:mc_utility_translater/src/const/file_suffix.dart';
import 'package:path/path.dart';

class FileFinder {
  static String findZipFileFullPath(FilePickerResult? file){
    if (file == null || file.files.isEmpty) {
      throw Exception("ファイルが選択されていません。${ StackTrace.current}");
    }

    final zipFilePath = file.files.first.path;
    if (zipFilePath == null) {
      throw Exception("ファイルパスがnullです。${ StackTrace.current}");
    }

    return zipFilePath;
  }

  static String? findEnUsJson(Directory directory) {
    try {
      final List<FileSystemEntity> entities = directory.listSync();
      
      for (var entity in entities) {
        if (basename(entity.path) == 'en_us.json') {
          return entity.path;
        }

        if (entity is Directory) {
          final String? result = findEnUsJson(entity);
          if (result != null) {
            return result;
          }
        }
      }
    } catch (e) {
      rethrow;
    }
    
    return null;
  }

  static String? findLangPath(FilePickerResult? file){
    final fullPath = findZipFileFullPath(file);
    final enUsPath = findEnUsJson(Directory(withoutExtension(fullPath) + fileSuffix));
    final langPath = enUsPath?.replaceAll("\\en_us.json", "");
    return langPath;
  }
}
