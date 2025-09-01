import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mc_utility_translater/src/notifier/file_pick_notifier.dart';

class FilePickResult extends ConsumerStatefulWidget {
  const FilePickResult({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FilePickResultState();
}

class _FilePickResultState extends ConsumerState<FilePickResult> {

  @override
  Widget build(BuildContext context) {
  final fileState = ref.watch(filePickNotifierProvider);

  return fileState.when(
    data: (result) {
      if (result != null) {
        final fileName = result.files.first.name;
        return Text('ファイルが選択されました: $fileName');
      }
      return Text('ファイルを選択してください。');
    },
    loading: () => const Center(child: CircularProgressIndicator(),),
    error: (e, st) => Text('エラー: $e'),
  );
  }
}
