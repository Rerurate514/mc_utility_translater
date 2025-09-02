import 'dart:io';
import 'package:mc_utility_translater/src/const/file_suffix.dart';
import 'package:mc_utility_translater/src/service/file_finder.dart';
import 'package:path/path.dart' as p;

class FileLoader {
  String load(String path) {
    final String srcPath = (path.replaceAll(".jar", "") + fileSuffix);
    final String assetsDirPath = p.join(srcPath, "assets");
    final assetsDir = Directory(assetsDirPath);

    if (!assetsDir.existsSync()) {
      throw Exception('assetsディレクトリが見つかりません: $assetsDirPath');
    }

    final String? enUsJsonPath = FileFinder.findEnUsJson(assetsDir);
    
    if (enUsJsonPath == null) {
      throw Exception('en_us.jsonファイルが見つかりません');
    }

    final file = File(enUsJsonPath);
    return file.readAsStringSync();
  }
}
