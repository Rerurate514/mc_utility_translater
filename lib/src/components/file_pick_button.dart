import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mc_utility_translater/src/components/common_button.dart';
import 'package:mc_utility_translater/src/notifier/file_pick_notifier.dart';

class FilePickButton extends ConsumerStatefulWidget {
  const FilePickButton({super.key});

  @override
  ConsumerState<FilePickButton> createState() => _FilePickButtonState();
}

class _FilePickButtonState extends ConsumerState<FilePickButton> {
  @override
  Widget build(BuildContext context) {
    return CommonButton(      
      onPressed: () {
        ref.read(filePickNotifierProvider.notifier).pickSingleFile();
      }, 
      icon: Icons.upload_file,
      text: 'ファイルを選択',
    );
  }
}
