import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mc_utility_translater/src/components/common_button.dart';
import 'package:mc_utility_translater/src/notifier/file_loader_notifier.dart';

class FileLoaderButton extends ConsumerWidget {
  const FileLoaderButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CommonButton(
      onPressed: () {
        ref.read(fileLoaderNotifierProvider.notifier).loadFile();
      },
      icon: Icons.upload_file,
      text: 'ファイルを読み込む',
    );
  }
}
