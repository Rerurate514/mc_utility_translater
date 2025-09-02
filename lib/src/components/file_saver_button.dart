import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mc_utility_translater/src/components/common_button.dart';
import 'package:mc_utility_translater/src/notifier/file_saver_notifier.dart';

class FileSaverButton extends ConsumerStatefulWidget {
  const FileSaverButton({super.key});

  @override
  ConsumerState<FileSaverButton> createState() => _FileSaverButtonState();
}

class _FileSaverButtonState extends ConsumerState<FileSaverButton> {
  @override
  Widget build(BuildContext context) {
    return CommonButton(
      onPressed: () {
        ref.read(fileSaverNotifierProvider.notifier).save();
      },
      icon: Icons.save,
      text: 'ファイルを保存',
    );
  }
}
