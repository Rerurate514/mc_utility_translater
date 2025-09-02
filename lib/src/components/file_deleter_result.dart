import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mc_utility_translater/src/notifier/file_deleter_notifier.dart';

class FileDeleterResult extends ConsumerWidget {
  const FileDeleterResult({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deleteState = ref.watch(fileDeleterNotifierProvider);

    return deleteState.when(
      data: (isFinished) {
        if(!isFinished) return const Text('削除を行っていません。');
        return const Text('ファイルの削除が完了しました。', style: TextStyle(color: Colors.green));
      },
      loading: () {
        return const Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 8),
            Text('ファイルを削除中です...', style: TextStyle(color: Colors.blue)),
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
