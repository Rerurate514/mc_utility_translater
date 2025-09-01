import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mc_utility_translater/src/notifier/file_pick_notifier.dart';

class FilePickButton extends ConsumerStatefulWidget {
  const FilePickButton({super.key});

  @override
  ConsumerState<FilePickButton> createState() => _FilePickButtonState();
}

class _FilePickButtonState extends ConsumerState<FilePickButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        ref.read(filePickNotifierProvider.notifier).pickSingleFile();
      },
      icon: const Icon(Icons.upload_file),
      label: const Text('ファイルを選択'),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
    );
  }
}
