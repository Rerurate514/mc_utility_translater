import 'dart:io';

import 'package:archive/archive.dart';

class ArchiveManager {
  Future<void> extractZipFile({
    required String zipFilePath,
    required String destinationDirPath,
  }) async {
    try {
      final bytes = await File(zipFilePath).readAsBytes();

      final archive = ZipDecoder().decodeBytes(bytes);

      for (final file in archive) {
        final filename = file.name;
        if (file.isFile) {
          final outputFilePath = '$destinationDirPath/$filename';
          final outputFile = File(outputFilePath);
          
          await outputFile.parent.create(recursive: true);
          
          await outputFile.writeAsBytes(file.content as List<int>);
        } else {
          await Directory('$destinationDirPath/$filename').create(recursive: true);
        }
      }
    } on FileSystemException catch (e) {
      throw Exception('ファイルシステムエラーが発生しました: ${e.message}');
    } on ArchiveException catch (_) {
      throw Exception('ZIPファイルのデコードに失敗しました');
    } catch (e) {
      throw Exception('予期せぬエラーが発生しました: $e');
    }
  }
}
