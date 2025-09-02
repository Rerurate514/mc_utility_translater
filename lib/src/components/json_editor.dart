import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mc_utility_translater/src/notifier/file_loader_notifier.dart';
import 'package:mc_utility_translater/src/notifier/json_editor_controller_notifier.dart';

class JsonEditor extends ConsumerWidget {
  const JsonEditor({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fileLoaderState = ref.watch(fileLoaderNotifierProvider);
    final jsonController = ref.watch(jsonEditorControllerNotifierProvider);

    ref.listen<AsyncValue<String>>(fileLoaderNotifierProvider, (previous, next) {
      next.whenData((value) {
        ref.read(jsonEditorControllerNotifierProvider.notifier).updateText(value);
      });
    });

    return fileLoaderState.when(
      data: (data) => TextFormField(
        controller: jsonController,
        maxLines: null,
        expands: true,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'JSONコンテンツ',
        ),
        onChanged: (value) {
          ref.read(fileLoaderNotifierProvider.notifier).updateJson(value);
        },
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text('エラー: $e')),
    );
  }
}
