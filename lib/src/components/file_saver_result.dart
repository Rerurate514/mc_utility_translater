import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mc_utility_translater/src/notifier/file_saver_notifier.dart';

class FileSaverResult extends ConsumerWidget {
  const FileSaverResult({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final saveState = ref.watch(fileSaverNotifierProvider);

    return saveState.when(
      data: (_) {
        return const Text('保存が完了しました。', style: TextStyle(color: Colors.green));
      },
      loading: () {
        return const Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 8),
            Text('保存中です...', style: TextStyle(color: Colors.blue)),
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
