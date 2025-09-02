// lib/src/widgets/json_editor.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mc_utility_translater/src/notifier/file_loader_notifier.dart';

class JsonEditor extends ConsumerStatefulWidget {
  const JsonEditor({super.key});

  @override
  ConsumerState<JsonEditor> createState() => _JsonEditorState();
}

class _JsonEditorState extends ConsumerState<JsonEditor> {
  late final TextEditingController _jsonController;

  @override
  void initState() {
    super.initState();
    _jsonController = TextEditingController();
  }

  @override
  void dispose() {
    _jsonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fileLoaderState = ref.watch(fileLoaderNotifierProvider);

    ref.listen<AsyncValue<String>>(fileLoaderNotifierProvider, (previous, next) {
      next.whenData((value) {
        if (value.isNotEmpty && _jsonController.text != value) {
          _jsonController.text = value;
        }
      });
    });

    return fileLoaderState.when(
      data: (data) => TextFormField(
        controller: _jsonController,
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
