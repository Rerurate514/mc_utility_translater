import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mc_utility_translater/src/notifier/file_loader_notifier.dart';

class FileLoaderResult extends ConsumerWidget {
  const FileLoaderResult({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fileContentState = ref.watch(fileLoaderNotifierProvider);

    return fileContentState.when(
      data: (content) {
        if (content.isEmpty) {
          return const Text('まだファイルは読み込まれていません。');
        }
        return Text('ファイルの読み込みが完了しました。\n内容の長さ: ${content.length}');
      },
      loading: () {
        return const Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 8),
            Text('ファイルを読み込み中です...', style: TextStyle(color: Colors.blue)),
          ],
        );
      },
      error: (e, st) {
        return Text(
          'エラーが発生しました: $e',
          style: const TextStyle(color: Colors.red),
        );
      },
    );
  }
}
