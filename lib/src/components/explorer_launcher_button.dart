import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mc_utility_translater/src/components/common_button.dart';
import 'package:mc_utility_translater/src/const/file_suffix.dart';
import 'package:mc_utility_translater/src/notifier/file_pick_notifier.dart';
import 'package:mc_utility_translater/src/service/explorer_launcher.dart';
import 'package:mc_utility_translater/src/service/file_finder.dart';
import 'package:path/path.dart';

class ExplorerLauncherButton extends ConsumerWidget {
  const ExplorerLauncherButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CommonButton(
      onPressed: () {
        final file = ref.read(filePickNotifierProvider);
        final path = FileFinder.findZipFileFullPath(file.value);
        ExplorerLauncher.openExplorer(withoutExtension(path) + fileSuffix);
      },
      icon: Icons.folder_open,
      text: 'ファイルエクスプローラーを開く',
    );
  }
}
