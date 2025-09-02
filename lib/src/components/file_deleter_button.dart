import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mc_utility_translater/src/components/common_button.dart';
import 'package:mc_utility_translater/src/notifier/file_deleter_notifier.dart';

class FileDeleterButton extends ConsumerStatefulWidget {
  const FileDeleterButton({super.key});

  @override
  ConsumerState<FileDeleterButton> createState() => _FileDeleterButtonState();
}

class _FileDeleterButtonState extends ConsumerState<FileDeleterButton> {
  @override
  Widget build(BuildContext context) {
    return CommonButton(
      onPressed: () {
        ref.read(fileDeleterNotifierProvider.notifier).delete();
      },
      icon: Icons.delete_forever,
      text: 'ファイルを削除',
    );
  }
}
