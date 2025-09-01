import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mc_utility_translater/src/components/file_pick_button.dart';
import 'package:mc_utility_translater/src/components/page_wrapper.dart';
import 'package:mc_utility_translater/src/notifier/file_pick_notifier.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(filePickNotifierProvider);
    return PageWrapper(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            flex: 1,
            child: Column(
              children: [
                FilePickButton()
              ]
            ),
          ),
          Flexible(
            flex: 1,
            child: Column(
              children: [
                state.when(
    // データがある場合
    data: (result) {
      if (result != null && result.files.isNotEmpty) {
        final platformFile = result.files.first;
        final String? fileName = platformFile.name;
        final int? fileSize = platformFile.size;

        return Text('選択されたファイル: $fileName ($fileSize bytes)');
      } else {
        // ファイルが選択されていない場合
        return const Text('ファイルが選択されていません。');
      }
    },
    // ロード中の場合
    loading: () => const CircularProgressIndicator(),
    // エラーの場合
    error: (e, st) => Text('エラーが発生しました: $e'),
  ),
                Text(state.toString())
              ]
            ),
          ),
        ],
      ),
    );
  }
}
