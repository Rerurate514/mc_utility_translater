import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mc_utility_translater/src/components/common_button.dart';
import 'package:mc_utility_translater/src/const/prompt.dart';
import 'package:mc_utility_translater/src/notifier/json_editor_controller_notifier.dart';

class CopyPromptButton extends ConsumerWidget {
  const CopyPromptButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CommonButton(
      onPressed: () {
        final String content = ref.read(jsonEditorControllerNotifierProvider).text;
        final String prompt = getPrompt(content);
        Clipboard.setData(ClipboardData(text: prompt)).then((_) {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('プロンプトがクリップボードにコピーされました。'),
              duration: Duration(seconds: 2),
            ),
          );
        });
      },
      icon: Icons.copy,
      text: 'プロンプトをコピー',
    );
  }
}
