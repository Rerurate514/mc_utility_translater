import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mc_utility_translater/src/notifier/extract_zip_notifier.dart';

class ExtractZipResult extends ConsumerWidget {
  const ExtractZipResult({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final extractState = ref.watch(extractZipNotifierProvider);

    return extractState.when(
      data: (isFinished) {
        if(!isFinished) return const Text('解凍を行っていません。');
        return const Text('解凍が完了しました。', style: TextStyle(color: Colors.green));
      },
      loading: () {
        return const Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 8),
            Text('解凍中です...', style: TextStyle(color: Colors.blue)),
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
