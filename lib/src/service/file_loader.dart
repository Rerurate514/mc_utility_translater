import 'dart:io';
import 'package:mc_utility_translater/src/const/file_suffix.dart';
import 'package:path/path.dart' as p;

class FileLoader {
  String load(String path) {
    final String srcPath = (path.replaceAll(".jar", "") + fileSuffix);
    final String assetsDirPath = p.join(srcPath, "assets");
    final assetsDir = Directory(assetsDirPath);print(assetsDir);

    if (!assetsDir.existsSync()) {
      throw Exception('assetsディレクトリが見つかりません: $assetsDirPath');
    }

    final String? enUsJsonPath = _findEnUsJson(assetsDir);
    
    if (enUsJsonPath == null) {
      throw Exception('en_us.jsonファイルが見つかりません');
    }

    final file = File(enUsJsonPath);
    return file.readAsStringSync();
  }

  String? _findEnUsJson(Directory directory) {
    try {
      final List<FileSystemEntity> entities = directory.listSync();
      
      for (var entity in entities) {
        if (p.basename(entity.path) == 'en_us.json') {
          return entity.path;
        }

        if (entity is Directory) {
          final String? result = _findEnUsJson(entity);
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
}
